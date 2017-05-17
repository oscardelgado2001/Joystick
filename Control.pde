import processing.serial.*;
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
String movx;
color c = color (0);
float x= 20;
float y = 500;
float xbola = 300;
float ybola = 400;
void setup(){
  size(1366,788);
    // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}

void draw(){
  background(255);
  move();
  display();
}


void move() {
  if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n');         // read it and store it in val
  if (val != null){
    movx = val.substring(3,5);
    println(movx);
    float speed = Float.parseFloat(movx);
    speed = speed*5;
    y= y+(speed);
    
    
  float xspeedball = 1;
  float yspeedball = 1;
  xspeedball= xspeedball*5;
  yspeedball= yspeedball*5;
  xbola = xbola*(xspeedball);
  ybola = ybola*(yspeedball);
    
  if (y < 0){
    y = 0;
  }
  
  if (y > 580){
    y = 580;
  }
  
  if (xbola>1366){
    xspeedball = xspeedball * (-1);
  }
  
  if (ybola > 580){
    yspeedball = yspeedball * (-1);
  }
  
  if (xbola < 35){
    xspeedball = xspeedball * (-1);
  }
  
  if (ybola < 0){
    yspeedball = yspeedball * (-1);
  
  }
}}
}
  


void display () {
  fill(c);
  rect(x,y,30,175);
  rect(xbola,ybola,20,20);
}
