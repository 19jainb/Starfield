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
  boolean onWayDown, normal;
  
  public NormalParticle() {
    dX = 500;
    dY = 500;
    dTheta = Math.random() * 2 * Math.PI;
    dSpeed = Math.random() * 10;
    normal = true;
  }
  
  public void move() {
    dX += Math.cos(dTheta) * dSpeed;
    dY += Math.sin(dTheta) * dSpeed;
    
    dTheta += 0.1;
    if (dSpeed < 50) {
      dSpeed += 0.1;
    } else {
      if (normal) dSpeed = 10;
      else dSpeed -= 3;
    }
  }
  
  public void show() {
    fill((int) (Math.random() * 256), (int) (Math.random() * 256), (int) (Math.random() * 256));
    ellipse((float) dX, (float) dY, 7.5, 7.5);
  }
}

interface Particle
{
  public void show();
  public void move();
}

class OddballParticle implements Particle //uses an interface
{
  double dX, dY, dTheta, dSpeed, dXBounce, dYBounce;
  boolean goUp, goDown, goLeft, goRight;
  
  public OddballParticle() {
    dX = 500;
    dY = 500;
    dTheta = Math.random() * 2 * Math.PI;
    
    goUp = false;
    goDown = false;
    goLeft = false;
    goRight = false;
    
    dSpeed = 50;
    
    dXBounce = Math.cos(dTheta) * dSpeed;
    dYBounce = Math.sin(dTheta) * dSpeed;
  }
  
  public void move() {
    if (dX <= 0) {
        dXBounce *= -1;
    } else if (dX >= 1000) {
        dXBounce *= -1;
    }
    
    if (dY <= 0) {
        dYBounce *= -1;
    } else if (dY >= 1000) {
        dYBounce *= -1;
    }
      
    dX += dXBounce;
    dY += dYBounce;
  }
  
  public void show() {
    fill((int) (Math.random() * 256), (int) (Math.random() * 256), (int) (Math.random() * 256));
    rect((float) dX, (float) dY, 25, 25);
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
    normal = false;
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
