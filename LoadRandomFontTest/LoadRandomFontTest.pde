//load a random font from a directory

PFont font;  //font object
float randFont; //font randomizer


File fontDir = new File("/Users/akleindolph/Documents/Processing3/Daily_Data_Viz/LoadRandomFontTest/fonts/");   //specific to my computer :0
String[] fontFileNames = fontDir.list();

void setup() {
  size(800, 400);
  background(255);

  font = createFont("../LoadRandomFontTest/fonts/"+fontFileNames[0], 60);
  println(fontFileNames);
  smooth();
}

void draw() {
  randFont = random((int)fontFileNames.length);
  
  while (second()%2==0) {                         //change fonts every 2 seconds
    font = createFont("../LoadRandomFontTest/fonts/"+fontFileNames[(int)randFont], 60);
  }
  
  background(255);
  textFont(font);
  fill(0);
  text("don't be a fool", 100, 100);
  text("stay in school!", 100, 200);
}

void keyPressed() {
}