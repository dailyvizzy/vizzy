class AnimationsManager {

  PApplet app;
  
  ArrayList<AbstractAnimation> anims;
  AbstractAnimation currentAnim;

  int animIndex = 0;
  boolean bHasChanged;
  
  AnimationsManager(PApplet app) {
    this.app = app;
    bHasChanged = false;
  } 

  void initAnimations () {
   
    anims = new ArrayList<AbstractAnimation>();
    anims.add( new GalaAnimation(app));
    anims.add( new GalaAnimationBar(app));
    
    setAnimation((int)random(anims.size()));
    currentAnim = anims.get(animIndex);
  }
  

  void setup(){
     currentAnim.setup();
  }

  void update () { 
    currentAnim.update();
   
    if (bHasChanged) {
      //currentAnim = anims.get(animIndex);
    }
  }
  
  void draw() {
    currentAnim.draw();
  }

  void setAnimation(int index)
  {
    animIndex = index;
    bHasChanged = true;
  }

 AbstractAnimation getRandomAnimation(){
   return currentAnim;
 }
  
  void keyPressed(int key) { 
    currentAnim.keyPressed(key);
  }
  
}