class Tank {
  //Member Variables
  float x, y, w, h, speed, health;
  PImage itank;
  char idir;

  // Constructor
  Tank() {
    x = 100.0;
    y = 100.0;
    w = 100.0;
    h = 100.0;
    speed = 5.0;
    health = 75.0;
    itank = loadImage("Millican_Tank.png");
    idir = 'w';

  }

  void display() {
    imageMode(CENTER);

    if (idir == 'w') {
 
      image (itank, x, y);
    } else if (idir == 'a') {
    
      image(itank, x, y) ;
    } else if (idir == 's') {
      image(itank, x, y);
    } else if (idir == 'd') {
      image(itank, x, y);
    }

  }



  void move(char dir) {
    if (dir == 'w' || dir == 'W') {
      y=y-speed;
      idir='w';
    } else if (dir == 's' || dir == 'S') {
      y=y+speed;
      idir='s';
    } else if (dir == 'a' || dir == 'A') {
      x=x-speed;
      idir='a';
    } else if (dir == 'd' || dir == 'D') {
      x=x+speed;
      idir='d';
    }
  }
  boolean intersect(Obstacle o) {
    float d= dist(x,y,o.x,o.y);
    if (d<100) {
    return true;
    } else {
      return false;
    }
  }
  boolean intersect(PowerUp pu) {
    float d= dist(x,y,pu.x,pu.y);
    if (d<20) {
    return true;
    } else {
      return false;
    }
  }

  void fire() {
  }
}
