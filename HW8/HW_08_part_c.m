% Use color quantization to emphasize
% the animals in the image
% Author: Niyati Shah (nxs6032)


function HW_08_part_c(input_image)
     %
    % read the image
    %
    im = im2double(imread(input_image));
    
    %
    % Covert to HSV color space
    %
    im_hsv = rgb2hsv(im);
    
    %
    % Perform Quantiation with quantization level
    % as 9
    %
    quant_level = 9;
    output = perform_quantization(im_hsv, quant_level);
    
    %
    % Display the output only in Hue channel of HSV colorspace.
    %
    
    imshow( output(:,:,1) );
    str1 = sprintf('Colormap: H channel of HSV, Quantiation: %i', quant_level);
    title(str1);
    pause;
    
    
end