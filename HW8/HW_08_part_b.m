% Use color quantization to emphasize
% the balls and tiles in the game of blokus
% Author: Niyati Shah (nxs6032)

function HW_08_part_b(input_image)
    %
    % Read the image
    %
    im = im2double(imread(input_image));
    
    %
    % Convert the image in HSV colorspace
    %
    im_hsv = rgb2hsv(im);
    
    %
    % Perform Quantiation with quantization level
    % as 5
    %
    quant_level = 5;
    output = perform_quantization(im_hsv, quant_level);
    
    %
    % Display the output only in Saturation channel of HSV colorspace.
    %
    imshow( output(:,:,2) );
    str1 = sprintf('Colormap: S channel of HSV, Quantiation: %i', quant_level);
    title(str1);
    
end