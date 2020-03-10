function [bit] = Rad2BitA(radian) 

	bit = round((512/(5*pi/6))*radian)+512;
end 

%otherwise use interp1()
