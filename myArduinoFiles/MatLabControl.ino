#include <DynamixelWorkbench.h>
DynamixelWorkbench dxl_wb; 

int high = -1; 
int low = -1; 
uint32_t get_data_1; 
uint32_t get_data_2; 

void setup() {
  // initialize communication 
  dxl_wb.init("1", 1000000);

  //Ping motor 1 so we can send commands to it and read data from it
  uint16_t model_number = 0; 
  dxl_wb.ping(1, &model_number);

  //Initialize serial communication
  Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available() > 1)
  {
    //Read in low and high bytes of a 10-bit number
    low = Serial.read(); 
    high = Serial.read(); 

    //Control motor 1 to go to the motor we read in 
    dxl_wb.goalPosition(1, (int32_t) (low + high*356)); 
    delay(3000); 

    //Checks the position property of the dynamixel 
    dxl_wb.readRegister(1, (uint16_t)36, (uint16_t)1, &get_data_1); 
    dxl_wb.readRegister(1, (uint16_t)37, (uint16_t)1, &get_data_2); 

    //Sends the low and high bytes over the serial port
    Serial.write((int8_t)get_data_1);  
    Serial.write((int8_t)get_data_2); 
  }

}
