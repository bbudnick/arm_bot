/*Set initial position of all motors*/
/*This code effectively changes the position of motors
 * 3, 4, and 5. 
 * 
 * TODO: Augment to loop over all motors
 * to establish rest position depending on how the 
 * motors are assembled along the arm. 
 * 
 * Updated as of Feb 28 to communicate to motors 1 and 2 successively 
 *
 * 
 */

#include <DynamixelWorkbench.h>
DynamixelWorkbench dxl_wb;

void setup() {
  uint8_t ID1 = 1; 
  uint8_t ID2 = 2; 
  uint8_t ID3 = 3; 
  uint8_t ID4 = 4; 
  uint8_t ID5 = 5; 
  uint8_t ID6 = 6; 

  //FIRST:
  //Initialize communication to all 6 of the the dynamixels
  dxl_wb.init("1", 1000000); 
  uint16_t model_number = 0; 
  dxl_wb.ping(ID1, &model_number);
  dxl_wb.ping(ID2, &model_number);
  dxl_wb.ping(ID3, &model_number);
  dxl_wb.ping(ID4, &model_number);
  dxl_wb.ping(ID5, &model_number);
  dxl_wb.ping(ID6, &model_number);

  //Chain first two motors together to test their angles
  //TODO CONTINUE TESTING FROM HERE
  uint8_t a = ID1; 
  uint8_t b = ID6; 
  int adjustPosition(uint8_t a, uint8_t b);

 
  
  
  /*
  end_effector_pinch(ID6, model_number); 
  //Adjusts position of motor 2 based on the position of motor 3
  //int pos2 = adjustPosition(3,2); 
*/

}

void loop() {
  // put your main code here, to run repeatedly:

}

//This function can be called from setup() to have the end-effector grip the pen
//TODO: augment later with a check that will read from the motor to confirm its ID 
void end_effector_pinch(uint8_t ID, uint16_t &model_number) {
  if(ID == 6){
  //function for performing pinching action of end-effector motor
  dxl_wb.goalPosition(ID, (int32_t)0);
  delay(1000); 
  dxl_wb.goalPosition(ID, (int32_t)512);
  delay(1000);}
  else {
    Serial.print("Pinch action could not be performed.");
    Serial.print("The ID of the motor is not at the end-effector."); 
  }
}

//returns arm to rest position for every chained motor in arm 

void setRestPosition(){
  dxl_wb.goalPosition(1, (int32_t)100); //motor 1
  dxl_wb.goalPosition(2, (int32_t)200); //motor 2
  dxl_wb.goalPosition(3, (int32_t)300); //motor 3
  dxl_wb.goalPosition(4, (int32_t)400); //motor 4
  dxl_wb.goalPosition(5, (int32_t)500); //motor 5
  dxl_wb.goalPosition(6, (int32_t)600); //motor 6, end effector
  //motor 6 centerpoint is 512
  //motor 6 appears to only be able to move between 0-512 

  delay(3000);
}

//Set posiiton of motor b based on position of motor a 
//Returns the new value of the position of motor b 
//TODO Haven't called this yet, not sure what it will do! 
int adjustPosition(uint8_t a, uint8_t b)
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
