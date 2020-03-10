function [bit] = Rad2BitM2(rad) 

bit = 2048/(pi)*rad + 2048; 


% if(rad == 0)
%     disp("No radian input"); 
%     return; 
% else
%     bit = interp1([0 2*pi], [0 4095], rad) + 2048;
% end 
end 

