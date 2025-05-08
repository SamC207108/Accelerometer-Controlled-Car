# Accelerometer-Controlled-Car
This repository contains Arduino IDE and Processing IDE code for a TT motor car controlled by an accelerometer.

This project is a 2-wheeled Arduino-powered car controlled wirelessly via a Bluetooth connection. The car's movement is dictated by an MPU6050 accelerometer attached to a separate Arduino, which sends tilt data to a Processing IDE interface. The car adjusts speed and direction based on the orientation of the accelerometer.

🚀 Features
Wireless control via Bluetooth (HC-05 or similar)

Direction and speed determined by tilt (X and Y acceleration)

Uses MPU6050 for motion sensing

Real-time serial communication between Processing and Arduino

Deadzone filtering for smoother control

🧰 Hardware Used
2x DC Motors + L298N Motor Driver

2x Arduino Uno

HC-05 Bluetooth Module

MPU6050 Accelerometer

Breadboard, Jumper Wires, Resistors, LEDs (for debugging)

Power Source (e.g., battery pack)

🛠️ How It Works
Accelerometer Arduino reads MPU6050 data, sends it to the computer via USB.

Processing IDE (Java Mode) receives acceleration data, converts it to motor commands (e.g., speed and turn), and sends them via Bluetooth to the car Arduino.

Car Arduino receives a string like 120,-75, splits it, and drives the motors accordingly.

⚙️ Installation & Setup
Arduino Side
Upload mpu_reader.ino to the MPU6050 Arduino.

Upload car_controller.ino to the motor control Arduino.

Connect Bluetooth module RX/TX correctly (crossed, and disconnect RX when uploading code).

Wire up the L298N to motors and control pins.

Processing Side
Open control_interface.pde in Processing IDE.

Adjust COM ports to match your Bluetooth and Arduino ports.

Run the sketch — car should respond to tilting motions.

Right motor: -75 (reverse)

🧪 To Do
Add battery power management

Design 3D printable chassis

Add mobile app for control (future idea)
