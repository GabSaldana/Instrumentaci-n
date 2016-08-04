int p3 = A3; 
void setup()
{
  //iniciamos la comunicacionserial a 9600 bits/seg entre la tarjeta y el ordenador
  Serial.begin(9600);
  
}

void loop()
{
  //leemos la entrada que nos regresa el adc del pin 3
  int sensorValue3 = analogRead(p3);
  //mapeamos el valor entregado por el adc a 8 bits
  sensorValue3 = map( sensorValue3, 0, 1023, 0, 255);
  String pin3=String(sensorValue3);
  Serial.print(pin3);
  Serial.print("\n");
  delay(1);
  
}
