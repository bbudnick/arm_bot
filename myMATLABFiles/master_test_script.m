letter_vectors;

user_input = 'A';
thetalist0 = [1.5; 2.5; 3; 5]; 
eomg = 0.01; 
ev = 0.001; 
Slist = [[0; 0;  1;  4; 0; 0],[0; 0;  0;  0; 1; 0],[0; 0;  0;  1; 0; 0],[0; 0; -1; -6; 0; -0.1]];

%send user input to get appropriate vectors
stuff = matchLetter(user_input);

T = usesLinSpace(stuff)
for i = 1:size(T,3)
  internalT = T(:, :, i)
  [thetalist, success] = IKinSpace(make_matrices, Slist, thetalist)
end




