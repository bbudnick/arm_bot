clear all; 
sCloseAll; 


%addpath '\\thoth.cecs.pdx.edu\home02\bhh2\My Documents\GitHub\arm_bot'\myMATLABFiles\letter_vectors.m
%letter_vectors;

addpath '\\thoth.cecs.pdx.edu\home02\bhh2\My Documents\GitHub\arm_bot\MATLAB_control_files'
forward_kinematics_test;

s = serial('COM4', 'BaudRate', 9600)

fopen(s);

posSet(s, 1, 2048); 
posSet(s, 2, 2048);
posSet(s, 3, 512);
posSet(s, 4, 512);
posSet(s, 5, 530);

user_input = [[0; 0; 0], [1; 0; 0]];
thetalist0 = [pi; pi; pi; pi; pi]; 
eomg = 0.01;
ev = 0.001;
%Slist = [[0; 0;  1;  4; 0; 0],[0; 0;  0;  0; 1; 0],[0; 0;  0;  1; 0; 0],[0; 0; -1; -6; 0; -0.1]];

%send user input to get appropriate vectors
%stuff = matchLetter(user_input);

T = usesLinSpace(user_input)
for i = 1:size(T,3)
  internalT = T(:, :, i)
  [thetalist, success] = IKinSpace(Slist, M, internalT, thetalist0, eomg, ev)
  new_thetalist(:, i) = mod(thetalist, 2*pi)
  first_converted_theta_list = Rad2BitM(new_thetalist(1:2, :))
  final_converted_theta_list = Rad2BitA(new_thetalist(3:5, :))
  ULTIMATE_THETA = vertcat(first_converted_theta_list, final_converted_theta_list)
end

for j=1:3
    for i=1:5
        posSet(s, i, ULTIMATE_THETA(j, i))
    end
    %pause(3)
end





        


