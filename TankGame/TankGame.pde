// 1 April 2026 | TankGame by Anders Millican
Tank tank;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
PImage bg;
int score;

void setup() {
  size (1000, 1000);
  bg= loadImage("bg.png");
  tank = new Tank();
  
}

void draw () {
  obstacles.add(new Obstacle(int(random(0, width)), int(random(0, height)), 100, 100, 5, int(random(1, 5))));
 
  background (127);
  imageMode(CORNER);
  image(bg, 0, 0);
  tank.display();
  scorePanel();
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();
  }
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
  }
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);
  fill(255);
  textSize(30);
  text("Score: " +score, width/2, 25);
}

void mousePressed() {
  float dx = mouseX - tank.x;
  float dy = mouseY - tank.y;
  float mag = sqrt(dx*dx+dy*dy);
  if(mag>0){
   dx/=mag;
   dy/=mag;
   
   float speed = 5;
  projectiles.add(new Projectile(tank.x, tank.y, dx*speed, dy*speed));
  }
}

void keyPressed() {
  if (key == 'w') {
    tank.move('w');
  } else if (key == 's') {
    tank.move('s');
  } else if (key == 'a') {
    tank.move('a');
  } else if (key == 'd') {
    tank.move('d');
  }
}
