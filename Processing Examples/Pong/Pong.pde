import de.ilu.movingletters.*;

float[] playerX = new float[2];
float[] playerY = new float[2];
int[] score = new int[2];
float playerHeight;
float playerWidth;
float ballWidth;
float ballX, ballY;
float ballSpeedX, ballSpeedY;

int gameState = 0;
int CENTRED = -1;

void reset()
{
  playerX[0] = 50;
  playerX[1] = width - (50 + playerWidth);
  
  playerY[0] = (height / 2) - (playerHeight / 2);
  playerY[1] = (height / 2) - (playerHeight / 2);
  
  ballX = (width / 2) - (ballWidth / 2);
  ballY = (height / 2) - (ballWidth / 2);
  
  ballSpeedX = random(-10, 10);
  ballSpeedY = random(-10, 10);
}

void drawPlayers()
{
  for(int i = 0 ; i < playerX.length ; i ++)
  {
    rect(playerX[i], playerY[i], playerWidth, playerHeight);
  }
}

MovingLetters[] letters = new MovingLetters[3];

void drawBall()
{
  rect(ballX, ballY, ballWidth, ballWidth);
}

void setup()
{
  size(800, 600);
  
  for (font_size size:font_size.values())
  {
    letters[size.index] = new MovingLetters(this, size.size, 1, 0);
  }
  
  playerHeight = 100;
  playerWidth = 20;
  ballWidth = 20;  
  
  reset();
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

void updatePlayers()
{
}

void updateBall()
{
}

void game()
{
  drawPlayers();
  drawBall();
}

void printText(String text, font_size size, int x, int y)
{
  if (x == CENTRED)
  {
    x = (width / 2) - (int) (size.size * (float) text.length() / 2.5f);
  }
  letters[size.index].text(text, x, y);  
}

void splash()
{
  background(0);
  stroke(255);
  
  printText("Pong", font_size.large, CENTRED, 100);  
  printText("Programmed by Bryan Duggan", font_size.small, CENTRED, 200);
  if (frameCount / 60 % 2 == 0)
  {
    printText("Press SPACE to play", font_size.large, CENTRED, height - 100);  
  }
  if (keyPressed && key == ' ')
  {
    reset();
    gameState = 1;
  }
}
