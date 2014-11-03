void setup()
{
  printName("Bryan");
  String n = "Patrick";
  printName(n);
  
  println(rectArea(10, 20));
  println(pointInside(10, 10, 20, 20, 50));
  if (pointInside(10, 10, 20, 20, 50))
  {
    println("Its inside");
  }
  
  println(grade(73));
}

void printName(String name)
{
  println("Hello" + name);
}

float rectArea(float w, float h)
{
  return w * h;
}

String grade(int val)
{
  if (val <= 100 && val >= 70)
  {
    return "First";
  }
  else if (val >= 60 && val < 70)
  {
    return "2.1";
  }
  else if (val >= 50 && val < 60)
  {
    return "2.2";
  }
  else if (val >= 40 && val < 50)
  {
    return "Pass";
  }
  else if (val >= 0 && val < 40)
  {
    return "Fail";
  }
  else
  {
    return "Out of range";
  }
  
  
}

boolean pointInside(float x, float y, float cx, float cy, float radius)
{
  float xDist = cx - x;
  float yDist = cy - y;
  float dist = sqrt((xDist * xDist) + (yDist * yDist));
  
  return (dist < radius);
  /*
  if (dist < radius)
  {
    return true;
  }
  else
  {
    return false;
  }
  */
}
