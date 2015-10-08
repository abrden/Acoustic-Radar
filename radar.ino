#include <Servo.h>

// Pins
const int trigPin = 10;
const int echoPin = 11;
const int servoPin = 8;

// Servo's degree range
const int minDegree = 15;
const int maxDegree = 165;

long duration;
long distance;
Servo myServo;

void setup() {
  
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an output
  pinMode(echoPin, INPUT); // Sets the echoPin as an input
  myServo.attach(servoPin); // Defines on which pin is the servo motor attached
  
  Serial.begin(9600); // Initialize Serial communication

}

void loop() {
      
  // Rotates the servo motor from 15 to 165 degrees
  for(int degree = minDegree; degree <= maxDegree; degree++) {  
    moveServo(degree);
  }
  
  // Repeats the previous lines from 165 to 15 degrees
  for(int degree = maxDegree; degree >= minDegree; degree--) {  
    moveServo(degree);
  }
  
}

void moveServo(int degree) {

  myServo.write(degree);
  delay(30);

  calculateDistance(); // Calls a function for calculating the distance measured by the Ultrasonic sensor for each degree

  printData(degree);
  
}

void calculateDistance() { 
  
  // The sensor is triggered by a HIGH pulse of 10 or more microseconds.
  // Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
  digitalWrite(trigPin, LOW); 
  delayMicroseconds(2);
  
  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH); 
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
 
  // Read the signal from the sensor: a HIGH pulse whose
  // duration is the time (in microseconds) from the sending
  // of the ping to the reception of its echo off of an object.
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  
  distance = microsecondsToCentimeters(duration);
  
}

long microsecondsToCentimeters(long microseconds) {
  
  // The speed of sound is 340 m/s or 29 microseconds per centimeter.
  // The ping travels out and back, so to find the distance of the
  // object we take half of the distance travelled.
  return microseconds / 29 / 2;

}

void printData(int degree) {

  Serial.print(degree); // Sends the current degree into the Serial Port
  Serial.print("-");
  Serial.println(distance); // Sends the distance value into the Serial Port
  
}
