% Process the image such that the the skewed 
% sign on the door is straightened.
% Author: Niyati Shah (nxs6032)


function transform_image( input_image )

     %
     % if no input is given use 
     % the given file
     %
     if nargin < 1
        input_image =  'IMG_5802.jpg';
     end
     
     %
     % Read the input image
     %
     im = im2double(imread(input_image));
     
     %
     % Create a
     % rectangle smaller than the smallest size
     % to fit in the transformed rectangle sign
     %
     
     output_row = 700;
     output_column = 1000;
     ref_im = uint8(zeros(output_row,output_column,3));
     
     %
     % Choose between an interactive session or a preloaded session.
     %
     fprintf('select 1 for an manual or 0 for automatic session \n ');
     fprintf(' Manual: Choose the four corners of the sign \n  ');
     fprintf('Automatic: Load the saved four corners of the sign \n ');
     prompt = 'Your selection: ';
     INTERACTIVE = input(prompt);

    
     %
     % Check if user wants to use pre loaded points or choose them
     %
     if  INTERACTIVE
        %
        % Select the 4 corners of the sign
        % and save the points. 
        %
        fprintf('Select the four corners of the sign and press enter \n');
        imagesc(im);
    	[x,y] = ginput(4);
        four_corner = [x, y];
        save four_corner;
        %
        % Select the 4 corners of the image
        % and save the points. 
        %
        fprintf('Select the four corners of the image and press enter \n');
        imagesc(ref_im);
    	[x_ref,y_ref] = ginput(4);
        ref_corner = [y_ref, y_ref];
        save ref_corner;
        INTERACTIVE2 = 1;
     else
        %
        % Choose the pre selected data 
        %
           load four_corner;
           load ref_corner;
           INTERACTIVE2 = 0;
     end

     %
     % Use the projective transform to change the vanishing point to
     % infinity and apply to the image.
     %

     create_transform = fitgeotrans([x,y],[x_ref,y_ref], 'projective' );
     transform_sign = imwarp(im,create_transform);
    

     %
     % Crop the required part from the image 
     %
      if INTERACTIVE2 == 1
        fprintf('Select just above the top left corner of the sign and press enter \n');
        imagesc(transform_sign);
        [xrb,yrb] = ginput(1);
        bottom_right = [xrb,yrb];
        save bottom_right
      else
         load bottom_right
      end
      crop_sign = imcrop(transform_sign,[xrb,yrb, 1040, 740]);
    
     %
     % Display the image
     %
     imagesc(crop_sign);
     title('Transformed image')

end