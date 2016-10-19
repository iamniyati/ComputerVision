% Description:  Fucntion to perform image filtering using the 
%               matlab inbuilt filter fucntion
% Author : Niyati Shah (nxs6032)

function output_image = filter_routine( input_image, weights )
    
    output_image = imfilter( input_image, weights, 'same', 'replicate' );
  

end