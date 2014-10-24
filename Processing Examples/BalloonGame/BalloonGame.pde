void setup()
{
  size(500, 500);
  for (int i = 0 ; i < numBalloons ; i ++)
  {
    balloonX[i] = random(0, width);
    balloonWidth[i] = random(50, 100);
    balloonColour[i] = color(random(0, 255), random(0, 255), random(0, 255));
    balloonSpeed[i] = random(1, 4);
    balloonY[i] = height + (balloonWidth[i] / 2);
  }
}

int numBalloons = 5;
float[] balloonX = new float[numBalloons];
float[] balloonY = new float[numBalloons];
float[] balloonWidth = new float[numBalloons];
color[] balloonColour = new color[numBalloons];
float[] balloonSpeed = new float[numBalloons];

int score = 0;

void mousePressed()
{
  for (int i = 0 ; i < numBalloons ; i ++)
  {
    float xDist = mouseX - balloonX[i];
    float yDist = mouseY - balloonY[i];
    float dist = sqrt(xDist * xDist + yDist * yDist);
    if (dist < balloonWidth[i] / 2)
    {
      score ++;
      balloonX[i] = random(0, width);
      balloonWidth[i] = random(50, 100);
      balloonColour[i] = color(random(0, 255), random(0, 255), random(0, 255));
      balloonSpeed[i] = random(1, 4);
      balloonY[i] = height + (balloonWidth[i] / 2);
    }
  }  
}

void draw()
{
  background(0);
  for (int i = 0 ; i < numBalloons ; i ++)
  {
    fill(balloonColour[i]);
    stroke(balloonColour[i]);
    ellipse(balloonX[i], balloonY[i] 
      , balloonWidth[i]
      , balloonWidth[i]
      );
      balloonY[i] -= balloonSpeed[i];
      
      if (balloonY[i] < (- balloonWidth[i] / 2))
      {
        balloonX[i] = random(0, width);
        balloonWidth[i] = random(50, 100);
        balloonColour[i] = color(random(0, 255), random(0, 255), random(0, 255));
        balloonSpeed[i] = random(1, 4);
        balloonY[i] = height + (balloonWidth[i] / 2);
      }
  }
  
  fill(255);
  text("Score: " + score, 20, 20);
}
