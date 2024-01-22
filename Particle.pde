// Represents an atom - the building block
class Particle {
  float x;
  float y;
  //float vx;
  //float vy;
  PVector vel;
  float ax;
  float ay;
  float maxSpeed;
  //float friction;

  float prevX;
  float prevY;
  //int d;
  //color fillColor;

  Particle() {
    //d = 5;
    x = random(width);
    y = random(height);
    prevX = x;
    prevY = y;
    //vx = xVel;
    //vy = yVel;
    //vx = 0;
    //vy = 0;
    vel = new PVector (0, 0);
    ax = 0;
    ay = 0;
    //fillColor = color(fill);
    maxSpeed = 4;
  }

  void update() {
    prevX = x;
    prevY = y;
    //vx += ax;
    //vy += ay;
    vel.x += ax;
    vel.y += ay;
    vel.limit(maxSpeed);

    //x += vx;
    //y += vy;
    x += vel.x;
    y += vel.y;
    ax = 0;
    ay = 0;
  }

  void applyForce(PVector f) {
    ax += f.x;
    ay += f.y;
  }

  void render() {
    //strokeWeight(1);
    //stroke(0, 255, 0, 1);
    //pg.line(x, y, prevX, prevY);
    line(x, y, prevX, prevY);
    //point(x, y);
  }

  void edgeWrap() {
    if (x > width) {
      x=1;
      prevX = x;
    }
    if (x < 0) {
      x=width-1;
      prevX = x;
    }
    if (y > height) {
      y=1;
      prevY = y;
    }
    if (y < 0) {
      y=height-1;
      prevY = y;
    }
  }

  void follow(PVector[] vectors) {
    int X = floor(x/scl);
    int Y = floor(y/scl);
    if(X > cols-1) {X = cols-1;}
    if(Y > cols-1) {Y = cols-1;}
    int index = X + Y * cols;
    //println(index);
    PVector force = vectors[index];
    this.applyForce(force);
  }

  //void render() {
  //  fill(fillColor);
  //  circle(x, y, d);
  //}
  
  void reset() {
    x = random(width);
    y = random(height);
  }
}
