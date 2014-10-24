void setup()
{
  size(700, 700);
  centX = width / 2;
  centY = height / 2;
}

int centX, centY;
int gap = 25;

void draw()
{
  background(0);

  for (int y = 0 ; y <= height ; y += gap)
  {
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(0, y, width, height - y);
  }
  for (int x = 0 ; x <= width ; x += gap)
  {
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(x, 0, width - x, height);
  }
  
  for(int radius = 0 ; radius < centX ; radius += gap)
  {
    stroke(random(0, 255), random(0, 255), random(0, 255));
    fill(0,0,0,0);
    ellipse(centX / 2, centY / 2, radius, radius);
    ellipse(centX * 1.5f, centY / 2, radius, radius);
    ellipse(centX / 2, centY * 1.5f, radius, radius);
    ellipse(centX * 1.5f, centY * 1.5f, radius, radius);    
  }
}
