% Segment the image to get the location
% of squares on Macbeth color checker
% Author: Niyati Shah (nxs6032)

function HW_08_part_e(input_image)
    %
    % read the image
    %
    im = im2double(imread(input_image));
    
    %
    % Convert the image into HSV space
    %
    im_hsv      = rgb2hsv(im);
    
    %
    % Perform Quantiation with quantization level
    % as 6
    %
    quant_level = 6;
    output = perform_quantization(im_hsv, quant_level);
    
    %
    % Display the output only in V channel of HSV colorspace.
    %
    imshow( output(:,:,3) );
    str1 = sprintf('Colormap: V channel of HSV, Quantiation: %i', quant_level);
    title(str1);
    
end