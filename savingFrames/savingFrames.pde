PImage img;  // Declare variable of type PImage
int randImg;

PFont font;  //font object
float randFont; //font randomizer

File fontDir = new File("/Users/akleindolph/Documents/Processing3/Daily_Data_Viz/LoadRandomFontTest/fonts/");   //specific to my computer :0
String[] fontFileNames = fontDir.list();



File dir = new File(dataPath("/Users/akleindolph/Documents/Processing3/Daily_Data_Viz/LoadRandomPNGtest/images/"));
String[] list = dir.list();

void setup() {
  img = loadImage("/Users/akleindolph/Documents/Processing3/Daily_Data_Viz/LoadRandomPNGtest/images/"+list[0]);
  //size(displayWidth, displayHeight); 
  fullScreen();
  background(255);
  println(list);

  font = createFont("/Users/akleindolph/Documents/Processing3/Daily_Data_Viz/LoadRandomFontTest/fonts/"+fontFileNames[0], 100);
  println(fontFileNames);
  smooth();
}

void draw() {

  randImg = (int)random(3);
  img = loadImage("/Users/akleindolph/Documents/Processing3/Daily_Data_Viz/LoadRandomPNGtest/images/"+list[randImg]);
  //background(255);
  imageMode(CENTER);
  image(img, random(displayWidth), random(displayHeight));

  randFont = random((int)fontFileNames.length);

  //while (second()%2==0) {                         //change fonts every 2 seconds
  //  font = createFont("/Users/akleindolph/Documents/Processing3/Daily_Data_Viz/LoadRandomFontTest/fonts/"+fontFileNames[(int)randFont], 60);
  //}

  textFont(font);
  fill(0);
  textMode(CENTER);  
  text("don't be a fool", displayWidth/2-200, displayHeight/2);
  text("stay in school!", displayWidth/2-200, displayHeight/2+200);
  while (second()%2==0) {                         //change fonts every 2 seconds
    saveFrame("gala_daily_viz-#######.png");
  }
}