void setup()
{
  ages = new float[10];
  names = new String[10];
  
  ages[0] = 42;
  names[0] = "Bryan";

  ages[1] = 21;
  names[1] = "Darius";

  ages[2] = 19;
  names[2] = "Garet";

  ages[3] = 22;
  names[3] = "James";

  ages[4] = 19;
  names[4] = "Thomas";

  ages[5] = 20;
  names[5] = "Aaron";

  ages[6] = 26;
  names[6] = "Simon";

  ages[7] = 22;
  names[7] = "Patrick";

  ages[8] = 19;
  names[8] = "Aaron G";

  ages[9] = 23;
  names[9] = "Vikki";
  
  //println(names[0] + " age is " + ages[0]);
  //println(names[1] + " age is " + ages[1]);
  
  for (int i = 0 ; i < ages.length ; i ++)
  {
    println(names[i] + " age is " + ages[i]);    
  }
  
  float young = Float.MAX_VALUE;
  float old = Float.MIN_VALUE;
  int oldIndex = 0, youngIndex = 0;
  for (int i = 0 ; i < ages.length ; i ++)
  {
    if (ages[i] < young)
    {
      young = ages[i];
      youngIndex = i;
    }
    if (ages[i] > old)
    {
      old = ages[i];
      oldIndex = i;
    }
  }
  println(names[oldIndex] + " is the oldest");
  println(names[youngIndex] + " is the youngest");
}

float[] ages;
String[] names;

// Another way to make an array...
float[] test = {9, 7,6, 6};

void draw()
{
}
