
final int X_OFFSET  =  40;                     // x-distance to left upper corner of window
final int Y_OFFSET  =  165;                     // y-distance to left upper corner of window
final int BOT_DIST  =  80;                     // distance to bottom line of window
final int COL_WIDTH =   4;                     // column widt
final int Y_DIST    =  64;                     // distance horizontal lines
final int X_DIST    =   5;                     // distance vertical lines
final int X_MAX     = (128+1)*X_DIST+1;        // x-axis lenght
final int Y_MAX     = 256;                     // y-axis lenght
final int X_WINDOW  = X_MAX + 2*X_OFFSET;      // window width
final int Y_WINDOW  = Y_MAX+BOT_DIST+Y_OFFSET; // window height
final int X_ENUM    = 10;
PFont fontA;
color graphColor = color(38,198,218);
color morado = color(156,39,176);
color verde = color(58,175,34);
color rosa = color(233,30,99);
color amarillo = color(255,235,59);
color azul = color(26,35,126);
color lima = color(118,255,3);
color naranja = color(239,108,0);
PFont fontGraph;
import processing.serial.*;
Serial port;
int[] inBuffer = new int[128];

void draw_grid()                               // draw grid an title
{ 
  int count=0;

  background(255,255,255);//azul
  stroke(0);
  for (int x=0+X_DIST; x<=X_MAX; x+=X_DIST)    // vertical lines
  {
    if ( X_ENUM == count || 0 == count)
    { 
      line (x+X_OFFSET, Y_OFFSET, x+X_OFFSET, Y_MAX+Y_OFFSET+10);
      count=0;
    }
    else
    {
      line (x+X_OFFSET, Y_OFFSET, x+X_OFFSET, Y_MAX+Y_OFFSET);
    }    
    count++;
  }
  for (int y=0; y<=Y_MAX; y+=Y_DIST)           // horizontal lines 
  {
    line (X_OFFSET, y+Y_OFFSET, X_MAX+X_OFFSET, y+Y_OFFSET);
    textFont(fontA, 16);
    text( (Y_MAX-y), 7, y+Y_OFFSET+6);
  }
  
  textFont(fontA, 32);
  fill(graphColor); 
  textFont(fontA, 16);
  text("magnitude(8bit)", 7, 20); 
  //text(" frequency   f ( i ) = i * SAMPLE_RATE / FHT_N ", 350, Y_WINDOW-Y_OFFSET/2 );
} 

void serialEvent(Serial p)                      // ISR triggerd by "port.buffer(129);"
{ 
  if ( 255 == port.read() )                     //  1 start-byte               
  {
    inBuffer = int( port.readBytes() ); 
    //mayor(inBuffer);
  }
}

void setup() 
{ 
  size(700,500);                    // size of window
  noStroke();
  fontGraph = loadFont("ArialUnicodeMS-48.vlw");
  textFont(fontGraph, 12);
  println(Serial.list());                        // show available COM-ports
  port = new Serial(this, "COM8", 115200);
  port.buffer(129);                              // 1 start-byte + 128 data-bytes 
  fontA = loadFont("ArialUnicodeMS-48.vlw");
  textFont(fontA, 16);
}

void draw() 
{ 
  int count=0;

  draw_grid();
  //mayor(inBuffer);
  for (int i=0; i<128; i++)
  { 
    
    if(i == 2){
      fill(naranja);
      rect(i*X_DIST+X_OFFSET+X_DIST-COL_WIDTH/2, height-BOT_DIST, COL_WIDTH, -inBuffer[i]);
      //System.out.println("NARANJA : " + (inBuffer[i]) );
    }
    else if(i == 3){
      fill(morado);
      rect(i*X_DIST+X_OFFSET+X_DIST-COL_WIDTH/2, height-BOT_DIST, COL_WIDTH, -inBuffer[i]);
      //System.out.println("MORADO : " + (inBuffer[i]) );
    }
    else if(i == 4){
      fill(verde);
      rect(i*X_DIST+X_OFFSET+X_DIST-COL_WIDTH/2, height-BOT_DIST, COL_WIDTH, -inBuffer[i]);
      //System.out.println("VERDE: " + (inBuffer[i]) );
    }
    else if(i == 5){
      fill(rosa);
      rect(i*X_DIST+X_OFFSET+X_DIST-COL_WIDTH/2, height-BOT_DIST, COL_WIDTH, -inBuffer[i]);
      //System.out.println("ROSA: " + (inBuffer[i]) );
    }
    else if(i == 6){
      fill(amarillo);
      rect(i*X_DIST+X_OFFSET+X_DIST-COL_WIDTH/2, height-BOT_DIST, COL_WIDTH, -inBuffer[i]);
      //System.out.println("AMARILLO: " + (inBuffer[i]) );
    }
    else if(i == 7){
      fill(azul);
      rect(i*X_DIST+X_OFFSET+X_DIST-COL_WIDTH/2, height-BOT_DIST, COL_WIDTH, -inBuffer[i]);
      //System.out.println("AZUL: " + (inBuffer[i]) );
    }
    else if(i == 8){
      fill(lima);
      rect(i*X_DIST+X_OFFSET+X_DIST-COL_WIDTH/2, height-BOT_DIST, COL_WIDTH, -inBuffer[i]);
      //System.out.println("LIMA: " + (inBuffer[i]) );
    }
    else{
      fill(graphColor);
      rect(i*X_DIST+X_OFFSET+X_DIST-COL_WIDTH/2, height-BOT_DIST, COL_WIDTH, -inBuffer[i]);
    }
    
    matching(inBuffer[2],inBuffer[3],inBuffer[4],inBuffer[5],inBuffer[6],
    inBuffer[7],inBuffer[8]);
    
    if ( X_ENUM == count || 0 == count)
    { 
      text(i, (i+1)*X_DIST+X_OFFSET-COL_WIDTH/2, height-BOT_DIST+25);
      count=0;
    }
    count++;
  }
}



public void mayor(int[] numeros) {
        int mayor;
        int pos;
        mayor=numeros[0];
        pos=0;
        for(int f=1;f<numeros.length;f++) {
            if (numeros[f] > mayor) {
                mayor=numeros[f];
                pos=f;
            }
        }
        System.out.println("El mayor es " + numeros[pos]);
        //matching(numeros[pos]);
 }
 
 public void matching(int Naranja, int Morado, int Verde, int Rosa,
 int Amarillo, int Azul, int Lima){
   if(Naranja< 128 && Morado > 128 && Verde > 128 && Rosa < 128 && Amarillo < 128 
   && Azul < 128 && Lima < 128){
     System.out.println("DO");
   }
   
   else if(Naranja < 128 && Morado > 128 && Verde > 128 && Rosa >= 128  ){
     System.out.println("RE");
   }
   else if(morado < 128 && Naranja < 128 && Amarillo > 140  && Verde > 140 && Rosa > 140 ){
     System.out.println("SOL");
   }
   else if(Verde > 128  && Rosa > 128 && Amarillo > 128 && Morado < 128 && 
   Azul < 128 && Lima < 128 && Naranja < 128){
     System.out.println("FA");
   }
   else if(Morado < 128 && Verde > 128 && Rosa > 128 ){
     System.out.println("MI");
   }
   
   else if(Lima > 128  && Azul > 128 && Amarillo > 128 ){
     System.out.println("SI");
   }
   else if(Rosa > 128  && Amarillo > 128 && Azul > 128 ){
     System.out.println("LA");
   }
   
   else{
      System.out.println("...");   
   }
 }