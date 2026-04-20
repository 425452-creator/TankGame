class Projectile {
  //Member Variables
  float x, y, w, h, speed;
  float vx, vy;
  char dir;


  // Constructor
  Projectile(float x, float y, float vx, float vy) {
    this.x=x;
    this.y=y;
    this.vx=vx;
    this.vy=vy;
    this.w=10;
    this.h=10;
    speed = 2;
    dir = 'u';
  }

  void display() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }

  void move() {
    x+=vx*speed;
    y+=vy*speed;
  }

  void fire() {
  }
  boolean reachedEdge() {
    if (x>width || x < -101 || y>height || y<0) {
      return true;
    } else {
      return false;
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
}
