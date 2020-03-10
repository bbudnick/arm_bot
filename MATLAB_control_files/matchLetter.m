function a = matchLetter(user_input)
    expectedLetters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'};

    inputLetter = validatestring(user_input,expectedLetters,1);

    switch inputLetter
        case {'A'}
            %get A vector to be sent to Arduino??
        case{'B'}
            %get B vector
        case{'C'}
            %get C vector
        case{'D'}
            %get D vector
        case{'E'}
            %get E vector
        case{'F'}
            %get F vector
        case{'G'}
            %get G vector
        case{'H'}
            %get H vector
        case{'I'}
            %get I vector
        case{'J'}
            %get J vector
        otherwise
            error('Unknown letter passing validation.')
    end
end

