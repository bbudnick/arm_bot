letter_vectors;

user_input = 'A';
thetalist = [0; 0; 0; 0]
Slist = [[0; 0;  1;  4; 0;    0],
    [0; 0;  0;  0; 1;    0],
    [0; 0;  0;  1; 0;    0],
    [0; 0; -1; -6; 0; -0.1]]

%send user input to get appropriate vectors
stuff = matchLetter(user_input);

make_matrices = usesLinSpace(stuff)
FKinSpace(make_matrices, Slist, thetalist)


