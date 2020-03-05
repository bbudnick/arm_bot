%this function send a position to the serial port to move the dynamexials
function[position] = posSet(serial, id, goalPos)
    %read decompose the desire position to send via serial
    low = mod(goalPos, 256);
    high = floor(goalPos/256);
    %write the data to serial
    fwrite(serial, id);
    fwrite(serial, low);
    fwrite(serial, high);
    %read the return position.
    position = (fread(serial, 1) + fread(serial, 1)*256);
end


%% new function 
function[] = HomePosition(s)

posSet( s, 4, 530);
posSet( s, 5, 530);
posSet( s, 1, 3100);
posSet( s, 2, 3100);
posSet( s, 3, 512);

end
