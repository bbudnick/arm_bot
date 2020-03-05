% When I test this function line-by-line, it seems to work. 
% There is something about the way I'm looping that MATLAB doesn't like.
% Will come back to it 3/5. 

function a = testUsesLinSpace(current_letter)
    letter_vectors;
    
    [m,n] = size(current_letter) %m is rows, n is columns

    for i=1:n %iterate column by column sending columns two at a time to LinSpace
        current = current_letter(:, i); %current position vector
        goal = current_letter(:, i+1); %goal position vector
        x_res = linspace(current(1, 1), goal(1, 1), 5); %3 intermediate values between current x and goal x
        y_res = linspace(current(2, 1), goal(2, 1), 5);
        z_res = linspace(current(3, 1), goal(3, 1), 5);
        intermediate = [x_res; y_res; z_res]; %make an array of the new intermediate vertices
        [m,n] = size(intermediate); %should be 3x5 matrix
        agg_mat = intermediate;
        tot_mat = horzcat(agg_mat, intermediate); % TODO THIS MIGHT NOT WORK, goal is to concatenate new intermediate matrix to existing matrix of linspace results
    end
   
    R = [1, 0, 0; 0, 1, 0; 0, 0, 1; 0, 0, 0];
    
    [m,n] = size(tot_mat) %m is rows, n is columns, should be 3xN
    for i=1:n
        super_final_p = cat(1, tot_mat, 1);
        T = [R, super_final_p(i)]; % 4x4 T matrix
        a = T;
    end
end



