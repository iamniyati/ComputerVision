% Function to Classify rasberries in the image
% $input parameter : image file
% Author: Niyati Shah (nxs6032)

function HW10_Shah_Niyati_part_a(input_image)
    

    %
    % Choose between an interactive session or a preloaded session.
    %
    fprintf('select 1 for an manual or 0 for automatic session \n ');
    fprintf(' Manual: Choose your own background/foreground points \n  ');
    fprintf('Automatic: Load the saved background/foreground points \n ');
    prompt = 'Your selection: ';
    INTERACTIVE = input(prompt);
    %
    % If no input image given, use the raspberries image
    %
    if nargin < 1
        input_image = 'IMG_0190__RASPBERRIES__smr.jpg';
    end
    %
    % Read given image
    %
    im_rgb = imread( input_image );
    
    %
    % Check if user wants to use pre loaded points or choose them
    %
    if  INTERACTIVE
        %
        % Display Image
        %
        imshow( im_rgb );
     
        %
        % Select the forground object (in our case the raspberries)
        %
        fprintf('SELECT FOREGROUND OBJECT ... ');
        fprintf('Click on points to capture positions:  Hit return to end...\n');
        [x_fg, y_fg] = ginput();

        %
        % Select the background object (in our case the grassy layout)
        %
        
        fprintf('SELECT BACKGROUND OBJECT ... ');
        fprintf('Click on points to capture positions:  Hit return to end...\n');
        [x_bg, y_bg] = ginput();
    
        %
        % Save the data 
        %
        save my_temporary_data;
    else
        %
        % Choose the pre selected data 
        %
        load my_temporary_data;
    end
    

    %
    % Convert image to LAB format and
    % seperate the a(red and green) and b(blue and yellow)
    % channel from it
    %
    im_lab      = rgb2lab( im_rgb );
    im_a        = im_lab(:,:,2);
    im_b        = im_lab(:,:,3);
    
    
    %
    % Get the linear indice for the foreground pixels which are selected by
    % user. Function takes the size and the points (rounded) choosen by the user
    % Use only the given co-ordinates from the 'A' and 'B' channel of image 
    %
    fg_indices  = sub2ind( size(im_lab), round(y_fg), round(x_fg) );
    fg_a        = im_a( fg_indices );
    fg_b        = im_b( fg_indices );
    
    %
    % Get the linear indice for the background pixels which are selected by
    % user. Function takes the size and the points (rounded) choosen by the user
    % Use only the given co-ordinates from the 'A' and 'B' channel of image 
    %
    bg_indices  = sub2ind( size(im_lab), round(y_bg), round(x_bg) );
    bg_a        = im_a( bg_indices );
    bg_b        = im_b( bg_indices );
    
    %
    % combine the foreground pixels in 'A' channel 
    % with foreground pixels in channel 'B'
    %
    fg_ab       = [ fg_a fg_b ];                    
   
    %
    % combine the background pixels in 'A' channel 
    % with background pixels in channel 'B'
    %
    bg_ab       = [ bg_a bg_b ];    
    
    %
    % Merge the pixels of image in 'A' channel with pixels
    % in 'B' channel to form a matrix
    % 
    im_ab       = [ im_a(:) im_b(:) ];
    
    %
    % Calculate the mahalanobis distance of the pixel in the image
    % which has the points of foreground and background selected by the
    % user. And square root the given output to get the final answer for
    % foreground and background pixels.
    %
    mahal_fg    = ( mahal( im_ab, fg_ab ) ) .^ (1/2);
    mahal_bg    = ( mahal( im_ab, bg_ab ) ) .^ (1/2);
    
    %
    %  Classify as Class 0 for foreground pixels 
    %  if distance to FG is < distance to BG.
    %
    class_0     = mahal_fg < mahal_bg;
    
    %
    % 
    % Form a model of the foreground Mahalanobis distance:
    % Calculate the mean and the standard deviation of foreground pixels.
    %
    fg_dists        = mahal_fg;
    fg_dists_cls0   = fg_dists(class_0);
    dist_mean       = mean( fg_dists_cls0 );
    dist_std_01     = std(  fg_dists_cls0 );
    
    %
    % Toss everything outside of one standard deviation,
    %  and re-adjust the mean value
    %
    b_inliers       = ( fg_dists_cls0 <= (dist_mean + dist_std_01) ) & ( fg_dists_cls0 >= (dist_mean - dist_std_01));
    the_inliers     = fg_dists_cls0( b_inliers );
    dist_mean       = mean( the_inliers );

    %
    %  Use a distance to target variable as rules for inclusion:
    %  Choose values that are less than threshold
    %  

    threshold       = dist_mean;
    guess_cls0      = fg_dists < threshold;
    
    %
    % Change the shape of the classification to look like an image:
    % by convert it to a matrix of the size of the image
    class_im        = reshape( guess_cls0, size(im_a,1), size(im_a,2) );
    imshow( class_im );
    imwrite(class_im, 'HW10_Shah_Niyati_part_a_output.jpg');
    title('Part A: Final threshold image ', 'FontSize', 20, 'FontWeight', 'bold' );
    
end