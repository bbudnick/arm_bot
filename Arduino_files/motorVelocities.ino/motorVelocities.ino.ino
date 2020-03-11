#include <DynamixelWorkbench.h>
DynamixelWorkbench dxl_wb; 

uint8_t id; 

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
  if(Serial.available() > 1)
  {
    dxl_wb.goalVelocity(1, (int32_t)50); 
    dxl_wb.goalVelocity(2, (int32_t)50); 
    dxl_wb.goalVelocity(3, (int32_t)50); 
    dxl_wb.goalVelocity(4, (int32_t)50); 
    dxl_wb.goalVelocity(5, (int32_t)50); 
  }
}

