Particle[] particles;

void setup()
{
  size(1000, 1000);
  background(51);
  particles = new Particle[300];
  
  for (int nI = 2; nI < particles.length; nI++) {
    particles[nI] = new NormalParticle();
  }
  
  particles[0] = new OddballParticle();
  particles[1] = new JumboParticle();
}

void draw()
{
  fill(0,0,0,30);
  rect(0,0,1000,1000);
  
  for (int nI = 0; nI < particles.length; nI++) {
    particles[nI].show();
    particles[nI].move();
  }
}

class NormalParticle implements Particle
{
  double dX, dY, dTheta, dSpeed;
  
  public NormalParticle() {
    dX = 320;
    dY = 240;
    dTheta = Math.random() * 2 * Math.PI;
  }
  
  public void move() {
    dSpeed = Math.random() * 10;
    dX += Math.cos(dTheta) * dSpeed;
    dY += Math.sin(dTheta) * dSpeed;
    
    dTheta += 0.1;
  }
  
  public void show() {
    fill((int) (Math.random() * 256), (int) (Math.random() * 256), (int) (Math.random() * 256));
    ellipse((float) dX, (float) dY, 20, 20);
  }
}

interface Particle
{
  public void show();
  public void move();
}

class OddballParticle implements Particle //uses an interface
{
  double dX, dY, dTheta, dSpeed;
  
  public OddballParticle() {
    dX = 700;
    dY = 400;
    dTheta = Math.random() * 3 * Math.PI;
  }
  
  public void move() {
    dSpeed = Math.random() * 15;
    dX += Math.cos(dTheta) * dSpeed;
    dY += Math.sin(dTheta) * dSpeed;
    
    dTheta += 0.5;
  }
  
  public void show() {
    fill((int) (Math.random() * 256), (int) (Math.random() * 256), (int) (Math.random() * 256));
    rect((float) dX, (float) dY, 10, 10);
  }
}
class JumboParticle extends NormalParticle //uses inheritance
{
  double radius;
  boolean onWayDown;
  
  public JumboParticle() {
    dX = 500;
    dY = 500;
    radius = 10;
    onWayDown = false;
  }
  
  public void show() {
    fill((int) (Math.random() * 256), (int) (Math.random() * 256), (int) (Math.random() * 256));
    ellipse((float) dX, (float) dY, (float) radius, (float) radius);
    if (onWayDown) {
      radius--;
      if (radius == 10) onWayDown = false;
    }
    else {
      radius++;
      if (radius > 200) onWayDown = true;
    }
  }
}
