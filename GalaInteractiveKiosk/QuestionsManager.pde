class QuestionsManager {

  // A Table object
  Table table;
  String currentQuestion; //current question
  String movingQuestion; //represents moving question
  
  QuestionsManager() { 
    //table = loadTable("data/questions/Gala_CSV_Questions.csv");
    table = loadTable("/Users/gala/Dropbox/Gala_CSV_Questions.csv"); 
  } 
  
  private void loadQuestion() {
    currentQuestion = table.getString(table.getRowCount()-1, 0);
    getReadyToNext();
  }
  
  private void getReadyToNext() {
    
    table.addRow();                                       //add a row
    for (int i=table.getRowCount()-2; i>=0; i--) {        //copy every row string to the row below
      movingQuestion = table.getString(i, 0);
      table.setString(i+1, 0, movingQuestion);
    }
    
    movingQuestion = table.getString(table.getRowCount()-1, 0);    //move the bottom row string to the top
    table.setString(0, 0, movingQuestion);
    table.removeRow(table.getRowCount()-1); 
    saveTable(table, "data/questions/Gala_CSV_Questions.csv");           // Writing the CSV back to the same file        
  }
  
  public String getCurrentQuestion(){
    this.loadQuestion();
    return currentQuestion;
  }
}