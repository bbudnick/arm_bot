/*Set initial position of all motors*/

#include <DynamixelWorkbench.h>
DynamixelWorkbench dxl_wb;


void setup() {
  // put your setup code here, to run once:

  //set robot to rest position
  setRestPosition(); 

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
