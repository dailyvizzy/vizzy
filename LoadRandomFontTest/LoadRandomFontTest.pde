//load a random font from a directory

PFont font;  //font object

File fontDir = new File("/Users/akleindolph/Documents/Processing/Daily_Data_Viz/DailyDataTest1/fonts");   //specific to my computer :0

void setup() {
  size(400,400);
  background(255);

  println("Listing all filenames in a directory: ");
  String[] fontFileNames = fontDir.list();
  println(fontFileNames);
}

void draw() {
}


void keyPressed() {
}