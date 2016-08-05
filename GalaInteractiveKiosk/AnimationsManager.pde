class AnimationsManager {

  PApplet app;

  ArrayList<AbstractAnimation> anims;
  AbstractAnimation currentAnim;

  int animIndex = 0;

  AnimationsManager(PApplet app) {
    this.app = app;
  } 

  void initAnimations () {

    anims = new ArrayList<AbstractAnimation>();
    anims.add( new GalaAnimation(app)); 
    anims.add( new GalaAnimationBar(app));
    anims.add( new GalaAnimationTiny(app));
    anims.add( new GalaAnimationAntenna(app));
    anims.add( new GalaAnimationMoire(app));
    anims.add( new GalaAnimationSpiral(app));
    anims.add( new GalaAnimationCubes(app));
  }

  void setAnimation(int index)
  {
    animIndex = index;
    currentAnim = anims.get(animIndex);
  }

  AbstractAnimation getRandomAnimation() {
    int random = (int)random(anims.size());
    setAnimation(random);
    return currentAnim;
  }

  void keyPressed(int key) { 
    currentAnim.keyPressed(key);
  }
}