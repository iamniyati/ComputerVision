% Main run function to implement the canny edge detector.
% $input parameter : image file

function HW07_Shah_Niyati_main(   )
    addpath( '../TEST_IMAGES/' );
    addpath( '../../TEST_IMAGES/' );
    
    %
    % Read the image peppers.jpg and
    % convert to double and display the image
    %
    im = im2double(imread('peppers.png'));
    imagesc(im);
    pause(5);
    %
    % Call function maximal_edges to process
    % Canny edge detector algorithm.
    %
    maximal_edges(im);
    
    
    
    
    
    
end