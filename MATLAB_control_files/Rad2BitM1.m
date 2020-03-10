function [bit] = Rad2BitM1(rad) 

bit = round(2048/(pi)*rad + 1024); 

end 

