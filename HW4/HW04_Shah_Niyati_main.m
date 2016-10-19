function HW04_Shah_Niyati_main( input_image )
    addpath( '../TEST_IMAGES/' );
    addpath( '../../TEST_IMAGES/' );
    % your_function_calls_here_to_other_functions
     % the rest of your homework goes in here…
    local_smear_routine( input_image );

    mat1 = round( fspecial( 'disk', 5 )*1000 );
    local_weighting_routine( input_image, mat1);
    mat2 = round( fspecial( 'gaus', 7, 3 )*1000 );
    local_weighting_routine( input_image, mat2);
end