class PowerUp {
  //Member Variables
  float x, y, w, h;
  char type;
  

  // Constructor
  PowerUp(float x, float y) {
    this.x=x;
    this.y=y;
    this.w=50;
    this.h=50;
     if (int(random(4))==2) {
      type = 's';
      x = random(width);
      y = height + 100;
    } else if (int(random(3))==1) {
      type = 't';
      x = -100;
      y = random(height);
    } else if (int(random(2))==1) {
      type = 'o';
      x = width +100;
      y = random(height);
    }
  }

  void display() {
    rectMode(CENTER);
    fill(0,0,255);
    rect(x,y,w,h);
    fill(255);
    text("" +type, x, y);
  }

  void move() {
   
  }

  
}
