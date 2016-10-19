% Function to identify licence plate by
% color quantization. 
% Author: Niyati Shah (nxs6032)

function HW_08_part_a(input_image)
    %
    % Read the image
    % Keeping the image in rgb space
    %
    im_rgb = im2double(imread(input_image));
    
    %
    % Perform Quantiation with quantization level
    % as 6
    %
    quant_level = 6;
    output = perform_quantization(im_rgb, quant_level);
    
    %
    % Display the output only in R channel of RGB colorspace.
    %
    imshow( output(:,:,1) );
    str1 = sprintf('Colormap: R channel of RGB, Quantiation: %i', quant_level);
    title(str1);
    
    
    
end