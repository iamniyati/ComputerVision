% segment the image to get the
% dragon fly, geco, and golf balls
% Author: Niyati Shah (nxs6032)

function HW_08_part_d(input_image)
    
    %
    % read the image
    %
    im = im2double(imread(input_image));

    %
    % Apply Gaussian filter to remove noise
    %
    fltr = fspecial('Gaussian',3 , 3 );
    im_fil = imfilter( im, fltr, 'same', 'repl' );
    
    %
    % Convert the image into HSV color space
    %
    im_hsv = rgb2hsv(im_fil );
 
    %
    % Perform Quantiation with quantization level
    % as 4 using rgb2ind fucntion
    %
    quant_level = 4;
    [im_ind,~] = rgb2ind(im_hsv,quant_level,'nodither');
    
    %
    % Display the output 
    %
    imagesc( im_ind);
    str1 = sprintf('Colormap: HSV, Quantiation: %i', quant_level);
    title(str1);
   
  
    
end