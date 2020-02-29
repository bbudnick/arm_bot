%This script is meant to be uploaded into Matlab, to use with MatlabControl script

clear, close('all'), clc

s = serial('port..ie.COM3', 'BaudRate', 9600);
open_port = instrfind(('Port', 'Status'), ('Port', 'open'));

if ~isempty(open_port)
    fclose(open_port);
end

fopen(s);

%%plug in angle information
positionSet('s', angle)

fclose(s);
