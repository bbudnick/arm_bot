#include <DynamixelWorkbench.h>

DynamixelWorkbench dxl_wb;

int high = -1;
int low = -1;
uint8_t id;
uint8_t firstbyte; 
uint32_t get_data_1;
uint32_t get_data_2;

void setup() {
  // put your setup code here, to run once:
  //Initialize communication with dynamixel motors
  dxl_wb.init("1",1000000);
  
uint8_t Mx1=1;
uint8_t Mx2=2;
uint8_t Ax1=3;
uint8_t Ax2=4;
uint8_t Ax3=5;
// Run a seprate Code to run the gripper
//uint8_t Ax4=6;

  //Ping all motors so that we can send commands and read data
  
    uint16_t model_number1=0;
  dxl_wb.ping(Mx1, &model_number1);
  
    uint16_t model_number2=0;
  dxl_wb.ping(Mx2, &model_number2);
    
    uint16_t model_number3=0;
  dxl_wb.ping(Ax1, &model_number3);
  
    uint16_t model_number4=0; 
  dxl_wb.ping(Ax2, &model_number4);
  
    uint16_t model_number5=0;
  dxl_wb.ping(Ax3, &model_number5);

 //   uint16_t model_number6=0;
 // dxl_wb.ping(Ax4, &model_number6);

  //Initialize serial communication with a boudrate of 9600
  Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:

  //Check to see how many bytes of data are being stored in buffer
  if(Serial.available() > 0)
  {
     firstbyte = Serial.read(); //read the first byte.
    if (firstbyte > (uint8_t)7)
    {
id = firstbyte - 8;
     dxl_wb.readRegister(id, (uint16_t)36, (uint16_t)1, &get_data_1);
    dxl_wb.readRegister(id, (uint16_t)37, (uint16_t)1, &get_data_2);
    Serial.write((int8_t) get_data_1);
    Serial.write((int8_t) get_data_2);    
    }
    else 
    {
      id = firstbyte;
      while(Serial.available() <= 1) {}
    
    //Read in low and high bytes of a 10 bit number
    low = Serial.read();
    high = Serial.read();

    //Control motor ID to go to the number we read in
    dxl_wb.goalPosition(id, (int32_t) (low + high*256));
    delay(100); //wait until we get to the position before we continue

    //Checks the Position property of the dynamixel
    dxl_wb.readRegister(id, (uint16_t)36, (uint16_t)1, &get_data_1);
    dxl_wb.readRegister(id, (uint16_t)37, (uint16_t)1, &get_data_2);

    //Sends the low and high bytes over the serial port back to Matlab
    Serial.write((int8_t) get_data_1);
    Serial.write((int8_t) get_data_2);
  }
  }
  }
