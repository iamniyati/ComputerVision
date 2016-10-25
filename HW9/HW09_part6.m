% Main run function to implement kmeans to 
% cartoonize the portrait.
% $input parameter : image file
% Author: Niyati Shah (nxs6032)

function HW09_part6( input_image  )

    %
    % Read given image
    %
    im = (im2double(imread(input_image)));
    
    %
    % Convert given image into LAB and gray space
    %
    im_lab = rgb2lab(im);
    im_gry = rgb2gray(im);
    
    %
    % USe grayscale image to create edge image
    % using edge function.
    % Inverse the given image and convert it into an binary image.
    %
    Sobel_edge = 1-(edge(im_gry,'sobel'));
    Binary_img = imbinarize(Sobel_edge);

    %
    % Approximate pixels
    %
    target_size = 1220;         
    %
    % Get dimensions of image
    %
    dims = size(im_lab);
    
    %
    % Get K value of kmeans algorithm
    %
    k = ceil( ( dims(1)*dims(2) / target_size )^(1/2) );
    
    %
    % Seperate all channels of the image.
    %
    reds        = im_lab(:,:,1);
    grns        = im_lab(:,:,2);
    blus        = im_lab(:,:,3);
    
    %
    % Choose a weight value
    %
    wt = 1/10;
    
    %
    % Create a meshgrid using the dimensions of the given image' 
    %
    [xs ys]     = meshgrid( 1:dims(2), 1:dims(1));
    
    %
    % Create a numeric matrix of image 
    %
    attributes  = [ xs(:)*wt, ys(:)*wt ,double(reds(:)), double(grns(:)), double(blus(:)) ];
    
    %
    % Create custer indices by using the Kmeans algorithm using the
    % cityblock distance
    %
    cluster_id_city  = kmeans( attributes, k,'Replicate', 3,'MaxIter', 250  );
      
    %
    % Reshape the image from given dimensions and clusters
    %
    im_new      = reshape( cluster_id_city, dims(1), dims(2) );
    figure;
    imagesc(im_new);
    str1 = sprintf('Part 6:Original image');
        title(str1);
    pause(5);
    %
    % Add edge found in image to new image
    % 
    
    imshowpair(im_new,Binary_img,'blend');
    str1 = sprintf('Part 6: Edge image added to original');
        title(str1);
    pause(5);
    %
    % Convert image into different colormaps and display them
    %
    imshow(im_new,jet);
    str1 = sprintf('Part 6:Colormap Jet');
        title(str1);
    pause(5);

    imshow(im_new,prism);
    str1 = sprintf('Part 6:Colormap Prism');
        title(str1);
    pause(5);

    imshow(im_new,flag);
    str1 = sprintf('Part 6:Colormap Flag');
        title(str1);

    
end