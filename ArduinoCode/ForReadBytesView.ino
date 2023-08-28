/*
Prints bytes that happen to be valid ascii characters to the serial port in a repeating loop. 

The circuit:
  - None to speak of

  created 2023
  by Carlyn Maw
  
  This example code is in the public domain.

*/

void setup() {
  // initialize the serial communication:
  Serial.begin(9600);
}

int thisByte = 33;

void loop() {
  Serial.write(thisByte);
  thisByte ++;
  if (thisByte > 126) {
    thisByte = 33;
  }
  //give the serial port a break.
  //can play with number to check on effectiveness of VTIME settings
  delay(2);
}