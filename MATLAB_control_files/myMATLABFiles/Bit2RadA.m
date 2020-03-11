function [radian] = Bit2RadA(bit)

	radian = [(5/6 * pi)/512]*bit-(5/6 * pi);
end 
