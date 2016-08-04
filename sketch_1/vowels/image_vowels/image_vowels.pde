import processing.serial.*;

Serial port;
float brightness =0;//
PFont f;                           // STEP 1 Declare PFont variable

void setup(){
  size(500,500);//seleccionamos el tamaño de la pantalla
  port=new Serial(this,"COM6",9600);//seleccionamos el puerto com y el baud rate
  port.bufferUntil('\n');
  f = createFont("RobotoCondensed-Regular",16,true); // STEP 2 Create Font

}

void draw(){
     
  textFont(f,300);                  // STEP 3 Specify font to be used
  fill(255);                         // STEP 4 Specify font color 
  
  if(0<=brightness && brightness<51){//0-50
     background(240,98,146);//rosa
     textAlign(CENTER);
     text("A!",270,350);   // STEP 5 Display Text
  }
  if(51<=brightness && brightness<102){//51-101
     
     background(38,150,243);//azul
     textAlign(CENTER);
     text("E!",270,350);   // STEP 5 Display Text
  }
  if(102<=brightness && brightness<153){//102-152
     
     background(58,175,34);//verde
     textAlign(CENTER);
     text("I!",270,350);   // STEP 5 Display Text
  }
  if(153<=brightness && brightness<204){//153-204
     
     background(255,193,7);//amarillo
     textAlign(CENTER);
     text("O!",270,350);  // STEP 5 Display Text
  }
  if(204<=brightness && brightness<256){//204-255
     background(244,67,54);//rojo
     textAlign(CENTER);
     text("U!",270,350);  // STEP 5 Display Text
  }
   
}

void serialEvent(Serial port){
  brightness=float(port.readStringUntil('\n'));//asignamos el valor leido a la variable
  System.out.println(brightness + "\n");
}