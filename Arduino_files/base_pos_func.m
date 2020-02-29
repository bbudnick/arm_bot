/*
 * Home Position Orientation Values
 * Motor 1: 1517
 * Motor 2: 1052
 * Motor 3: 400
 * Motor 4: 807
 * Motor 5: 224
 * Motor 6: ???
 */

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
  dxl_wb.ping(2, &model_number);
  dxl_wb.ping(3, &model_number);
  dxl_wb.ping(4, &model_number);
  dxl_wb.ping(5, &model_number);
  //dxl_wb.ping(6, &model_number);

  //Initialize serial communication
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available() > 1)
  {
    /**********************************************/
  
    //First motor
    //Read in low and high bytes of a 10-bit number
    low = Serial.read(); 
    high = Serial.read(); 

    //Control motor 1 to go to the location we read in 
    dxl_wb.goalPosition(1, (int32_t) (low + high*256)); 
    delay(1000); 

    //Checks the position property of the dynamixel 
    dxl_wb.readRegister(1, (uint16_t)36, (uint16_t)1, &get_data_1); 
    dxl_wb.readRegister(1, (uint16_t)37, (uint16_t)1, &get_data_2); 

    //Sends the low and high bytes over the serial port
    Serial.write((int8_t)get_data_1);  
    Serial.write((int8_t)get_data_2); 

    delay(1000); 

    /**********************************************/


    //Second motor
    //Read in low and high bytes of a 10-bit number
  
    low = Serial.read(); 
    high = Serial.read(); 

    //Control motor 1 to go to the location we read in 
    dxl_wb.goalPosition(2, (int32_t) (low + high*256)); 
    delay(1000); 

    //Checks the position property of the dynamixel 
    dxl_wb.readRegister(2, (uint16_t)36, (uint16_t)1, &get_data_1); 
    dxl_wb.readRegister(2, (uint16_t)37, (uint16_t)1, &get_data_2); 

    //Sends the low and high bytes over the serial port
    Serial.write((int8_t)get_data_1);  
    Serial.write((int8_t)get_data_2); 

    delay(1000); 

      /**********************************************/


    //Third motor
    low = Serial.read(); 
    high = Serial.read(); 

    //Control motor 1 to go to the location we read in 
    dxl_wb.goalPosition(3, (int32_t) (low + high*256)); 
    delay(1000); 

    //Checks the position property of the dynamixel 
    dxl_wb.readRegister(3, (uint16_t)36, (uint16_t)1, &get_data_1); 
    dxl_wb.readRegister(3, (uint16_t)37, (uint16_t)1, &get_data_2); 

    //Sends the low and high bytes over the serial port
    Serial.write((int8_t)get_data_1);  
    Serial.write((int8_t)get_data_2); 

    delay(1000); 
    
        /**********************************************/

    //Fourth motor
    //Read in low and high bytes of a 10-bit number
    low = Serial.read(); 
    high = Serial.read(); 

    //Control motor 1 to go to the location we read in 
    dxl_wb.goalPosition(4, (int32_t) (low + high*256)); 
    delay(1000); 

    //Checks the position property of the dynamixel 
    dxl_wb.readRegister(4, (uint16_t)36, (uint16_t)1, &get_data_1); 
    dxl_wb.readRegister(4, (uint16_t)37, (uint16_t)1, &get_data_2); 

    //Sends the low and high bytes over the serial port
    Serial.write((int8_t)get_data_1);  
    Serial.write((int8_t)get_data_2); 

    delay(1000); 

    /**********************************************/

    //Fifth motor
    //Read in low and high bytes of a 10-bit number
    low = Serial.read(); 
    high = Serial.read(); 

    //Control motor 1 to go to the location we read in 
    dxl_wb.goalPosition(5, (int32_t) (low + high*256)); 
    delay(1000); 

    //Checks the position property of the dynamixel 
    dxl_wb.readRegister(5, (uint16_t)36, (uint16_t)1, &get_data_1); 
    dxl_wb.readRegister(5, (uint16_t)37, (uint16_t)1, &get_data_2); 

    //Sends the low and high bytes over the serial port
    Serial.write((int8_t)get_data_1);  
    Serial.write((int8_t)get_data_2); 

    delay(1000); 

    /**********************************************/
/*
    //Sixth motor
    //Read in low and high bytes of a 10-bit number
    low = Serial.read(); 
    high = Serial.read(); 

    //Control motor 1 to go to the location we read in 
    dxl_wb.goalPosition(6, (int32_t) (low + high*256)); 
    delay(1000); 

    //Checks the position property of the dynamixel 
    dxl_wb.readRegister(6, (uint16_t)36, (uint16_t)1, &get_data_1); 
    dxl_wb.readRegister(6, (uint16_t)37, (uint16_t)1, &get_data_2); 

    //Sends the low and high bytes over the serial port
    Serial.write((int8_t)get_data_1);  
    Serial.write((int8_t)get_data_2); 

    delay(1000); 
   */
  }

}
