% Using each vector from the chosen letter,
% process through linspace to generate increments between each vector.
% Create T matrices for each increment from linspace to be
% sent to sent to FKinSpace

function a = usesLinSpace(user_choice)
     
    for P = 1 : size(user_choice, 2)-1 %iterate row by row, sending rows two at a time to LinSpace
        current = user_choice(:, P); %current position vector
        goal = user_choice(:, P+1); %goal position vector
        n=20; 
        x_res = linspace(current(1), goal(1), n); %3 intermediate values between current x and goal x
        y_res = linspace(current(2), goal(2), n);
        z_res = linspace(current(3), goal(3), n); 
        MONDO(:, (n*(P-1)+1):n*P) = [x_res; y_res; z_res]
        
    end
   
    R = [1, 0, 0; 0, 1, 0; 0, 0, 1; 0, 0, 0];
    
    for Q = 1 : size(MONDO, 2)
        super_final_p = [MONDO(:, Q); 1]
        T = [R, super_final_p]; % 4x4 T matrix
        a(:, :, Q) = T; 
    end
end
