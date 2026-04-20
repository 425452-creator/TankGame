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
      //fill(255,0,0);
      //rect(x,y,10,10);
    } else if (idir == 'a') {
      image(itank, x, y) ;
      //fill(255,0,0);
      //rect(x,y,10,10);
    } else if (idir == 's') {
      image(itank, x, y);
      //fill(255,0,0);
      //rect(x,y,10,10);
    } else if (idir == 'd') {
      image(itank, x, y);
      //fill(255,0,0);
      //rect(x,y,10,10);
    }
  }

  void move(char dir) {
    if (dir == 'w') {
      y=y-speed;
    } else if (dir == 's') {
      y=y+speed;
    } else if (dir == 'a') {
      x=x-speed;
    } else if (dir == 'd') {
      x=x+speed;
    }
  }

  void fire() {
  }
}
