class Obstacle {
  //Member Variables
  float x, y, w, h, health;
  PImage itank;

  // Constructor
  Obstacle(float x, float y, float w, float h, float health) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.health=health;
    itank = loadImage("Millican_Tank.png");
  }
  
   void display(){
     fill (128);
     rect (x,y,w,h);
   }
   
}
