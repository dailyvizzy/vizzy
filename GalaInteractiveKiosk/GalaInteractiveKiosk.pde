AnimationsManager animationsManager;bb

void setup () {

  size(1024, 768, OPENGL);
  noSmooth();
  frameRate(60);

  // we init the the animation manager,
  animationsManager = new AnimationsManager(this);
  animationsManager.setAnimations();
  animationsManager.setAudioInput(in);


}



void draw() {

  // clear background color
  background(0);

  // We store our animation as a graphic texture and get it
  animationsManager.update();
  animationsManager.prepass();
  tex = animationsManager.getCanvasAsTexture();
  
 
  pushMatrix();
  //Draw animation
  popMatrix();
}

void keyPressed () {


  if (key == ' ') 
    animationsManager.nextAnimation();
    animationsManager.keyPressed(key);
}




