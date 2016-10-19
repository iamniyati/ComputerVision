%Description: Main function to help run the assignment.
% Author : Niyati Shah (nxs6032)


function HW05_Shah_Niyati_main( input_image )
    addpath( '../TEST_IMAGES/' );
    addpath( '../../TEST_IMAGES/' );
    

    
    %Read the image and start the function call.
    input = im2double(imread(input_image));
    imshow(input_image);
    
    % Initialize all filters and add it to filter array
    fltrA = [ 1 2 1 ; 0 0 0 ; -1 -2 -1 ];
    fltrB = [ 1 0 -1 ; 2 0 -2 ; 1 0 -1 ];
    fltrC = [ 1 0 0 0 -1 ; 2 0 0 0 -2 ; 1 0 0 0 -1 ];
    fltrD = [ 1 0 0 0 0 0 0 0 -1 ; 2 0 0 0 0 0 0 0 -2 ; 1 0 0 0 0 0 0 0 -1 ];
    fltrE = [ 0 -1 0 ; -1 4 -1 ; 0 -1 0 ];
    fltrF = fspecial('laplacian', 1);
    fltrG = fspecial('log');
    
    filter = {fltrA,fltrB,fltrC,fltrD,fltrE,fltrF,fltrG};
    
    % Use all filters on given input image
    for i = 1:7
        % manual filtering
        tic;
        output_image_manual{i}= local_weighting_routine(input,cell2mat(filter(i)));
        manual_elapsed_time{i} = toc;
        
        %Autpmatic filtering
        tic;
        output_image_filter{i}= filter_routine(input,cell2mat(filter(i)));
        filter_elapsed_time{i} = toc;
         
    end   
     
    % Display all filtered images and their elapsed times.
     for i = 1:7
 
         %manual filter display with time
        imagesc(cell2mat(output_image_manual(i)));
        colormap( gray );
        str1 = sprintf('manual filter time taken for filter %i is %f',i,cell2mat(manual_elapsed_time(i)));
        title(str1);
        pause();
        
        %Automatic filter display with time
        imagesc(cell2mat(output_image_filter(i)));   
        str2 = sprintf('imfilter time taken for filter %i is %f',i,cell2mat(filter_elapsed_time(i)));
        title(str2);
        pause();
            
     end
    disp('The End');
end