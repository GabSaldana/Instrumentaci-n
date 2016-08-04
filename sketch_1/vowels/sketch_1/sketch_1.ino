
void setup()
{
  //iniciamos la comunicacionserial a 9600 bits/seg entre la tarjeta y el ordenador
  Serial.begin(9600);
  
}

void loop()
{
  //leemos la entrada que nos regresa el adc del pin 3
  int sensorValue0 = analogRead(A0);
  //mapeamos el valor entregado por el adc a 8 bits
  sensorValue0 = map( sensorValue0, 0, 1023, 0, 255);
  String pin0=String(sensorValue0);
  Serial.print(pin0);
  Serial.print("\n");
  delay(1);
}
