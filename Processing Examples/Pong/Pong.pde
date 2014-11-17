import de.ilu.movingletters.*;

MovingLetters letters;

float[] playerX = new float[2];
float[] playerY = new float[2];
int[] score = new int[2];
float playerHeight;
float playerWidth;
float ballWidth;
float ballX, ballY;
float ballSpeedX, ballSpeedY;

int gameState = 0;

void drawPlayers()
{
  for(int i = 0 ; i < playerX.length ; i ++)
  {
    rect(playerX[i], playerY[i], playerWidth, playerHeight);
  }
}

void drawBall()
{
  rect(ballX, ballY, ballWidth, ballWidth);
}

void setup()
{
  size(500, 500);
  letters = new MovingLetters(this, 20, 1, 0); 
  
  playerHeight = 100;
  playerWidth = 20;
  ballWidth = 20;
  playerX[0] = 50;
  playerX[1] = width - (50 + playerWidth);
  
  playerY[0] = (height / 2) - (ballWidth / 2);
  playerY[1] = (height / 2) - (ballWidth / 2);
  
  ballX = (width / 2) - (ballWidth / 2);
  ballY = (height / 2) - (ballWidth / 2);
  
  ballSpeedX = random(-10, 10);
  ballSpeedY = random(-10, 10);
}

void draw()
{
  background(0);
  stroke(255);
  if (gameState == 0)
  {
    splash();
  }
  if (gameState == 1)
  {
    game();
  }
}

void game()
{
  drawPlayers();
  drawBall();
}

void splash()
{
  letters.text("Pong", 100, 100);
  if (frameCount / 30 % 2 == 0)
  {  
    letters.text("Pres SPACE to play", 100, 200);
  }
  if (keyPressed && key == ' ')
  {
    gameState = 1;
  }
}
