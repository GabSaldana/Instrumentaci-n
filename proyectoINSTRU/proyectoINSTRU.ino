int sensorPin = A3;    // select the input pin for the potentiometer
int sensorPin2 = A4;
int sensorPin3 = A7;
int ledPin = A0;      // select the pin for the LED
int sensorValue = 0;  // variable to store the value coming from the sensor
int sensorValue2 = 0;
int sensorValue3 = 0;
int cont=0;
void setup() {
  // declare the ledPin as an OUTPUT:
  pinMode(ledPin, OUTPUT);  
  Serial.begin(2400);
}

void loop() {
  // read the value from the sensor:
  sensorValue = analogRead(sensorPin); 
  sensorValue2 = analogRead(sensorPin2); 
  sensorValue3 = analogRead(sensorPin3);   
  // turn the ledPin on
  digitalWrite(ledPin, HIGH);  
  // stop the program for <sensorValue> milliseconds:
  // turn the ledPin off:        
  digitalWrite(ledPin, LOW);   
  // stop the program for for <sensorValue> milliseconds:
  Serial.print("A");  
  Serial.print(sensorValue);
  Serial.print("\n");
  delay(100);
  Serial.print("B");
  Serial.print(sensorValue2);
  Serial.print("\n");
  delay(100);
  Serial.print("C");
  Serial.print(sensorValue3);
  Serial.print("\n");
  delay(100);
}
