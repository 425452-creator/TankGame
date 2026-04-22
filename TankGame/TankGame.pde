// 1 April 2026 | TankGame by Anders Millican
Tank tank;
Timer objt;
float m;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
PImage bg;
int score;

void setup() {
  size (1000, 1000);
  bg= loadImage("bg.png");
  tank = new Tank();
  objt = new Timer(1000);
  objt.start();
}

void draw () {
  m=1;
  background (127);
  imageMode(CORNER);
  image(bg, 0, 0);
  //Distribute object on timer
  if (objt.isFinished()) {
    obstacles.add(new Obstacle(int(random(-100, 20)), int(random(0, height)), 100, 100, 5, int(random(1, 5))));
    obstacles.add(new Obstacle(int(random(-100, 20)), int(random(0, height)), 100, 100, 5, int(random(1, 5))));
    obstacles.add(new Obstacle(int(random(-100, 20)), int(random(0, height)), 100, 100, 5, int(random(1, 5))));
    obstacles.add(new Obstacle(int(random(-100, 20)), int(random(0, height)), 100, 100, 5, int(random(1, 5))));
    obstacles.add(new Obstacle(int(random(-100, 20)), int(random(0, height)), 100, 100, 5, int(random(1, 5))));
    objt.start();
  }

  tank.display();
  scorePanel();
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();
    if (p.reachedEdge()) {
      projectiles.remove(i);
    }
  }
  for (int i=0; i<projectiles.size(); i++) {
    Projectile p =projectiles.get(i);
    for (int j = 0; j<obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        obstacles.remove(j);
        score = score +=10;
      }
      p.move();
    }
  }
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (o.reachedEdge()) {
      obstacles.remove(i);
    }
    if (tank.intersect(o)) {
      score=score-100;
      tank.x=100;
      tank.y=100;
      obstacles.remove(i);
    }
  }
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);
  fill(255);
  textSize(30);
  text("Score: " +score, width/2, 25);
  if (score < -300) {
    noLoop();
  }
}

void mousePressed() {
  float dx = mouseX - tank.x;
  float dy = mouseY - tank.y;
  float mag = sqrt(dx*dx+dy*dy);
  if (mag>0) {
    dx/=mag;
    dy/=mag;

    float speed = 5;
    projectiles.add(new Projectile(tank.x, tank.y, dx*speed, dy*speed));
    projectiles.add(new Projectile(tank.x+30, tank.y, dx*speed+m, dy*speed));
    projectiles.add(new Projectile(tank.x-30, tank.y, dx*speed-m, dy*speed));
    projectiles.add(new Projectile(tank.x, tank.y+30, dx*speed, dy*speed+m));
    projectiles.add(new Projectile(tank.x, tank.y-30, dx*speed, dy*speed-m));
    projectiles.add(new Projectile(tank.x+30, tank.y+30, dx*speed+m, dy*speed+m));
    projectiles.add(new Projectile(tank.x-30, tank.y-30, dx*speed-m, dy*speed-m));
    projectiles.add(new Projectile(tank.x+30, tank.y-30, dx*speed+m, dy*speed-m));
    projectiles.add(new Projectile(tank.x-30, tank.y+30, dx*speed-m, dy*speed+m));
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
