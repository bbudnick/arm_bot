function[position] = positionset(serial, goalPos)

  low = mod(goalPos, 256);
  high = floor(goalPos/256);
  
  srl_fwrite(serial, low);
  srl_fwrite(serial, high);
  
  position = srl_fread(serial, 1) + srl_fread(serial, 1)*256;