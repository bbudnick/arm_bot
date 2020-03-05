% Using each vector from the chosen letter, 
% process through linspace to generate increments between each vector.
% Create T matrices for each increment from linspace to be
% sent to sent to FKinSpace 

function a = usesLinSpace(thetalist0, user_choice) 
    
    transposeLetter = 0; 
    transposeLetter = transpose(user_choice); %transpose letter matrix to get 

    for P = 1 : size(transposeLetter) %iterate row by row, sending rows two at a time to LinSpace
        current = transposeLetter(I, :); %current position vector
        goal = transposeLetter(I+1, :); %goal position vector
        for Q = 1 : size(current)
            lin_res = linspace(J, K, 3); %lin_res will hold 3 values between J and K scalars
        end
        for R = 1 : size(goal)
            lin_res = linspace(transpose_letter())
                
                    MONDO[Y] = lin_res; 
                % TODO: save each lin_res array to larger 2d matrix that
                % will get zombied with R 
                
                %I dunno this is a mess 
        
            end
        end
    end


      

 
 
 
 
 %this function takes the initial p_i x, then p_i y, then p_i z
 % 
 % 
 % p_i vector, p_(i+1), and the number of
 %increments to draw between them 
 
     
         
    R = [1, 0, 0; 0, 1, 0; 0, 0, 1; 0, 0, 0];
    
    p = [lin_res]
    
    
    initT = [1, 0, 0, 0;
        0, 1, 0, -1;
        0, 0, 1, 0; 
        0, 0, 0, 1]
    
    goalT = [1, 0, 0, 1;
            0, 1, 0, 0; 
            0, 0, 1, -1; 
            0, 0, 0, 1];
    

        


    
    
    
    
    
    
end

