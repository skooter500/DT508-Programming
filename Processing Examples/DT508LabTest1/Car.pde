class Car
{
  PVector position;
  PVector direction;
  float theta;
  float w;
  float h;
  color colour;
  
  Car(float x, float y, float theta, float w, float h, color colour)
  {
    position = new PVector(x, y);
    direction = new PVector(0, -1);
    this.theta = theta;
    this.w = w;
    this.h = h;
    this.colour = colour;
  }
  
  void move()
  {
    direction.x = sin(theta);
    direction.y = - cos(theta);
    position.add(direction);
    
    float halfW = w / 2;
    float halfH = h / 2;
    
    if (position.x + halfW > width)
    {
       position.x = width - halfW;
       theta += HALF_PI; 
    }
   
    if (position.y + halfH > height)
    {
       position.y = height - halfH;
       theta += HALF_PI; 
    }
   
    if (position.x - halfW < 0)
    {
       position.x = halfW;
       theta += HALF_PI; 
    }
   
    if (position.y - halfH < 0 )
    {
       position.y = halfH;
       theta += HALF_PI; 
    } 
    
  }
  
  void display()
  {
    stroke(colour);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    float left = w * 0.4f;
    
    noFill(); 
    rect(-left, - h * 0.5f, left * 2, h);
    
    // Draw the wheels
    
    rect(-w * 0.5, - h * 0.4f, w * 0.1f, h * 0.2f);
    rect(left, - h * 0.4f, w * 0.1f, h * 0.2f);

    rect(-w * 0.5,  h * 0.2f, w * 0.1f, h * 0.2f);
    rect(left,  h * 0.2f, w * 0.1f, h * 0.2f);
    
    // Draw the triangle
    line(-left, h * 0.5f, 0, -h * 0.5f);
    line(left, h * 0.5f, 0, -h * 0.5f);
    //rect(-w, h * 0.2f, w * 0.1f, h * 0.2f);
    popMatrix();
  }   
}

