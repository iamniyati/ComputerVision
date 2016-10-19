function output_image = local_smear_routine( input_image )
    input_image = (imread(input_image));
    
    dimensions = size( input_image )
    
    if length( dimensions ) > 2 % What does this do?
        % It checks if the image is grey scale or colored.
        
        input_image = rgb2gray( input_image );
    end
    
    output_image = input_image; % Set the default return values …
   % imagesc( output_image );
    for row = 2 : (dimensions(1) - 1)
        for col = 2 : (dimensions(2) - 1 )
             sum = 0;
             for ii = -1 : 1
                   for kk = -1 : 1
                    sum = sum + double(output_image( row + ii, col + kk ));
                   end
             end
             output_image( row, col ) = (sum / 9);
        end
    end
    imagesc( output_image );
    colormap( gray );
end