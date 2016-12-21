% Main run function to start Hw14: Process a
%  Video to generate an image that shows 
% the change in each frame

% Author: Niyati Shah (nxs6032)

function HW14_Shah_Niyati_main( input_video  )
    addpath( '../TEST_IMAGES/' );
    addpath( '../../TEST_IMAGES/' );
    

     %
     % if no input is given use 
     % the given video
     %
     if nargin < 1
        input_video =  'TEA_in_TAP_WATER.mov';
     end
    
     %
     % Run the strip image function to generate
     % an image that shows he change in each frame
     %
     generate_strip_image(input_video);

end