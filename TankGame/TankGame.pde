// 1 April 2026 | TankGame by Anders Millican
Tank tank;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
PImage bg;
Obstacle o1, o2, o3;
int score;

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
  scorePanel();
  for (int i = 0; i < projectiles.size(); i++) {
  Projectile p = projectiles.get(i);
  p.display();
  p.move();
}
}

void scorePanel() {
  fill(127,200);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);
  fill(255);
  textSize(30);
  text("Score", width/2, 25);
}

void mousePressed() {
  projectiles.add(new Projectile(tank.x, tank.y, 4, 10));
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
