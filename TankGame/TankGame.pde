// 1 April 2026 | TankGame by Anders Millican
Tank tank;
PImage bg;
Obstacle o1;

void setup() {
  size (1000, 1000);
  bg= loadImage("bg.png");
  tank = new Tank();
  o1 = new Obstacle(100, 100, 100, 20, 5);
}

void draw () {
  background (127);
  imageMode(CORNER);
  image(bg, 0, 0);
  tank.display();
  o1.display();
}

void keyPressed() {
  if(key == 'w') {
    tank.move('w');
  } else if (key == 's') {
    tank.move('s');
  } else if (key == 'a') {
    tank.move('a');
  } else if (key == 'd') {
    tank.move('d');
  }
}
