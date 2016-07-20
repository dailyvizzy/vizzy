PImage img;  // Declare variable of type PImage
int randImg;


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

  randImg = (int)random(3);
  img = loadImage("../LoadRandomPNGtest/images/"+list[randImg]);
  //background(255);
  imageMode(CENTER);
  image(img, random(displayWidth), random(displayHeight));
}