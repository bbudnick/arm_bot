% This doesn't work
% I'd like to iterate through the 2d array that is arm_pos
% so that positions 1-6 can access the letter to match user input. 

% Because A, etc., refer to other matrices of vectors, MATLAB
% thinks I'm trying to concatenate them? 

% Not sure how to just match the variable A in arm_pos
% with character 'A' from the user. 


arm_pos = [A B C D E F G H I J;
           A B C D E F G H I J;
           A B C D E F G H I J;
           A B C D E F G H I J;
           A B C D E F G H I J;
           A B C D E F G H I J];

%for J = 1 : size(arm_pos)
%  for K = 1 : size(arm_pos)
%       disp(arm_pos(0, 0));
%  end
%end
 
%arm_pos = [[2, 3, 3, 3];
%           [3, 5, 5, 5]];

for J = 1 : size(arm_pos)
  for K = 1 : size(arm_pos)
      if eq(arm_pos(J, K), 'B')
        disp("Success!"); 
      else 
        disp("Nope");
      end
  end
end
   

