PImage img;  // Declare variable of type PImage
int randImg;


File dir = new File(dataPath("/Users/akleindolph/Documents/Processing/Daily_Data_Viz/LoadRandomPNGtest/images/"));
String[] list = dir.list();

void setup() {
  img = loadImage("/Users/akleindolph/Documents/Processing/Daily_Data_Viz/LoadRandomPNGtest/images/"+list[0]);
  size(displayWidth, displayHeight); 
  background(255);
  println(list);
}

void draw() {
  if (millis()%30==0) {
    randImg = (int)random(3);
    img = loadImage("/Users/akleindolph/Documents/Processing/Daily_Data_Viz/LoadRandomPNGtest/images/"+list[randImg]);
  }
  //background(255);
  image(img, random(displayWidth), random(displayHeight));
}