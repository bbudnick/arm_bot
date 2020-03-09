/*Changes ID of motor from current ID to new ID and 
  changes current ID back to 1 */


#include <DynamixelWorkbench.h>
DynamixelWorkbench dxl_wb; 

void setup() {
  // put your setup code here, to run once:

  uint8_t currentID = 0; 
  uint8_t newID = 2; 
  int32_t get_data = 1; 

  //Initializes the serial monitor
  Serial.begin(9600); 
  while(!Serial); //Wait for opening serial monitor
  delay(10);

  //Initialize communication to the dynamixels
  dxl_wb.init("1", 1000000); 
  uint16_t model_number = 0; 
  dxl_wb.ping(currentID, &model_number);  

  //Change the ID from current to new
  dxl_wb.itemWrite(currentID, "ID", newID); 
  dxl_wb.ping(newID, &model_number); 

  //Check the ID property of the dynamixel
  dxl_wb.itemRead(newID, "ID", &get_data); 

  //Prints the data to the serial monitor
  Serial.print("The new ID of the Dynamixel is: "); 
  Serial.println(get_data);

  //Change the ID back to 1
  dxl_wb.itemWrite(newID, "ID", currentID); 
  dxl_wb.ping(currentID, &model_number); 

  //Check the ID property of the dynamixel
  dxl_wb.itemRead(currentID, "ID", &get_data); 

  //Prints the data to the serial monitor
  Serial.print("Dynamixel ID returned to: "); 
  Serial.println(get_data);



}

void loop() {
  // put your main code here, to run repeatedly:

}
