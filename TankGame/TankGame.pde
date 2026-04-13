// 1 April 2026 | TankGame by Anders Millican
Tank tank;
PImage bg;
Obstacle o1, o2, o3;

void setup() {
  size (1000, 1000);
  bg= loadImage("bg.png");
  tank = new Tank();
  o1 = new Obstacle(100, 100, 100, 20, 5, 5);
  o2 = new Obstacle(100, 300, 100, 20, 5, 5);
  o3 = new Obstacle(100, 500, 100, 20, 5, 5);
}

void draw () {
  background (127);
  imageMode(CORNER);
  image(bg, 0, 0);
  tank.display();
  o1.display();
  o2.display();
  o3.display();
  o1.move();
  o2.move();
  o3.move();
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
