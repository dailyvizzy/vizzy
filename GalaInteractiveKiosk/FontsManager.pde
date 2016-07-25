class FontsManager {
  
  String path; 
  File fontDir;
  String[] fontFileNames;
  
  PFont font;  //font object
  float randFont; //font randomizer


  FontsManager() {
    path = dataPath("fonts");
    File fontDir = new File(path);
    fontFileNames = fontDir.list();
    println(fontFileNames);
  } 
  
  PFont getRandomFont(){
    randFont = random((int)fontFileNames.length);
    font = createFont(path+"/"+fontFileNames[(int)randFont], 60);
    return font;
  }
    
}