sCloseAll; 
clear;
close('all');
clc;

local_serial = serial('COM4', 'BaudRate', 9600);
fopen(local_serial);

letterVectorDefs
%Slist_actual_Mar_7
%new_homeM
forwardKMats


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
user_input = [w r]

eomg = 0.1;
ev = 0.01;

%send user input to get appropriate vectors
%stuff = matchLetter(user_input);
    
T = usesLinSpace(user_input)
for i = 1:size(T,3)
    if(i > 1)
        thetalist0 = new_thetalist
    else
        thetalist0 = [pi; 3*(pi)/2; 0; 0; 0]
    end 
    internalT = T(:, :, i)
    [thetalist, success] = IKinSpace(Slist, M, internalT, thetalist0, eomg, ev)
    new_thetalist = mod(thetalist, 2*pi)

    first_converted_theta_list = mod(Rad2BitM1(new_thetalist(1)),4095);
    second_converted_theta_list = mod(Rad2BitM2(new_thetalist(2)), 4095);
    final_converted_theta_list = mod(Rad2BitA(new_thetalist(3:5)), 1023);
    
    ULTIMATE_THETA = vertcat(first_converted_theta_list, second_converted_theta_list, final_converted_theta_list)


for i=1:size(ULTIMATE_THETA) %check this size function 
    posSet(local_serial, i, new_thetalist(i))  
end
%while (local_serial.BytesAvailable < 10), end
end

