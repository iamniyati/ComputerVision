% Main run function to start Hw15: Trasform 
% a skewed image.

% Author: Niyati Shah (nxs6032)


function HW15_Shah_Niyati_main( input_image  )
    addpath( '../TEST_IMAGES/' );
    addpath( '../../TEST_IMAGES/' );
    

     %
     % if no input is given use 
     % the given image
     %
     if nargin < 1
        input_image =  'IMG_5802.jpg';
     end
  
     %
     % Run the tranformation image function
     %
     transform_image(input_image);

end