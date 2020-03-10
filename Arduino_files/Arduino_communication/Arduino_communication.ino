#include <DynamixelWorkbench.h>
DynamixelWorkbench dxl_wb; 

int high = -1; 
int low = -1; 
uint8_t id; 
uint32_t get_data_1; 
uint32_t get_data_2; 

void setup() {
  // initialize communication 
  dxl_wb.init("1", 1000000);

  //Ping motor 1 so we can send commands to it and read data from it
  uint16_t model_number = 0; 
  dxl_wb.ping(1, &model_number);
  dxl_wb.ping(2, &model_number);
  dxl_wb.ping(3, &model_number);
  dxl_wb.ping(4, &model_number);
  dxl_wb.ping(5, &model_number);
  dxl_wb.ping(6, &model_number);

  //Initialize serial communication
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available() > 2)
  {
    id = Serial.read();
    //First motor
    //Read in low and high bytes of a 10-bit number
    low = Serial.read(); 
    high = Serial.read(); 

    //Control motor 1 to go to the location we read in 
    dxl_wb.goalPosition(id, (int32_t) (low + high*256)); 
    delay(700); 

    //Checks the position property of the dynamixel 
    dxl_wb.readRegister(id, (uint16_t)36, (uint16_t)1, &get_data_1); 
    dxl_wb.readRegister(id, (uint16_t)37, (uint16_t)1, &get_data_2); 

    //Sends the low and high bytes over the serial port
    //Serial.write((int8_t)get_data_1);  
    //Serial.write((int8_t)get_data_2); 
  
  }

}
