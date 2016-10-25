% Main run function to implement kmeans with k value
% as 64 and using rgb, hsv, xyz,ycbcr, and lab.
% $input parameter : image file
% Author: Niyati Shah (nxs6032)

function HW09_part4( input_image  )
    %
    % Read given image and convert to different formats
    % and store in an array
    %
    im_RGB = im2double(imread(input_image));
    im_HSV = rgb2hsv(im_RGB);
    im_XYZ = rgb2xyz(im_RGB);
    im_YCbCr = rgb2ycbcr(im_RGB);
    im_LAB = rgb2lab(im_RGB);
    Image_format = {im_RGB,im_HSV, im_XYZ, im_YCbCr, im_LAB};
    %
    % Array of different colormaps
    %
    images = { 'RGB','HSV','XYZ','YCbCr','LAB'};
    
    %
    % Select k (quantization) value as 64
    %
    quntize = 64;
    
    %
    % Try different colormap image on the given K (quantize) level
    % using rgb2ind function
    %
     for image = (1:5)
        [imquant, map] = rgb2ind(cell2mat(Image_format(image)),quntize,'nodither');
        imagesc(imquant);
        colormap(map);
        str1 = sprintf('Part 4:Colormap: %s',images{image});
        title(str1);
        pause;
    end
    
end