void setup()
{
  size(500, 500);
  
  font = createFont("Arial",16,true);  
}

float buildingHeight = 80.0f;
float ladder = 110.0f;
float bottom = 200.0f;
float right = 200;
PFont font;

void draw()
{
    textFont(font,16);
    text("A message " + ladder, 10, 10);
    line(right, bottom, right, bottom - buildingHeight); 
    
    float distToBuilding = sqrt((ladder * ladder) - (buildingHeight * buildingHeight));

    line(right - distToBuilding, bottom, right, bottom);  

    line(right - distToBuilding, bottom, right, bottom - buildingHeight);
    
    float theta;
    
    theta = asin(buildingHeight / ladder);
    text("Theta by asin: " + theta, 100, 100);
    theta = acos(distToBuilding / ladder);    
    println("Theta by acos: ", theta);    
    theta = atan(buildingHeight / distToBuilding);        
    println("Theta by asin: ", theta);
    
}
