% Main run function to implement color Quantization.s
% Author: Niyati Shah (nxs6032)

function HW08_Shah_Niyati_main(   )
    addpath( '../TEST_IMAGES/' );
    addpath( '../../TEST_IMAGES/' );
    
    %
    % Create a cell array and add all the 
    % images required for the assignment.
    %
    images = { ...
     'ANPR_0135.jpg' ...
    ,'ANPR_0241.jpg' ...
    ,'ANPR_0244.jpg'  ...
    ,'ANPR_IMG_20160305.jpg' ...
    ,'ANPR_IMG_2387.jpg' ...
    ,'ANPR_Poor_Parking.jpg' ...
    ,'ANPR_VORONOI_PATTERN.jpg' ...
    ...
    ,'BALLS_FOUR_HW_IMG_5244.jpg' ...
    ,'BLOKUS_IMG_2919.jpg' ...
    ...
    ,'CLOVER__Why_I_Let_The_Clover_Grow.jpg' ...
    ,'DUCKLINGS_IMG_3939.jpg' ...
    ...
    ,'FLYING_DRAGON_NOT.jpg' ...
    ,'GECO_2450.jpg' ...
    ,'GOLF_IMG_0837.jpg' ...
    ,'GOLF_IMG_0846.jpg' ...
    ...
    ,'MACBETH_CLOUD_IMG_2120.jpg' ...
    ,'NERF_PROB_IMG_4421.jpg' ...
    ...
    ,'POCKET_CHANGE_IMG_4825.jpg' ...
    ...
    ,'YOUR_TERNS_TO_COUNT.jpg'...
    };

    
    % Run part A of the homework on the 
    % first 7 images
    %
    for img = 1:7
        HW_08_part_a(images{img});
        pause;

    end
    
    
    % Run part B of the homework
    % 8 and 9th image
    %
    for img = 8:9
        HW_08_part_b(images{img});
        pause;
    end
    
    %
    % Run part C of the homework
    % 10 and 11th image
    %
    for img = 10:11
        HW_08_part_c(images{img});
        pause;
    end
    
    %
    % Run part D of the homework
    % 12 and 15th image
    %
    for img = 12:15
        HW_08_part_d(images{img});
        pause;
    end
    
    %
    % Run part E of the homework
    % 16 and 17th image
    %
    for img = 16:17
        HW_08_part_e(images{img});
        pause;
    end
    
    %
    % Run part F of the homework
    % 18th image
    %
    
    HW_08_part_f(images{18});
        pause;
    
    
    %
    % Run part G of the homework
    % 19th image
    %
    
    HW_08_part_g(images{19});
        pause;
    
    
end