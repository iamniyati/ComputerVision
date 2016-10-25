% Main run function to implement different k values.
% $input parameter : image file
% Author: Niyati Shah (nxs6032)

function HW09_part3(input_image)

    % Read given image
    im = im2double(imread((input_image)));
    % Create a gaussian filter with size as 5 and sigma as 2.
    
    fltr = fspecial('Gaussian', 5 , 10 );
    
    % USe the above filter to remove noise from the image and unimportant
    % edges from the image by using the imfilter fucntion where the
    % output matrix is same as the input matrix and the replicating 
    % the boundaries
    im_fil = imfilter( im, fltr, 'same', 'repl' );
%     imagesc(im_fil);
    %
    % Array that has different K levels (levels for quantization)  
    %
    quant   = [ 1 2 4 8 16 32 40 50 60 70 80 90 100 128 256 ];
    
    %
    % Try different K (quantize levels) on the given image
    % using rgb2ind function
    %
     for quntize = quant(1,:) 
        [imquant, map] = rgb2ind(im_fil,quntize,'nodither');
        imagesc(imquant);
        colormap(map);
        str1 = sprintf('Part 3:K value is %i', quntize);
        title(str1);
        pause;
     end
     
end