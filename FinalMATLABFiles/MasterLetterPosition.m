delete(local_serial)
clear;
close all
local_serial = serial('COM4', 'BaudRate', 9600);
sCloseAll;

fopen(local_serial);

letterVectorDefs
forwardKMats

pause(3)
posSet(local_serial, 1, 2906)
posSet(local_serial, 2, 1175)
posSet(local_serial, 3, 527)
posSet(local_serial, 5, 532)
posSet(local_serial, 4, 495)

user_input = [A]

eomg = 0.1;
ev = 0.01;

T = usesLinSpace(user_input)
for i = 1:size(T,3)
    if(i > 1)
        thetalist0 = new_thetalist
    else
        %Thetalist0 for u in letter positions 1 through 5
        thetalist0 = [6.09; 1.4808; 0.076;0.1023; -0.0869]
    end
    
    internalT = T(:, :, i)
    [thetalist, success] = IKinSpace(Slist, M, internalT, thetalist0, eomg, ev)
    
    if(success == 0)
        disp("Unsuccessful IKinSpace result.")
        break; 
    else
        new_thetalist = mod(thetalist, 2*pi)

        first_converted_theta_list = mod(Rad2BitM1(new_thetalist(1)), 4095);
        second_converted_theta_list = mod(Rad2BitM2(new_thetalist(2)), 4095);
        final_converted_theta_list = mod(Rad2BitA(new_thetalist(3:5)), 1227);

        ULTIMATE_THETA = vertcat(first_converted_theta_list, second_converted_theta_list, final_converted_theta_list)

        for j=1:size(ULTIMATE_THETA, 1) 
            posSet(local_serial, j, ULTIMATE_THETA(j))
            pause(0.2)
        end
    end
end
