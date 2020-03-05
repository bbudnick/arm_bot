% Complete but untested
% Using each vector from the chosen letter, 
% process through linspace to generate increments between each vector.
% Create T matrices for each increment from linspace to be
% sent to sent to FKinSpace 

function a = usesLinSpace(user_choice) 
    
    MONDO = (3*size(user_choice)); %preallocate array to hold intermediate vectors to be created
    
    transposeLetter = transpose(user_choice); %transpose letter matrix to get 

    for P = 1 : size(transposeLetter) %iterate row by row, sending rows two at a time to LinSpace
        current = transposeLetter(P, :); %current position vector
        goal = transposeLetter(P+1, :); %goal position vector
        x_res = linspace(current(1), goal(1), 3); %3 intermediate values between current x and goal x
        y_res = linspace(current(2), goal(2), 3);
        z_res = linspace(current(3), goal(3), 3);
        MONDO(P) = [x_res; y_res; z_res]; %should catch all intermediate values 
    end
    final_p = transpose(MONDO); %should be a 3xN matrix holding all x, y, z vals with intermediate values
    
    R = [1, 0, 0; 0, 1, 0; 0, 0, 1; 0, 0, 0];
    
    for Q = 1 : size(final_p)
        super_final_p = cat(1, final_p, 1);
        T = [R, super_final_p(Q)]; % 4x4 T matrix
        a = T; 
    end
end

