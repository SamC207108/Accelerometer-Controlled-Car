int motor1pin1 = 2;
int motor1pin2 = 3;

int motor2pin1 = 4;
int motor2pin2 = 5;

int ENApin = 9;
int ENBpin = 10;

void setup() {
  Serial.begin(9600);
  // put your setup code here, to run once:
  pinMode(motor1pin1, OUTPUT);
  pinMode(motor1pin2, OUTPUT);
  pinMode(motor2pin1, OUTPUT);
  pinMode(motor2pin2, OUTPUT);

  
  pinMode(ENApin, OUTPUT); 
  pinMode(ENBpin, OUTPUT);
  
}

void loop() {

  
  if (Serial.available() > 0) {
    
    String data = Serial.readStringUntil('\n'); // Read until newline
    data.trim(); // Remove extra spaces/newlines
    int commaIndex = data.indexOf(','); // Find the comma position
    if (commaIndex > 0) {
      String SpeedValueLeft = data.substring(0, commaIndex);  // First part
      String SpeedValueRight = data.substring(commaIndex + 1); // Second part

      float AbsoluteSpeedLeft = abs(SpeedValueLeft.toFloat());
      float AbsoluteSpeedRight = abs(SpeedValueRight.toFloat());

      if (SpeedValueLeft.toFloat() > 0){
        digitalWrite(motor1pin1,HIGH);
        digitalWrite(motor1pin2, LOW);
      }else if(SpeedValueLeft.toFloat()<0){
        digitalWrite(motor1pin1,LOW);
        digitalWrite(motor1pin2, HIGH);
      }
      if (SpeedValueRight.toFloat() > 0){
        digitalWrite(motor2pin1,HIGH);
        digitalWrite(motor2pin2, LOW);
      }else if(SpeedValueRight.toFloat()  <0){
        digitalWrite(motor2pin1,LOW);
        digitalWrite(motor2pin2, HIGH);
      }
      Serial.println("Left motor speed: " + SpeedValueLeft + " Right motor speed: " + SpeedValueRight);

      analogWrite(ENApin, AbsoluteSpeedLeft);  // Set motor speed
      analogWrite(ENBpin, AbsoluteSpeedRight);
      
      
    }
  }
  
}
  
