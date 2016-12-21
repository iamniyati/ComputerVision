% Main run function to start Hw13: Counting
% coins in the image

% Author: Niyati Shah (nxs6032)

% Cite: https://www.mathworks.com/matlabcentral/fileexchange/26978-hough-transform-for-circles
% David Young, Hough Transform for circles Ver:4Mar2016 Date:20Nov2016

function HW13_Shah_Niyati_main( input_image  )
    addpath( '../TEST_IMAGES/' );
    addpath( '../../TEST_IMAGES/' );
    

     %
     % if no input is given use 
     % the given image
     %
     if nargin < 1
        input_image =  'IMG_COINS_4825_1024_x_1366.jpg';
     end
    
     %
     % Run coin count fucntion
     %
     HW13_Shah_Niyati_Count_Coins(input_image);

end