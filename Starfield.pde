NormalParticle[] normalParticles;
OddballParticle[] oddParticles;

void setup()
{
  size(1000, 1000);
  background(51);
  normalParticles = new NormalParticle[300];
  oddParticles = new OddballParticle[300];
  
  for (int nI = 0; nI < normalParticles.length; nI++) {
    normalParticles[nI] = new NormalParticle();
  }
  
  for (int nI = 0; nI < oddParticles.length; nI++) {
    oddParticles[nI] = new OddballParticle();
  }
}

void draw()
{
  background(51);
  fill(0,0,0,25);
    rect(0,0,1000,1000);
  
  for (int nI = 0; nI < normalParticles.length; nI++) {
    normalParticles[nI].show();
    normalParticles[nI].move();
  }
  
  for (int nI = 0; nI < oddParticles.length; nI++) {
    oddParticles[nI].show();
    oddParticles[nI].move();
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
    ellipse((float) dX, (float) dY, 10, 10);
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
    dX = 400;
    dY = 400;
    dSpeed = Math.random() * 15;
    dTheta = Math.random() * 3 * Math.PI;
  }
  
  public void move() {
    dX = mouseX;
    dY = mouseY;
    dX += Math.cos(dTheta) * dSpeed;
    dY += Math.sin(dTheta) * dSpeed;
  }
  
  public void show() {
    fill((int) (Math.random() * 256), (int) (Math.random() * 256), (int) (Math.random() * 256));
    ellipse((float) dX, (float) dY, 10, 10);
  }
}
class JumboParticle //uses inheritance
{
  //your code here
}
