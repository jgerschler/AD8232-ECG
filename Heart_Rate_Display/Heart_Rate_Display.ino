void setup() {
  // initialize the serial communication:
  Serial.begin(9600);
  pinMode(24, INPUT); // Setup for leads off detection LO +
  pinMode(25, INPUT); // Setup for leads off detection LO -

}

void loop() {
  
  if((digitalRead(24) == 1)||(digitalRead(25) == 1)){
    Serial.println('!');
  }
  else{
    // send the value of analog input 0:
      Serial.println(analogRead(A0));
  }
  //Wait for a bit to keep serial data from saturating
  delay(1);
}
