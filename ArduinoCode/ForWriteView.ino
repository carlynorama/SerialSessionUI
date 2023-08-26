/*
  Variation on Dimmer example. 

  Demonstrates sending data from the computer to the Arduino board, in this case
  to control the brightness of an LED. The data is sent in individual bytes,
  each of which ranges from 0 to 255. Arduino reads these bytes and uses them to
  set the brightness of the LED.

  https://www.arduino.cc/en/Tutorial/BuiltInExamples/Dimmer

  The circuit:
  - LED attached from digital pin 9 to ground through 220 ohm resistor.
  - ADDED: LED attached to digital pin 6 to power via a 220 ohm resistor (sinking the source).
  - Serial connection to Processing, Max/MSP, or another serial application

 
*/

const int ledPin = 9;  // the pin that the LED is attached to
const int noSignalPin = 6; 

unsigned long previousMillis = 0;
const long interval = 30;
byte brightness = 0;

void setup() {
  // initialize the serial communication:
  Serial.begin(9600);
  // initialize the ledPin as an output:
  pinMode(ledPin, OUTPUT);
  analogWrite(ledPin, 0); //LOW is off because anode is wired to pin

  //ADDITION TO DIMMER CODE
  pinMode(noSignalPin, OUTPUT);
  digitalWrite(noSignalPin, HIGH);  //HIGH is off because cathode is wired to pin
}

void loop() {
  unsigned long currentMillis = millis();

  if (Serial.available()) {
    digitalWrite(noSignalPin, HIGH);
    brightness = Serial.read();

  } else {
     if (currentMillis - previousMillis >= interval) {
      previousMillis = currentMillis;
      if (brightness > 0) {
        brightness = brightness - 1;
      }
     }
     digitalWrite(noSignalPin, LOW);
  }

  analogWrite(ledPin, brightness);
}
