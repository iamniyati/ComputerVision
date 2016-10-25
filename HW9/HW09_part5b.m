% Main run function to implement kemans with different
% attribute.
% $input parameter : image file
% Author: Niyati Shah (nxs6032)

function HW09_part5b( input_image  )
    %
    % Read the image and convert it to double and LAB
    %
    im = rgb2lab(im2double(imread(input_image)));
    
    %
    % K value of kmeans algorithm set to 128
    %
    k = 128;

    %
    % Get Size of image
    %
    dims = size(im);
    
    %
    % Seperate all channels of the image.
    %
    reds        = im(:,:,1);
    grns        = im(:,:,2);
    blus        = im(:,:,3);
    
    %
    % Choose a weight value
    %
    wt = 1/9;
    
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
    cluster_id  = kmeans( attributes, k,'Dist', 'Cityblock','Replicate', 3,  'MaxIter', 250, 'start', 'cluster');
      
    %
    % Reshape the image from given dimensions and clusters
    %
    im_new      = reshape( cluster_id, dims(1), dims(2) );
    imagesc(im_new); 
  
    
end