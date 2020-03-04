% Successfully returns entire matrix of vectors that correspond to the user's 
% request for a specific letter. 

function getp = matchLetter(user_input)
    expectedLetters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'};
    
    letter_vectors;
    
    %returns letter in list of acceptable letters if matched with
    %user_input
    inputLetter = validatestring(user_input,expectedLetters,1);
    
    switch inputLetter
        case {'A'}
            %get A vector to be sent to Arduino??
            getp = A; 
        case{'B'}
            %get B vector
            getp = B; 
        case{'C'}
            %get C vector
            getp = C; 
        case{'D'}
            %get D vector
            getp = D; 
        case{'E'}
            %get E vector
            getp = E; 
        case{'F'}
            %get F vector
            getp = F; 
        case{'G'}
            %get G vector
            getp = G; 
        case{'H'}
            %get H vector
            getp = H; 
        case{'I'}
            %get I vector
            getp = I; 
        case{'J'}
            %get J vector
            getp = J; 
        otherwise
            error('Unknown letter passing validation.')
    end
end

