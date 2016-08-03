float x=0, y=0;
float pick=0;

void setup() {
  fullScreen();
  background(255, 255, 255);
}

void draw() {
  strokeWeight(1);
  stroke(0, 20, random(255));
  fill(0, 20, random(255));

  for (int col=0; col<(height+600); col+=300) {

    for (int row =0; row<(width+600); row+=300) {
      pick = random(2);

      for (int i = 0; i<=300; i+=10) {
        line(x+row+i, y+col, x+row+i, y+300+col);
      }
      x+=300;
      for (int i = 0; i<=300; i+=10) {
        line(x+row, y+i+col, x+row+300, y+i+col);
      }
    }
    x=0;
  }
}