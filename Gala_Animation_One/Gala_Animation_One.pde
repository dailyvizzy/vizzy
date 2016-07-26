float x=0; 
float y=0;   //general x and y
float qDistTop = 110;  //y value for question

PFont font;  //font object
float randFont; //font randomizer
float rectHeight=10;    //used for rect height
float rectWide=220;    //used for rect height

Table table;  //table of questions

File fontDir = new File("/Users/akleindolph/Documents/Processing3/Daily_Data_Viz/LoadRandomFontTest/fonts/");   //specific to my computer :0
String[] fontFileNames = fontDir.list();
String curQ; //current question
String movQ; //represents moving question

int vizGrowth[]={0, 0, 0, 0, 0};
int vizObjectsColor[]={10, 60, 120, 160, 200};

void setup() {

  fullScreen();
  noCursor();
  background(255);

  loadData();

  randFont = random((int)fontFileNames.length-1);     //randomize front
  font = createFont("/Users/akleindolph/Documents/Processing3/Daily_Data_Viz/fonts/"+fontFileNames[(int)randFont], 100); //random font chosen
  println(fontFileNames);
  textFont(font);
  textAlign(CENTER, CENTER);

  fill(0);
  textSize((displayWidth/2) - (575 + (curQ.length()*2)));     //text adjusts to size of question
  text(curQ, width/2, qDistTop);

}

void draw() {

  y=height;
  x=0;
  for (int i=0; i<5; i++) {
    x+=width/6;
    fill(vizObjectsColor[i], vizObjectsColor[4-i], 195, 30);
    rectMode(CENTER);
    rect(x, y, 230, vizGrowth[i]);
  }
}

void loadData() {
  // Load CSV file into a Table object
  table = loadTable("/Users/akleindolph/Documents/Processing3/Daily_Data_Viz/questions/gala_CSV_test.csv");
  curQ = table.getString(table.getRowCount()-1, 0);
}

void keyPressed() {
  float grow = 30;
  switch(key) {
  case '1': 
    vizGrowth[0]-=grow;
    break;
  case '2': 
    vizGrowth[1]-=grow;
    break;
  case '3': 
    vizGrowth[2]-=grow;
    break;
  case '4': 
    vizGrowth[3]-=grow;
    break;
  case '5': 
    vizGrowth[4]-=grow;
    break;
  case '0':
    updateQuestion();
    displayQ();
    break;
  }
}

void displayQ() {
  background(255);
  x=0; 
  y=0;

  randFont = random((int)fontFileNames.length-1);     //randomize front
  font = createFont("/Users/akleindolph/Documents/Processing3/Daily_Data_Viz/fonts/"+fontFileNames[(int)randFont], 100); //random font chosen
  textFont(font);

  fill(0);
  textSize((displayWidth/2) - (575 + (curQ.length()*2)));     //text adjusts to size of question
  text(curQ, width/2, qDistTop);

  for (int i=0; i<5; i++) {
    vizGrowth[i]=0;
  }
}

void updateQuestion() {
  table.addRow();                                       //add a row
  for (int i=table.getRowCount()-2; i>=0; i--) {        //copy every row string to the row below
    movQ = table.getString(i, 0);
    table.setString(i+1, 0, movQ);
  }
  movQ = table.getString(table.getRowCount()-1, 0);    //move the bottom row string to the top
  table.setString(0, 0, movQ);
  table.removeRow(table.getRowCount()-1);


  saveTable(table, "/Users/akleindolph/Documents/Processing3/Daily_Data_Viz/questions/gala_CSV_test.csv");           // Writing the CSV back to the same file        
  loadData();                                           // And reloading it
}