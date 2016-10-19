function output_image = local_weighting_routine( input_image, weights )
    input_image = imread(input_image);
    wt_dims = size( weights ); % dimensions of the weights matrix, a MxM matrix.
    im_dims = size( input_image ); % dimensions of the image
    
    if length(im_dims) > 2 % What does this do?
       % It checks if the image is grey scale or colored
        input_image = rgb2gray( input_image );
    end
    imshow(input_image);
    output_image =(input_image); % Set the default return values …
    % set Q, R, S, T, etc… so that the following works.
    % You also need to compute W, the final normalization constant for the sum.

    Norm_weights = sum(sum(weights));
    Q = ceil(wt_dims(1)/2);
    R = ceil(wt_dims(2)/2);
    S = floor(wt_dims(2)/2);
    T = floor(wt_dims(2)/2);
    for row = Q : (im_dims(1) - Q  - 1 )
         for col = R : (im_dims(2) - R - 1 )
            sum1 = 0;
                for ii = -S : S
                    for kk = -T : T
                     
                         sum1 = sum1 +  double(output_image( (row + ii) , (col + kk) )) * weights( S+ii+1, T+kk+1 );
                    end
                end
                output_image( row, col ) = (sum1/Norm_weights) ;
         end
    end
    imagesc( output_image ); colormap( gray );
end