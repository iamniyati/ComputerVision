% Function to Classify golf balls in the image
% $input parameter : image file
% Author: Niyati Shah (nxs6032)
% Referenced from Dr. Kinsman's DEMO__GET_BALL_COLORS_released

function HW10_Shah_Niyati_part_b(input_image)
    
    %
    % if no input given use the given image
    %
    if nargin < 1
        input_image = 'IMG_0828__COLOR_GOLFBALLS__smr.jpg';
    end
    
    %
    % Read given image and convert to grayscale
    %
    im_gray = rgb2gray(im2double(imread(input_image)));

    %
    % Apply the range filter on the given image 
    % and invert it.
    %
    range_fil1 = rangefilt(im_gray);
    range_inv = 1-range_fil1;
   
    %
    % Apply the gaussian filter to remove noise
    %
    gfltr = fspecial('Gaussian', 5 , 10 );
    g_fil  = imfilter(range_inv , gfltr, 'same', 'repl' );

    % 
    % Create a structuring element of shape square and 
    % distance 2. And perform the opening morphological
    % operation
    %
    sel = strel('square',2);
    open_img = imopen(g_fil,sel);
    
    %
    % Fill areas that are surrounded by light region
    %
    Fill_img = imfill(open_img);

   
    % 
    % Create a structuring element of shape disk and 
    % distance 3. And perform the closing morphological
    % operation
    %
    sel2 = strel('square',3);
    close_img = imclose(Fill_img,sel2);

    %
    % Apply filter to remove unwanted noise from image
    %
     g_fil2  = imfilter(close_img , gfltr, 'same', 'repl' );
     
     %
     % CHange the contrast of the image by the exponential factor
     % of 9.
     % 
     img_cont = g_fil2.^(10);

     %
     % Create a histogram to check where the values lie.
     % amd choose a value that can be used.
     % 
     histogram(img_cont);
      pause;
     thresh = 0.34;
     
     %
     % From the image choose all value above threshold
     %
     final_img = img_cont>thresh;
     
     %
     % Display the final image 
     % and store it 
      imshow(final_img);
      imwrite(final_img, 'HW10_Shah_Niyati_part_b_output.jpg');
      title('Part A: Final threshold image ', 'FontSize', 20, 'FontWeight', 'bold' );
    
end