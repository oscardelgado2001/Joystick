import processing.serial.*;
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
String movx;
color c = color (255,0,0);
float x= 500;
float y = 500;
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
   x= x+(speed);
  }
}
  }


void display () {
  fill(c);
  rect(x,y,30,30);
}
