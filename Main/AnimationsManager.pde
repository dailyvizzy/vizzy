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
    anims.add( new Animation(app)); 
    anims.add( new AnimationBar(app));
    anims.add( new AnimationTiny(app));
    anims.add( new AnimationAntenna(app));
    anims.add( new AnimationMoire(app));
    anims.add( new AnimationSpiral(app));
    anims.add( new AnimationCubes(app));
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