void setup()
{
  size(500, 500);
  
  float border = 50;
  
  cars.add(new Car(border / 2, height / 2, 0, 50, 50, color(255)));  
  cars.add(new Car(width / 2, border / 2, HALF_PI, 50, 50, color(255)));  
  cars.add(new Car(width - border / 2, height / 2, PI, 50, 50, color(255)));  
  cars.add(new Car(width / 2 , height - border / 2, -HALF_PI, 50, 50, color(255)));  
  
}

int numcars = 3;
ArrayList<Car> cars = new ArrayList<Car>();

void draw()
{
  background(0);
  for(Car car:cars)
  {
    car.move();
    car.display();
  }
}

