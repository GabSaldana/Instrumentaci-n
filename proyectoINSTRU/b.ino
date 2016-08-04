
/*

PROYECTO FINAL INSTRUMENTACION

MENDOZA GALVES FELIPE
ROSALES ARZOLA ALEJANDRO
VAZQUEZ CHOREÑO LUIS ERNESTO


*/

void setup()
{
  Serial.begin(9600);
}
void loop()
{
  String pin0=String(map(analogRead(A0),0,900,0,1023));
  String pin1=String(map(analogRead(A3),0,1023,0,200));
  String pin2=String(map(analogRead(A4),0,1023,0,100));
  String pin3=String(digitalRead(A7));
  String pin4=String(digitalRead(A6));
  Serial.println(pin0+","+pin1+","+pin2+","+pin3+","+pin4);
}
