% Process the video and choose a strip that
% shows the color changing in the beaker
% Author: Niyati Shah (nxs6032)


function generate_strip_image( fn_in )

     %
     % if no input is given use 
     % the given file
     %
     if nargin < 1
        fn_in =  'TEA_in_TAP_WATER.mov';
     end
     
    % Read the given video. Select the particular rows and columns from
    % each frame. 
    % Rows selected are 200 to 505. 
    % Columns selected are 190 to 200. 
    %
    
    
    vidObj = VideoReader(fn_in);
    column_of_interest = 181:182;             
    rows_of_interest   = 220:505;

    %
    % Select the number of total frames
    %
    n_frames        = 2002;            % get( vidObj, 'NumberOfFrames' );
    
    %
    % Start processing the video feed
    %
    k_input_frame  = 1;
    while (hasFrame(vidObj) && n_frames ~= k_input_frame)
        
          
        %
        % Display a counter for every 100 frames
        % to monitor the progress of the video processing
        %
        if mod(k_input_frame,100) == 1
            fprintf('reading in frame %4d\n', k_input_frame);
        end
        
        %
        % Read a particular frame and select the necessary part
        % from the interested row and column variables defined above
        %
        im          = readFrame(vidObj);
        the_pixels = im( rows_of_interest, column_of_interest, : );
        
        %
        % Initialize the output image
        %
        if(k_input_frame == 1)
            output_im = the_pixels;
        end
        
        %
        % Concat the new strip of image to the earlier strip
        %
        output_im = [output_im the_pixels]; 
    
        %
        % Increment the counter
        %
        k_input_frame  = k_input_frame + 1;  
    end
    

    %
    % Display the output
    % and save it.
    %
    imagesc(output_im);
    axis on;
    
    imwrite(output_im, 'HW15_Shah_Niyati.jpg');
    title('Change in image per frame');
    
end

