% Main run function to implement kmeans algorithm.

% Author: Niyati Shah (nxs6032)

function HW10_Shah_Niyati_main(   )
    addpath( '../TEST_IMAGES/' );
    addpath( '../../TEST_IMAGES/' );
    
    %
    % Create a cell array and add all the 
    % images required for the assignment.
    %
    images = { ...
         'IMG_0190__RASPBERRIES__smr.jpg' ...
        ,'IMG_0828__COLOR_GOLFBALLS__smr.jpg' ...
    };

    %
    % Start part 1 of the homework
    % Classifying rasberries
    %
     img = 1
     HW10_Shah_Niyati_part_a(cell2mat(images(img)));
     pause;
     
    %
    % Start part 2 of the homework
    % Classifying golfballs
    %
     img = 2
     HW10_Shah_Niyati_part_b(cell2mat(images(img)));
    
end