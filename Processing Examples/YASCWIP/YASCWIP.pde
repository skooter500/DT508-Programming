void setup()
{
  size(500, 500);
  
  p1 = new Player(100, 100, 100);
  p2 = new Player(200, 200, 60);
}

Player p1;
Player p2;

void draw()
{
  background(0);
  p1.move();
  p1.display();
  p2.move();
  p2.display();
}
