PImage img;  // Declare variable of type PImage
int randImg;

long interval = 5000;
long time = 0;

File dir = new File(dataPath("/Users/akleindolph/Documents/Processing3/Daily_Data_Viz/LoadRandomPNGtest/images/"));
String[] list = dir.list();

void setup() {
  img = loadImage("../LoadRandomPNGtest/images/"+list[0]);
  //size(displayWidth, displayHeight); 
  fullScreen();
  background(255);
  println(list);
}

void draw() {
  //background(255);
  imageMode(CENTER);
  image(img, width/2, height/2);
  if (millis()-time >= interval) {
    img = loadImage("../LoadRandomPNGtest/images/"+list[1]);
    image(img, width/2, height/2);
    time=millis();
  }
}