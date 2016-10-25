
% Main run function to implement kemans wih k as 64
% using euclideam distance versus citybloack distance.
% $input parameter : image file
% Author: Niyati Shah (nxs6032)

function HW09_part5a( input_image  )
    %
    % Read the image and convert it to double
    %
    im =rgb2lab( im2double(imread(input_image)));
    
    %
    % K value of kmeans algorithm set to 64
    %
    k = 64;
    
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
    cluster_id_city  = kmeans( attributes, k, 'Dist', 'Cityblock','Replicate', 2, 'EmptyAction', 'drop' );
    
    %
    % Create custer indices by using the Kmeans algorithm using the
    % Euclidean distance
    %
     cluster_id_Eucl  = kmeans( attributes, k,'Replicate', 3, 'MaxIter', 250  );
    
    %
    % Reshape the image from given dimensions and clusters
    %
    im_new_city      = reshape( cluster_id_city, dims(1), dims(2) );
     im_new_Eucl      = reshape( cluster_id_Eucl, dims(1), dims(2) );
    
    figure;
    imagesc(im_new_city); 
    
     imagesc(im_new_Eucl);
end