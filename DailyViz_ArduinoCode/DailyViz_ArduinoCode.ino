
// Vizzy Arduino Code 72u Summer Session

#include "Keyboard.h"

// set pin numbers for the five buttons:
const int one = 13;
const int two = 12;
const int three = 11;
const int four = 10;
const int five = 9;
const int reset = 8;

void setup() { // initialize the buttons' inputs:
  pinMode(one, INPUT);
  pinMode(two, INPUT);
  pinMode(three, INPUT);
  pinMode(four, INPUT);
  pinMode(five, INPUT);
  pinMode(reset, INPUT);

  Serial.begin(9600);
  Keyboard.begin();
  while (!Serial) {
    Serial.print("hello");
  }
}

void loop() {
    // use the pushbuttons to control the keyboard:
    if (digitalRead(one) == HIGH) {
      Keyboard.write('a');
      Serial.print("hello");
    }
    if (digitalRead(two) == HIGH) {
      Keyboard.write('2');
    }
    if (digitalRead(three) == HIGH) {
      Keyboard.write('3');
    }
    if (digitalRead(four) == HIGH) {
      Keyboard.write('4');
    }
    if (digitalRead(five) == HIGH) {
      Keyboard.write('5');
    }
    if (digitalRead(reset) == HIGH) {
      Keyboard.write('0');
    }
}

