import processing.serial.*;

Serial myPortA;
Serial myPortM;
String data = "";
String ax = "";
//float axValue = Float.parseFloat(ax);
String ay = "";
String az = "";
String gx = "";
String gy = "";
String gz = "";

void setup() {
  size(500, 300);
  printArray(Serial.list()); // Print available ports (find your Bluetooth COM port)
  myPortA = new Serial(this, "COM6", 9600); 
  myPortA.bufferUntil('\n'); // Read until a newline character
  
  myPortM = new Serial(this, "COM7", 9600); // connecting to bluetooth module

}

void draw() {
  background(200);
  textSize(20);
  fill(0);
  text("MPU6050 Data: " + data, 50, height / 2);
}

// Runs when serial data is received
void serialEvent(Serial myPortA) {
  data = myPortA.readStringUntil('\n');
  //println(data);
  int numberOfCommas = data .replaceAll("[^,]","").length();  // checking if its a data point it is receiving
  if (data != null && numberOfCommas == 5) {
    data = trim(data); // Remove spaces/newlines
    String[] values = split(data, ','); // Split by comma
    if (values.length > 0) {
      ax = values[0]; 
      ay = values[1];
      az = values[2];
      gx = values[3];
      gy = values[4];
      gz = values[5];
      
      float deadzonex = 0.1f;
      float deadzoney = 100f;
      
      
      // --------------------------------------------------------- Calculating the speed the system will be going at -----------------------------------
      try { 
        float ayValue = Float.parseFloat(ay);
        //println("ay (number): " + ayValue);
        float ayspeed = -(ayValue/9.8)*255;
        if (ayspeed > 255){
          ayspeed = 255;
        } else if(ayspeed < -255) {
          ayspeed = -255;
        } else if (ayspeed < deadzoney && ayspeed > -deadzoney){
         ayspeed = 0;
        }
        
            
        // --------------------------------------------------------- Calculating Direction the system will be going -------------------------------------
      
        float axValue = Float.parseFloat(ax);
        float axfloat = -axValue/9.8f;
        
        if (axfloat > 1){
          axfloat = 1;
        } else if(axfloat < -1){
          axfloat = -1;
        } else if(axfloat < deadzonex && axfloat > -deadzonex){
          axfloat = 0;
        }
          
        //println("this is the speed: " + ayspeed + " this is the percent: "+ axfloat);
        
        float leftmotor = ayspeed;
        float rightmotor = ayspeed;
        
        if (axfloat < 0){
          leftmotor = ayspeed;
          rightmotor= (ayspeed - ayspeed*axfloat);
          
        } else if (axfloat > 0){
          rightmotor = ayspeed;
          leftmotor = (ayspeed + ayspeed*axfloat);
        } 
        
        int leftmotorInt = int(leftmotor);
        int rightmotorInt = int(-rightmotor);
        String datasending = str(leftmotorInt) + "," + str(rightmotorInt) + "\n";
        //String datasending = str(rightmotorInt) + "," + str(leftmotorInt) + "\n";
        println(datasending);
        myPortM.write(datasending);
        //println("left motor speed is: " + leftmotor + " right motor speed is: " + rightmotor);
      } catch (Exception e) {
        println("Error parsing ay: " + ay + "or ax: " + ax);
      }
      
      
    }
    
    
    
  }
}
