import processing.serial.*;

Serial myPort;        
int xPos = 1;         
float height_old = 0;
float height_new = 0;
float inByte = 0;


void setup () {
  size(1000, 400);        

  println(Serial.list());
  myPort = new Serial(this, Serial.list()[2], 9600);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
  background(0xff);
}


void draw () {
}


void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    inString = trim(inString);

    // If leads off detection is true notify with blue line
    if (inString.equals("!")) { 
      stroke(0, 0, 0xff); //Set stroke to blue ( R, G, B)
      inByte = 512;  // middle of the ADC range (Flat Line)
    }
    // If the data is good let it through
    else {
      stroke(0xff, 0, 0); //Set stroke to red ( R, G, B)
      inByte = float(inString); 
     }
     
     //Map and draw the line for new data point
     inByte = map(inByte, 0, 1023, 0, height);
     height_new = height - inByte; 
     line(xPos - 1, height_old, xPos, height_new);
     height_old = height_new;
    
      if (xPos >= width) {
        xPos = 0;
        background(0xff);
      } 
      else {
        xPos++;
      }
    
  }
}