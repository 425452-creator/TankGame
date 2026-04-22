class Obstacle {
  //Member Variables
  float x, y, w, h, health, speed;
  PImage obstacle;

  // Constructor
  Obstacle(float x, float y, float w, float h, float health, float speed) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.health=health;
    this.speed=speed;
    obstacle = loadImage("obstacle.png");
  }

  void display() {
    image(obstacle, x, y);
  }

  void move() {
    x=x+random(speed, 2*speed);
    y=y+random(-speed, speed);
  }

  boolean reachedEdge() {
    if (x>width || x < -101 || y>height || y<0) {
      return true;
    } else {
      return false;
    }
  }
  
}
