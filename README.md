# Accelerometer-Controlled-Car
This repository contains Arduino IDE and Processing IDE code for a TT motor car controlled by an accelerometer.

This project is an Arduino-powered car controlled wirelessly via a Bluetooth connection. The car's movement is dictated by an MPU6050 accelerometer attached to a separate Arduino, which sends tilt data to a Processing IDE interface. The car adjusts speed and direction based on the orientation of the accelerometer.

![Adobe Express - file (1)](https://github.com/user-attachments/assets/20decdaa-d81d-4566-bb98-2120be2082e2)
![Adobe Express - file (2)](https://github.com/user-attachments/assets/17e79ea9-26fc-4c40-87c0-359b00d84254)


**Features**
- Wireless control via Bluetooth (MERQC HC-05 or similar)
- Direction and speed determined by tilt (X and Y acceleration)
- Uses MPU6050 for motion sensing
- Real-time serial communication between Processing IDE and Arduinos
- Deadzone filtering for smoother control

**Hardware Used**
- 2x DC Motors + L298N Motor Driver
- 2x Arduino Uno
- HC-05 Bluetooth Module
- MPU6050 Accelerometer
- Breadboard, Jumper Wires, Resistors
- Power Source (e.g battery pack)

**How It Works**
- Accelerometer Arduino reads MPU6050 data, sends it to the computer via USB.
- Processing IDE receives acceleration data, converts it to motor commands for the left and ride side wheels of the car, and sends them via Bluetooth to the car's Arduino.
- The HC-05 bluetooth module recieves a number for each wheel from -255 to 255, sends that number to the car arduino and drives the motors accordingly

**Installation & Setup**

_Arduino Side_

1. Upload mpu_reader.ino to the MPU6050 Arduino.

2. Upload car_controller.ino to the motor control Arduino.

3. Connect Bluetooth module RX/TX correctly (dont forget to disconnect RX when uploading code!).

4. Wire up the L298N to motors and control pins. (wiring diagram below)

_Processing Side_

1. Make sure you are connected to the HC-05 bluetooth module on the device you are using. The password for my module was "1234", check the documentation for your specific one. You should notice that the HC-05 module is blinking lights when it is searching for a connected, once it finds that connection the lights will stay on.
   
2. Open control_interface.pde in Processing IDE.
   
3. Adjust COM ports to match your Bluetooth and Arduino ports. (all the COM ports will be listed in the terminal, may take a few attempts to find the right ports to use)

5. Run the sketch — car should respond to tilting motions.


