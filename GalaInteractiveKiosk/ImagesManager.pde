class ImagesManager {
  
  String pngPath; 
  String backPath;
  
  File pngDir;
  File backDir;
  
  String[] pngFiles;
  String[] backFiles;
  
  float randomizer;

  ImagesManager() {
    
    // PNGs
    pngPath = dataPath("images");
    File pngDir = new File(pngPath);
    pngFiles = pngDir.list();
    println(pngFiles);
    
    // Backgrounds
    backPath = dataPath("background");
    File backDir = new File(backPath);
    backFiles = backDir.list();
    println(backFiles);
    
  } 
  
  PImage getRandomPNG(){
    if (pngFiles.length > 0) {
      randomizer = random((int)pngFiles.length);
      PImage png = loadImage(pngPath + "/" + pngFiles[(int)randomizer]);
      return png;
    } else return null;
    
  }
  
   PImage getRandomBack(){
    if (backFiles.length > 0) {
      randomizer = random((int)backFiles.length);
      PImage back = loadImage(backPath +  "/" + backFiles[(int)randomizer]);
      return back;
    } else return null;
    
  }
    
}