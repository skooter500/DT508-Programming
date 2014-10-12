void setup()
{
  size(500, 500);
  y = height / 2;
}

int radius = 20;
int x = radius;
int xDir = 10;
int y;

void draw()
{
  background(0);
  ellipse(x, y, radius * 2, radius * 2);
  x += xDir;
  if ((x < radius) || (x > (width - radius)))
  {
    xDir = - xDir;
  }
}
