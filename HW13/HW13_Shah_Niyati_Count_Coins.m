%  Function to count the number of 
% coins in the image

% Author: Niyati Shah (nxs6032)

% Cite: https://www.mathworks.com/matlabcentral/fileexchange/26978-hough-transform-for-circles
% David Young, Hough Transform for circles Ver:4Mar2016 Date:20Nov2016

function HW13_Shah_Niyati_Count_Coins(input_image)
     %
     % if no input is given use 
     % the given image
     %
     if nargin < 1
        input_image =  'IMG_COINS_4825_1024_x_1366.jpg';
     end

    %
    % Read the given image passed by the function
    % and convert it to hsv format
    %
    im = im2double(imread(input_image));
    im_hsv = rgb2hsv(im);
    %
    % Filter the image to remove unwanted noise
    %
    fltr = fspecial('gaussian', [5 5], 1 );
    im_fil          = imfilter( im_hsv, fltr, 'same', 'repl' );

    %
    % Perform Quantiation with quantization level
    % of 5 only on the luminance channel of image
    %
    quant_level = 5;
    im_quant = round( im_fil(:,:,3) * (quant_level-1) ) ./ (quant_level-1);

    %
    % Convert the image into a binary image
    %
    im_quant(im_quant<=0.5) = 0;
    im_quant(im_quant>0.5) = 1;
    
    %
    % Detect the edges in the image
    %
    edge_image = edge(im_quant, 'canny');

    %
    % Perform circular hough transform on the image
    %
    
    %
    % Choose a range for the radius and run the circular hough on it.
    %
    radii = 50:1:150;
    h = circle_hough(edge_image, radii, 'same', 'normalise');

    %
    % Use the output of hough circle and find peaks in the image
    %
    peaks = circle_houghpeaks(h,radii,'nhoodxy',1,'Nhoodr',1 );

    %
    % Display the input image and mark the peaks
    % From the 3d output of peaks transform use the 
    % radius and the distance to mark the circles in green.
    %
    imshow(im);
    title('Detect circles');
    hold on;
    for peak = peaks
        [x,y] = circlepoints(peaks(3));
        plot(x+peak(1), y+peak(2), 'g-');
    end
    hold off;


end