% sCloseAll; 
% clear;
% close('all');
% clc;
% 
% local_serial = serial('COM4', 'BaudRate', 9600);
% fopen(local_serial);
% 
% letters_defined
% %Slist_actual
% new_homeM
% 
% 
% %Guess: w at center of board: first forward position 
% posSet(local_serial, 1, 3071)
% posSet(local_serial, 2, 1024)
% posSet(local_serial, 3, 512)
% posSet(local_serial, 4, 512)
% posSet(local_serial, 5, 530)

%recieve = getDesiredLetters()

%stuff = matchLetter(recieve);



% user_letter_request = 1; 
%user_input = [w u]

eomg = 0.1;
ev = 0.01;


% T = [-0.3384    0.9410         0 -409.3780;
%         -0.9410   -0.3384         0  253.4771;
%          0         0    1  180;
%          0         0         0    1]


% T =[     0     1     0   0;
%         -1     0     0   375;
%          0     0     1   175;
%          0     0     0     1]
% 



% T = [0    1         0 -409.3780;
%      -1   0         0  253.4771;
%      0         0    1  180;
%          0         0         0    1]
     
     
% T = [   0   1        0 -409.3780;
%          -1   0         0  253.4771;
%          0         0    1  180;
%          0         0         0    1.0000]

%thetalist0 = [4.42; 2.02; 2.46; 2.76; 2.76]
%thetalist0 = [pi; -pi/2; 0; 0; 0]
% thetalist0 = [.5, .5, .5, .5, .5]
% thetalist0 = [.25, .25, .25, .25, .25]
% thetalist0 = [1, 1, 1, 1, 1]
thetalist0 = [2.7964, -1.1750, 0, 0, 0]



[thetalist, success] = IKinSpace(Slist, M, T, thetalist0, eomg, ev)


% 
% 
% 
%  
% T = usesLinSpace(user_input)
% for i = 1:size(T,3)
%     if(i > 1)
%         thetalist0 = new_thetalist
%     else
%         thetalist0 = [4.42; 2.02; 2.46; 2.76; 2.76]
%     end 
%     internalT = T(:, :, i)
%     [thetalist, success] = IKinSpace(Slist, M, internalT, thetalist0, eomg, ev)
%     new_thetalist = mod(thetalist, 2*pi)
% 
%     Rad2BitM(new_thetalist(1)) + 1024
%     Rad2BitM(new_thetalist(2)) + 2048
%     Rad2BitA(new_thetalist(3:5)) + 512
% 
% 
% 
% 
%     %first_converted_theta_list = Rad2BitM(new_thetalist(1)) + 1024
%     %second_converted_theta_list = Rad2BitM(new_thetalist(1)) + 1024
%     %final_converted_theta_list = Rad2BitA(new_thetalist(3:5) + 256
% 
% 
%     %ULTIMATE_THETA = vertcat(first_converted_theta_list, final_converted_theta_list)
% 
% for i=1:size(new_thetalist) %check this size function 
%     posSet(local_serial, i, new_thetalist(i))  
% end
% %while (local_serial.BytesAvailable < 10), end
% end
% 
% 
% 
% 
% 
% 
%         
% 
% 
