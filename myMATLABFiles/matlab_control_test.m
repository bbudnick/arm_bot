%This script is meant to be uploaded into Matlab, to use with MatlabControl script

clear, close('all'), clc;

s = serial('COM4', 'BaudRate', 9600);
open_port = instrfind({'Port', 'Status'}, {'Port', 'open'});

if ~isempty(open_port)
    fclose(open_port);
end

fopen(s);

%% plug in home angle information
positionSet(s, 1517);
positionSet(s, 1052);
positionSet(s, 400);
positionSet(s, 807);
positionSet(s, 224);

%% First theta 
positionSet(s, 1517); 
positionSet(s, 2000); 
positionSet(s, 994);
positionSet(s, 621); 
positionSet(s, 442); 

fclose(s);
