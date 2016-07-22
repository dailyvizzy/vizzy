// A Table object
Table table;
String curQ; //current question
String movQ; //represents moving question

void setup() {
  size(640, 360);
  loadData();
}

void draw() {
  background(255);
  textAlign(LEFT);
  fill(0);
  textSize(30);
  text((String)curQ, 20, 100);
  println(table.getRowCount()-1);
}

void loadData() {
  // Load CSV file into a Table object
  table = loadTable("data/gala_CSV_test.csv");
  curQ = table.getString(table.getRowCount()-1, 0);
}

void mousePressed() {
  newQuestion();
}

void newQuestion() {
  table.addRow();                                       //add a row
  for (int i=table.getRowCount()-2; i>=0; i--) {        //copy every row string to the row below
    movQ = table.getString(i, 0);
    table.setString(i+1, 0, movQ);
  }
  movQ = table.getString(table.getRowCount()-1, 0);    //move the bottom row string to the top
  table.setString(0, 0, movQ);
  table.removeRow(table.getRowCount()-1);


  saveTable(table, "data/gala_CSV_test.csv");           // Writing the CSV back to the same file        
  loadData();                                           // And reloading it
}