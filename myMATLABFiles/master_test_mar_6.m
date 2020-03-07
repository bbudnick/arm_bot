sCloseAll; 
clear;
close('all');
clc;

local_serial = serial('COM4', 'BaudRate', 9600);
fopen(local_serial);

letters_defined
%Slist_actual
new_homeM


%Guess: w at center of board: first forward position 
posSet(local_serial, 1, 3071)
posSet(local_serial, 2, 1024)
posSet(local_serial, 3, 512)
posSet(local_serial, 4, 512)
posSet(local_serial, 5, 530)

%Future theta functionality:
%With each time we send a value to the motors, their theta
%will change. It will be updated here. 
user_letter_request = 1; 
user_input = [n r]

eomg = 0.1;
ev = 0.01;
%Slist = [[0; 0;  1;  4; 0; 0],[0; 0;  0;  0; 1; 0],[0; 0;  0;  1; 0; 0],[0; 0; -1; -6; 0; -0.1]];

%send user input to get appropriate vectors
%stuff = matchLetter(user_input);


    
T = usesLinSpace(user_input)
for i = 1:size(T,3)
    if(i > 1)
        thetalist0 = new_thetalist
    else
        thetalist0 = [pi; (-pi)/2; 0; 0; 0];
    end 
    internalT = T(:, :, i)
    [thetalist, success] = IKinSpace(Slist, M, internalT, thetalist0, eomg, ev)
    new_thetalist = mod(thetalist, 2*pi)

    Rad2BitM(new_thetalist(1)) + 1024
    Rad2BitM(new_thetalist(2)) + 2048
    Rad2BitA(new_thetalist(3:5)) + 512




    %first_converted_theta_list = Rad2BitM(new_thetalist(1)) + 1024
    %second_converted_theta_list = Rad2BitM(new_thetalist(1)) + 1024
    %final_converted_theta_list = Rad2BitA(new_thetalist(3:5) + 256


    %ULTIMATE_THETA = vertcat(first_converted_theta_list, final_converted_theta_list)

for i=1:size(new_thetalist) %check this size function 
    posSet(local_serial, i, new_thetalist(i))  
end
%while (local_serial.BytesAvailable < 10), end
end






        



