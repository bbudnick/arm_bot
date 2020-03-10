clear;
close all
local_serial = serial('COM4', 'BaudRate', 9600);
sCloseAll;

fopen(local_serial);

letterVectorDefs
%Slist_actual
forwardKmats


% Guess: w at center of board: first forward position
% posSet(local_serial, 1, 2048)
% posSet(local_serial, 2, 3072)
posSet(local_serial, 1, 3072)
posSet(local_serial, 2, 1024)
posSet(local_serial, 3, 512)
posSet(local_serial, 4, 512)
posSet(local_serial, 5, 512)

%Future theta functionality:
%With each time we send a value to the motors, their theta
%will change. It will be updated here.
user_letter_request = 1;
user_input = [n o p q r s t m n]

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
%         thetalist0 = [4.42; 2.01; 1.256; 1.31; 1.31];
        thetalist0 = [2.857; -1.1336; 0; 0; 0]

%         thetalist0 = [0; 0; 0; 0; 0];
    end
    
    T_est = FKinSpace(M, Slist, thetalist0);
    
    internalT = T(:, :, i)
    [thetalist, success] = IKinSpace(Slist, M, internalT, thetalist0, eomg, ev)
    
    if(success == 0)
        disp("Unsuccessful IKinSpace result.")
        break; 
    else
        new_thetalist = mod(thetalist, 2*pi)

%         first_converted_theta_list = mod((Rad2BitM1(new_thetalist(1))), 4095);
%         second_converted_theta_list = mod((Rad2BitM2(new_thetalist(2))), 4095);
%         final_converted_theta_list = mod((Rad2BitA(new_thetalist(3:5))), 1023);

        first_converted_theta_list = Rad2BitM1(new_thetalist(1));
        second_converted_theta_list = mod(Rad2BitM2(new_thetalist(2)), 4095);
        final_converted_theta_list = mod(Rad2BitA(new_thetalist(3:5)), 1227);


        ULTIMATE_THETA = vertcat(first_converted_theta_list, second_converted_theta_list, final_converted_theta_list)


        for j=1:size(ULTIMATE_THETA, 1) 
            posSet(local_serial, j, ULTIMATE_THETA(j))
        end
    end

    %while (local_serial.BytesAvailable < 10), end
end









