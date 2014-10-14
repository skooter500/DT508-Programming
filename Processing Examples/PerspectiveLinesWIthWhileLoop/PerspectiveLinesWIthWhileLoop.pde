void setup()
{
  size(500, 500);
  centX = width / 2;
  centY = height / 2;
  
}

int centX, centY;

void draw()
{
  int x = 0;
  
  while (x < width)
  {
    line(x, height, centX, centY);
    x += 10;
  }
  
  int y = centY;
  int gap = 2;
  while (y < height)
  {
    line(0, y, width, y);
    y += gap;
    gap += 2;
  }
  
  /*
  line(100, 100, 100, 200);
  line(150, 100, 150, 200);
  line(200, 100, 200, 200);
  line(250, 100, 250, 200);
  */
}
