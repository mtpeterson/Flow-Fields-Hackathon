//Improvements I could make:
//give the perlin noise function as an argument into the particle.follow function rather than computing the entire field every frame
// this would only compute it for each particle
//Instead of using a cap for the speed in the particle.update function, apply a viscous friction force

//PGraphics pg;

float opacity = 2;
float stroke = 1;

//float inc = 0.002;
float inc = 0.05;
float zChange = 0.00002;
//float zChange = 0.00005;
//float zChange = 0.0005;
int scl = 10;
int particleNum = 10000;
int cols;
int rows;

float zoff = 0;

Particle[] particles;
PVector[] flowField;

int state;

void setup() {
  size(800, 800, P2D);
  colorMode(HSB);
  strokeWeight(stroke);
  //pg = createGraphics(width, height);
  
  background(32);
  cols = floor(width/scl);
  rows = floor(height/scl);
  particles = new Particle[particleNum];
  flowField = new PVector[cols * rows];
  
  for(int i = 0; i < particles.length; i++) {
    particles[i]= new Particle();
  }
  
  state = 0;
  //particles[0] = new Particle(width/2, height/2);
}

void draw() {
  float time = radians(frameCount);
  switch(state){
    case 0:
      stroke(255, opacity);
      break;
    case 1:
      background(32);
      stroke(0);
      reset();
      state++;
      break;
    case 2:
      stroke(0);
      break;
    case 3:
      background(255);
      stroke(0, opacity);
      inc = 0.1;
      reset();
      state++;
      break;
    case 4:
      stroke(0, opacity);
      break;
    case 5:
      background(32);
      inc = 0.05;
      stroke(255*(.5+.5*cos(time)),255,255, opacity);
      reset();
      state++;
      break;
    case 6:
      stroke(255*(.5+.5*cos(time)),255,255, opacity);
      break;
    case 7:
      background(32);
      stroke(255, opacity);
      reset();
      state = 0;
      break;
    //case 10:`
    //  break;
    //case 11:
    //  background(32);
    //  stroke(255, opacity);
    //  state = 0;
    //  break;
  }
  
  //pg.beginDraw();
  ////pg.background(0, 1);
  //pg.fill(32, 10);
  //pg.noStroke();
  //pg.rect(0, 0, width, height);
  //pg.stroke(255, 5);
  
  println(frameRate);
  //background(32, 1);
  float yoff = 0;
  for(int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      int index = x + y * cols;
      float angle = noise(xoff, yoff, zoff)*TWO_PI * 4;
      var v = PVector.fromAngle(angle);
      v.setMag(1);
      flowField[index] = v;
      xoff += inc;
      
      
      //strokeWeight(1);
      //stroke(255, 50);
      //push();
      //translate(x*scl, y*scl);
      //rotate(v.heading());
      //line(0, 0, scl, 0);
      //pop();
      
      
    }
    yoff += inc;
    
    zoff += zChange;
  }
  
  for(int i = 0; i < particles.length; i++) {
    particles[i].follow(flowField);
    particles[i].update();
    particles[i].edgeWrap();
    particles[i].render();
  }
  
  //pg.endDraw();
  //image(pg, 0, 0);
}

void keyPressed() {
  if(key == ' ') {
    state ++;
  }
}

void reset() {
  for(int i = 0; i < particles.length; i++) {
    particles[i].reset();
  }
}
