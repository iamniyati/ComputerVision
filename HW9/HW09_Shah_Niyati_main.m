% Main run function to implement kmeans algorithm.

% Author: Niyati Shah (nxs6032)

function HW09_Shah_Niyati_main(   )
    addpath( '../TEST_IMAGES/' );
    addpath( '../../TEST_IMAGES/' );
    
    %
    % Create a cell array and add all the 
    % images required for the assignment.
    %
    images = { ...
     'BALLS_FOUR_5244_shrunk.jpg' ...
    ,'MACBETH_HW09_shrunk.jpg' ...
    ,'POCKET_CHANGE_4825_shrunk.jpg' ...
    ,'Niyati_1.jpg'...
    };

    %
    % Run part 3 of the homework on image 1 and 2
    %
    for img = (1:2)
        HW09_part3(cell2mat(images(img)));
        pause;
    end
    
    %
    % Run part 4 of the homework on image 1,2 and 3
    %
    for img = (1:3)
        HW09_part4(cell2mat(images(img)));
        pause;
    end
    
    %
    % Run part 5a of the homework on image 2
    %        
    img = 2;
    HW09_part5a(cell2mat(images(img)));
    pause;
    
    %
    % Run part 5b of the homework on image 3
    %        
    img = 3;
    HW09_part5b(cell2mat(images(img)));
    pause;
    
    %
    % Run part 6 of the homework on image 4
    %    
    img = 4;
    HW09_part6(cell2mat(images(img)));
    

end