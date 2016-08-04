import processing.serial.*;

Serial port;
float brightness =0;//

void setup(){
  size(500,500);//seleccionamos el tamaño de la pantalla
  port=new Serial(this,"COM8",9600);//seleccionamos el puerto com y el baud rate
  port.bufferUntil('\n');
}

void draw(){
   background(0,4*brightness,3*brightness);//seleccionamos el color de la  pantalla
 }

void serialEvent(Serial port){
  brightness=float(port.readStringUntil('\n'));//asignamos el valor leido a la variable
}