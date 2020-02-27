/*Set initial position of all motors*/
/*This code effectively changes the position of motors
 * 3, 4, and 5. 
 * 
 * TODO: Augment to loop over all motors
 * to establish rest position depending on how the 
 * motors are assembled along the arm. 
 * 
 * 
 * 
 */

#include <DynamixelWorkbench.h>
DynamixelWorkbench dxl_wb;


void setup() {

  uint8_t ID = 4; 

  //Initialize communication to the dynamixels
  dxl_wb.init("1", 1000000); 
  uint16_t model_number = 0; 
  dxl_wb.ping(ID, &model_number);
  
  // put your setup code here, to run once:
  uint8_t a = 0; 
  uint8_t b = 0; 

  //set robot to rest position
  //setRestPosition(); 
  dxl_wb.goalPosition(ID, (int32_t)512);
  //Adjusts position of motor 2 based on the position of motor 3
  //int pos2 = adjustPosition(3,2); 


}

void loop() {
  // put your main code here, to run repeatedly:

}

//returns arm to rest position for every chained motor in arm 

void setRestPosition(){
  dxl_wb.goalPosition(1, (int32_t)100); //motor 1
  dxl_wb.goalPosition(2, (int32_t)200); //motor 2
  dxl_wb.goalPosition(3, (int32_t)300); //motor 3
  dxl_wb.goalPosition(4, (int32_t)400); //motor 4
  dxl_wb.goalPosition(5, (int32_t)500); 
  delay(3000);
}

//Set posiiton of motor b based on position of motor a 
//Returns the new value of the position of motor b 
//TODO Haven't called this yet, not sure what it will do! 
int adjustPosition(int a, int b)
{
  int32_t aPos = 0;
  int32_t t023 = 0; 
  //Gets the current position of motor a
  //TODO get register using Dynamixel 
  dxl_wb.itemRead(a, "Current position:", &aPos); 

  if(aPos < 512)
  {
    dxl_wb.goalPosition(b, (int32_t)aPos); 
    return aPos; 
  }

  else
  {
    dxl_wb.goalPosition(b, (int32_t)t023); 
    return 1023; 
  }
}

