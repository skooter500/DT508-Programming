void setup()
{
  size(500, 500);  
}

int numBalloons = 5;
int lives = 5;
float[] balloonX = new float[numBalloons];
float[] balloonY = new float[numBalloons];
float[] balloonWidth = new float[numBalloons];
color[] balloonColour = new color[numBalloons];
float[] balloonSpeed = new float[numBalloons];

int gameState = 0;

int score = 0;

void splash()
{
  background(0);
  text("Balloon Game", 100, 100);
  text("Press SPACE to Begin", 100, 200);  
  if (keyPressed)
  {
    if (key == ' ')
    {
      resetScene();
      gameState = 1;
    }
  }
}

void resetScene()
{
  for (int i = 0 ; i < numBalloons ; i ++)
  {
    resetBalloon(i);
  }
  lives = 5;
  score = 0;
}

void resetBalloon(int b)
{
  balloonX[b] = random(0, width);
  balloonWidth[b] = random(50, 100);
  balloonColour[b] = color(random(0, 255), random(0, 255), random(0, 255));
  balloonSpeed[b] = random(1, 4);
  balloonY[b] = height + (balloonWidth[b] / 2);  
}

void gameOver()
{
  background(0);
  text("Game Over", 100, 100);
  text("Press SPACE to Begin", 100, 200);    
  if (keyPressed)
  {
    if (key == ' ')
    {
      resetScene();
      gameState = 1;
    }
  }
}

void game()
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
        resetBalloon(i);
        lives --;
      }
  }
  
  if (lives == 0)
  {
    gameState = 2;
  }
  
  fill(255);
  text("Score: " + score, 20, 20); 
  text("Lives: " + lives, 20, 40); 
}

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
      resetBalloon(i);
    }
  }  
}

void draw()
{
  if (gameState == 0)
  {
    splash();
  }
  else if (gameState == 1)
  {
    game();
  }
  else if (gameState == 2)
  {
    gameOver();
  }
  
}
