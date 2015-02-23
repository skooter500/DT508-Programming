void setup()
{
  size(500, 500);
  
  players.add(new Player(100, 100, 100));
  players.add(new Player(200, 200, 60));
}

ArrayList<Player> players = new ArrayList<Player>();

void draw()
{
  background(0);
  
  for(int i = 0 ; i < players.size() ; i ++)
  {
    players.get(i).move();
    players.get(i).display();
  }
  
}
