class FontsManager {
  
  String path; 
  File fontDir;
  //File[] fontFiles;
  String[] fontFileNames;
  
  PFont font;  //font object
  float randFont; //font randomizer


  FontsManager() {
    path = dataPath("fonts");
    File fontDir = new File(path);
    fontFileNames = fontDir.list();
    println(fontFileNames);
    
    /* TODO; Better filter de Array to avoid .DS_Store*/
    /*fontFiles = fontDir.listFiles(new FilenameFilter() {
        @Override
        public boolean accept(File dir, String name) {
            return !name.equals(".DS_Store");
        }
    });*/
  } 
  
  PFont getRandomFont(){
    
    String fontName;
    randFont = random((int)fontFileNames.length);
    fontName = fontFileNames[(int)randFont];
    
    if (fontName.equals(".DS_Store")){
      randFont = random((int)fontFileNames.length);
      fontName = fontFileNames[(int)randFont];
      println("FONT .DS_STORE SKIPPED!!!!");
    }
    
    font = createFont(path+"/"+fontName, 60);
    println("currentfont" + " " + fontName);   //see randomly choosen font
    return font;
  }
    
}