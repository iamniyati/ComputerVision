function HW_03_Shah_Niyati_Enhance_ICs__framework( fn_in )
% This is the framework of things to do for HW_03 in 631.
% Run this using: HW_03_YourLastName_YourFirstName_Enhance_ICs__framework( 'IMG_6382.JPG' );
%
% Professor Kinsman has some electronic parts, however, he cannot read the labels on
% the integrated circuits.  To solve the problem, he took a picture of the parts, and 
% use image enhancement to read the integrated circuits (ICs).  
%
% Notice that there are three ICs in the image.  He needs to be able to read them all
% at the same time, in the same image, using the same image enhancement.
%
% Your homework is to replicate this work.
%
% By implementing some of these changes, and doing the work, you will learn some more about
% Matlab, and variable manipulation.  For example, this demonstrates "dynamic ranging",
% which is used to change the contrast on the image.
%
% Your write-up and conclusions will be important.  
%
% Generate a clean write-up, in English, in MS Word or Latex, showing the steps you used,
% discuss your learning, and your results, and describing what you did to solve the problem.
%  
% 
% WHAT TO SUBMIT -- 
% 1.  A modified version of this file, with your changes in it.
%
% 2.  A PDF file, describing your algorithm for solving the problem, and why you tried what you
%     tried.  Describe anything you learned in the process of getting the job done.
%     You are expected to try all of the image enhancement techniques that we have covered
%     so far.  
%     
%  Grading:
%  A.  A version of this file that allows the viewer to see the intermediate results, and 
%      read all the labels on all three ICs in the image.  (5 pts).
%
%  B.  A write up that describe which version of the monochrome image you used, what you saw
%      in your histogram analysis, how you enhanced your image (what combination of steps you used),
%      and any other evidence of learning you would like to discuss (5 pts).
%
%  NAME: Niyati Shah
%  DATE: 9/11/2016
%
  
    % Read in the image:
    im_in   = imread( fn_in );
    im_rgb  = im2double( im_in );
    
    %
    % Try different ways of converting the image to different types of monochromatic images:
    %

    % Describe the transformations you used here... 
    im_grn    = im_rgb( :, :, 2 );
    
    im_gray   = rgb2gray( im_rgb );
    
    im_hsv    = rgb2hsv( im_rgb );
    im_value  = im_hsv(:,:,3);
    
    im_lab    = rgb2lab( im_rgb );
    im_luma   = im_lab(:,:,1 );
     
     %
     %  Display the different types of gray, and see which one looks good.
     %  Examine the images in detail to see which one gives the best contrast in the
     %  desired region(s).
     %
     %  Describe any differences you observe visually:
     %
     figure, imagesc( im_grn );  title('Green Channel ', 'FontSize', 24 );           colormap(gray);
     figure, imagesc( im_gray );  title('rgb2gray, Gray Channel ', 'FontSize', 24 );  colormap(gray);
     figure, imagesc( im_value );  title('HSV Value ', 'FontSize', 24 );               colormap(gray);
     figure, imagesc( im_luma );  title('LAB Luminance Channel ', 'FontSize', 24 );   colormap(gray);
     
      %
      %  Display the histogram of all of the different values.  
      %  Pay attention to the regions of interest to see which ones seem to have 
      %  values that differentiate the chip writing from the chips.
      %
      %  Again, describe any differences you see visually:
      %
      figure, imhist( im_grn );
     title('Histogram of Green Channel ', 'Fontsize', 24 );
     
     figure, imhist( im_gray );
     title('Histogram of rgb2gray ', 'Fontsize', 24 );
     
     figure, imhist( im_value );
     title('Histogram of HSV Value ', 'Fontsize', 24 );
     
     figure, imhist( im_luma/100 );
     title('Histogram of LAB L Channel ', 'Fontsize', 24 );
     
    %
    %  Choose your best version of the image to use:
    %
    %  Explain why you used that monochrome version of the image that you used here.
    %  What did you base this decision on?
    
    im_tmp =  im_grn;
    
    %
    %  Enhance the image somehow to get dark writing on the dark chip to stand out:
    %
    im_rd= im_rgb( :, :, 1);			% red channel
    im_blu= im_rgb( :, :, 3);			% blue channel
    
    im_grn_adapthist                    =   adapthisteq( im_tmp.^(1/3) );



    im_enhanced   =   cat (3 , im_rd ,im_grn_adapthist , im_blu );
    figure('Position', [300 2 1024 768] );
    imagesc( im_enhanced );
    
    title('Transformed Niyati Shah Channel ', 'FontSize', 24 );
    colormap( gray );

    im_tmp2                     =   im_enhanced;
    
    
    %
    % Use dynamic ranging to expand the range of the image.
    % You will pick a maximum value of the image, which gets mapped to the value of 1.
    % And you will pick a minimum value of the image, which gets mapped to a value of 0.
    % All other values are lost.
    %
    CLIP_MAX                    = 0.57
    CLIP_MIN                    = 0.07
    
    im_tmp2( im_tmp2 < CLIP_MIN )    = CLIP_MIN;
    im_tmp2( im_tmp2 > CLIP_MAX )    = CLIP_MAX;
    
    % This is the recipe:
    im_new      = ( im_tmp2 - CLIP_MIN ) / ( CLIP_MAX - CLIP_MIN );
    
    %
    %  Display your results for the grader to look at:
    %
    figure;
    imagesc( im_new );
    title('THIS IS MY ANSWER for HW_03 ', 'FontSize', 24 );
    colormap( gray );

    %
    % Split the input filename into parts, then create a new output filename from it:
    %
    [ dir_name, base_name, extension ] = fileparts( fn_in );
    fn_out = [ base_name '_output' extension ];
    imwrite( im_new, fn_out );
    
end

