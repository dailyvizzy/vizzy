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
    String imageName;
    
    if (pngFiles.length > 0) {
      
      randomizer = random((int)pngFiles.length);
      imageName = pngFiles[(int)randomizer];
       
      if (imageName.equals(".DS_Store")){
        randomizer = random((int)pngFiles.length);
        imageName = pngFiles[(int)randomizer];
        println("IMAGE .DS_STORE SKIPPED!!!!");
      }
      
      PImage png = loadImage(pngPath + "/" + imageName);
      println("currentPNG" + " " + imageName);
      return png;
    } else return null;
    
  }
  
  
   PImage getRandomBack(){
    String imageName;
      
    if (backFiles.length > 0) {
      
      randomizer = random((int)backFiles.length);
      imageName = backFiles[(int)randomizer];
      
      if (imageName.equals(".DS_Store")){
        randomizer = random((int)backFiles.length);
        imageName = backFiles[(int)randomizer];
      }
        
      PImage back = loadImage(backPath +  "/" + imageName );
       println("currentBack" + " " + imageName);
      return back;
    } else return null;
    
  }
    
}