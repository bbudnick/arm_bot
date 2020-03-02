%Script to be saved in matlab

function[position] = positionSet(serial, goalPos)

    low = mod(goalPos, 256);
    high = floor(goalPos/256);
    
    fwrite(serial, low);
    fwrite(serial, high);
    
    position = fread(serial, 1) + fread(serial, 1)*256;
