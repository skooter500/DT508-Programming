void setup()
{
  size(500, 500);
  centX = width / 2;
  centY = height / 2;
  
}

int centX;
int centY;
int fw = 50;

void draw()
{
  boolean happy = false;
  for (int y = 25 ; y < height ; y += 50)
  {
    for (int x = 25 ; x < width ; x += 50)
    {
      ellipse(x, y, fw, fw);
      ellipse(x - 10, y - 10, 5, 5);
      ellipse(x + 10, y - 10, 5, 5);
      ellipse(x, y, 5, 5);      
      line(x - 10, y + 10, x + 10 , y + 10);
      if (happy)
      {
        line(x - 10, y + 10, x - 15, y + 5);
        line(x + 10, y + 10, x + 15, y + 5);
      }
      else
      {
        line(x - 10, y + 10, x - 15, y + 15);
        line(x + 10, y + 10, x + 15, y + 15);
      }
      happy = ! happy;
    }
  }
}
