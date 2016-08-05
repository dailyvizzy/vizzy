
// Vizzy Arduino Code 72u Summer Session

#include "Keyboard.h"

// set pin numbers for the five buttons:
const int one = 13;
const int two = 12;
const int three = 11;
const int four = 10;
const int five = 9;
const int reset = 8;

const int LEDone = 7;
const int LEDtwo = 6;
const int LEDthree = 5;
const int LEDfour = 4;
const int LEDfive = 3;

int buttonDelay = 50;

void setup() { // initialize the buttons' inputs:
  pinMode(one, INPUT);
  pinMode(two, INPUT);
  pinMode(three, INPUT);
  pinMode(four, INPUT);
  pinMode(five, INPUT);
  pinMode(reset, INPUT);

  pinMode(LEDone, OUTPUT);
  pinMode(LEDtwo, OUTPUT);
  pinMode(LEDthree, OUTPUT);
  pinMode(LEDfour, OUTPUT);
  pinMode(LEDfive, OUTPUT);

  Serial.begin(9600);
  Keyboard.begin();

}

void loop() {
  // use the pushbuttons to control the keyboard:
  if (digitalRead(one) == HIGH) {
    digitalWrite(LEDone, HIGH);
    delay(buttonDelay);
    if (digitalRead(one) == LOW) {
      Keyboard.write('1');
    }
  }
  else if (digitalRead(two) == HIGH) {
    digitalWrite(LEDtwo, HIGH);
    delay(buttonDelay);
    if (digitalRead(two) == LOW) {
      Keyboard.write('2');
    }
  }
  else if (digitalRead(three) == HIGH) {
    digitalWrite(LEDthree, HIGH);
    delay(buttonDelay);
    if (digitalRead(three) == LOW) {
      Keyboard.write('3');
    }
  }
  else if (digitalRead(four) == HIGH) {
    digitalWrite(LEDfour, HIGH);
    delay(buttonDelay);
    if (digitalRead(four) == LOW) {
      Keyboard.write('4');
    }
  }
  else if (digitalRead(five) == HIGH) {
    digitalWrite(LEDfive, HIGH);
    delay(buttonDelay);
    if (digitalRead(five) == LOW) {
      Keyboard.write('5');
    }
  }
  else if (digitalRead(reset) == HIGH) {
    delay(buttonDelay);
    if (digitalRead(reset) == LOW) {
      Keyboard.write('0');
    }
  }
  digitalWrite(LEDone, LOW);
  digitalWrite(LEDtwo, LOW);
  digitalWrite(LEDthree, LOW);
  digitalWrite(LEDfour, LOW);
  digitalWrite(LEDfive, LOW);
}
