%Not sure why this isn't totally working, will test more tomorrow with a rested brain. 


function a = testUsesLinSpace(current_letter)
    
    [m,n] = size(current_letter) %m is rows, n is columns
    
    for i=1:n %iterate column by column sending columns two at a time to LinSpace
        for j=2:n %the only solution I can think of as a replacement for i+1
            current = current_letter(:, i); %current position vector
            goal = current_letter(:, j); %goal position vector
            x_res = linspace(current(1, 1), goal(1, 1), 5); %3 intermediate values between current x and goal x
            y_res = linspace(current(2, 1), goal(2, 1), 5);
            z_res = linspace(current(3, 1), goal(3, 1), 5);
            intermediate = [x_res; y_res; z_res]; %make an array of the new intermediate vertices
            [m,n] = size(intermediate); %should be 3x5 matrix
            agg_mat = intermediate;
            tot_mat = horzcat(agg_mat, intermediate); % TODO THIS MIGHT NOT WORK, goal is to concatenate new intermediate matrix to existing matrix of linspace results
        end
    end
    
    R = [1, 0, 0; 0, 1, 0; 0, 0, 1; 0, 0, 0];
    
    % Frankenstein T matrices together using R and each column of tot_mat
    [m,n] = size(tot_mat) %m is rows, n is columns, should be 3xN
    for i=1:n
        cur_col = cat(1, tot_mat(i), 1); 
        T = horzcat(R, cur_col);
        a = T;
    end
end



