import processing.serial.*;
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
color c = color (255,0,0);
int x= 500;
int y = 500;
int speed=0;
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
   String movx = val.substring(2,3);
   println(movx);
speed = Integer.parseInt(movx);
x=x+speed;
}
}

void display () {
  fill(c);
  rect(x,y,30,30);
}