
AnimationsManager animationsManager;
FontsManager fontsManager;
ImagesManager imagesManager;
QuestionsManager questionsManager;

AbstractAnimation dailyAnimation;


void setup () {
  
  //size(1024, 768);
  fullScreen();
  smooth();
  frameRate(60);
  textAlign(CENTER,CENTER);
  
  animationsManager = new AnimationsManager(this);
  fontsManager = new FontsManager();
  imagesManager = new ImagesManager();
  questionsManager = new QuestionsManager();
  
  animationsManager.initAnimations();
  
  getRandomAnimation();

  dailyAnimation.setup();
}

void getRandomAnimation() {
  
  dailyAnimation = animationsManager.getRandomAnimation();
  
  dailyAnimation.font = fontsManager.getRandomFont();
  dailyAnimation.image = imagesManager.getRandomPNG();
  dailyAnimation.background = imagesManager.getRandomBack();
  dailyAnimation.question = questionsManager.getCurrentQuestion();
  dailyAnimation.imgOrVec = (int)random(2);
}

void draw() {
  dailyAnimation.draw();
}

void update() {
  dailyAnimation.update();
}

void keyPressed () {
  
  dailyAnimation.keyPressed(key);
  switch(key) {
     case '0': 
        getRandomAnimation();
        break;
   }
}