/*Set initial position of all motors*/

#include <DynamixelWorkbench.h>
DynamixelWorkbench dxl_wb;


void setup() {
  // put your setup code here, to run once:

  //set robot to rest position
  setRestPosition(); 
  
  //Adjusts position of motor 2 based on the position of motor 3
  int pos2 = adjustPosition(3,2); 

}

void loop() {
  // put your main code here, to run repeatedly:

}

//returns arm to rest position for every chained motor in arm 

void setRestPosition(){
  dxl_wb.goalPosition(1, (int32_t)100); //motor 1
  dxl_wb.goalPosition(1, (int32_t)200); //motor 2
  dxl_wb.goalPosition(1, (int32_t)300); //motor 3
  dxl_wb.goalPosition(1, (int32_t)400); //motor 4
  dxl_wb.goalPosition(1, (int32_t)500); 
  dxl_wb.goalPosition(1, (int32_t)600); 
  delay(3000);
}

//Set posiiton of motor b based on position of motor a 
//Returns the new value of the position of motor b 
int adjustPosition(int a, int b)
{
  //Gets the current position of motor a
  dxl_wb.itemRead(a, "Present position:", &aPos); 

  if(aPos < 512)
  {
    dxl_wb.itemRead(b, (int32_t)aPos); 
    return aPos; 
  }

  else
  {
    dxl_wb.goalPosition(b, (int32_t)t023); 
    return 1023; 
  }
}
