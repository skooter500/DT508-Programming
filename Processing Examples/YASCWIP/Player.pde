// A class is a template for an object
class Player
{
   // These variables are called fields of the Player class
   float w;
   PVector pos;
   PVector velocity;
   float rot;
  
  // This method is called a constructor.
  // There is no return type
  // There is no return statement
  // It must be the same name as the class
  // It is called when the class is instantiated into an object 
  // Default constructor doesnt take any parameters
  Player()
  {
     this(width / 2, height / 2, 100); // Constructor chaining
  }
  
  Player(float x, float y, float w)
  {
    this.w = w;
    pos = new PVector(x, y);
    velocity = new PVector();
    rot = 0;
  }


  // These are methods on the class
  void display()
  {
    stroke(255);
    float halfW = w * 0.5f;
    rotate(rot);
    line(pos.x, pos.y, pos.x - halfW, pos.y + halfW);
    line(pos.x - halfW, pos.y + halfW, pos.x, pos.y - halfW);
    line(pos.x, pos.y - halfW, pos.x + halfW, pos.y + halfW);
    line(pos.x + halfW, pos.y + halfW, pos.x, pos.y);
  }
  
  void move()
  {
    if (keyPressed)
    {
      if (keyCode == UP)
      {
        velocity.y = -1;
        velocity.x = 0;
      }
      if (keyCode == LEFT)
      {
        rot -= 0.1f
      }
      if (keyCode == RIGHT)
      {
        rot += 0.1f
      }
      
    }
    pos.add(velocity);
    velocity.x = 0;
    velocity.y = 0;
  }
}
