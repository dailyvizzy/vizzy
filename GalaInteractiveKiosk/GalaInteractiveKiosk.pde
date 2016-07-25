
AnimationsManager animationsManager;
FontsManager fontsManager;
ImagesManager imagesManager;
QuestionsManager questionsManager;

AbstractAnimation dailyAnimation;


void setup () {
  
  //size(1024, 768);
  fullScreen();
  noSmooth();
  frameRate(60);
  
  animationsManager = new AnimationsManager(this);
  fontsManager = new FontsManager();
  imagesManager = new ImagesManager();
  questionsManager = new QuestionsManager();
  
  animationsManager.initAnimations();
  
  initRandomAnimation();

  dailyAnimation.setup();
}

void initRandomAnimation() {
  
  dailyAnimation = animationsManager.getRandomAnimation();
  
  dailyAnimation.font = fontsManager.getRandomFont();
  dailyAnimation.image = imagesManager.getRandomPNG();
  dailyAnimation.background = imagesManager.getRandomBack();
  dailyAnimation.question = questionsManager.getCurrentQuestion();
  
  
  
}

void draw() {
  dailyAnimation.draw();
}

void update() {
  dailyAnimation.update();
}

void keyPressed () {
  dailyAnimation.keyPressed(key);
}