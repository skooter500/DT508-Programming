// A class is a template for an object
class Player
{
   // These variables are called fields of the Player class
   float w;
   PVector pos;
   PVector forward;
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
    forward = new PVector();
    rot = 0;
  }



  // These are methods on the class
  void display()
  {
    pushMatrix();
    stroke(255);
    float halfW = w * 0.5f;
    translate(pos.x, pos.y);
    rotate(rot);
    
    line(0, 0,  - halfW, halfW);
    line(0 - halfW, halfW, 0, - halfW);
    line(0, - halfW, 0 + halfW, halfW);
    line(0 + halfW, halfW, 0, 0);
    popMatrix();
  }
  
  void move()
  {
    forward.x = sin(rot);
    forward.y = - cos(rot);
    if (keyPressed)
    {
      if (keyCode == UP)
      {
        pos.add(forward);
      }
      if (keyCode == LEFT)
      {
        rot -= 0.1f;
      }
      if (keyCode == RIGHT)
      {
        rot += 0.1f;
      }
      
    }
    
  }
}
