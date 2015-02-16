import ddf.minim.*;
import de.ilu.movingletters.*;

float[] playerX = new float[2];
float[] playerY = new float[2];
int[] score = new int[2];
AudioPlayer[] sounds = new AudioPlayer[4];
float playerHeight;
float playerWidth;
float playerSpeed = 10;
float ballSize;
float ballX, ballY;
float ballSpeedX, ballSpeedY;

int gameState = 0;
boolean singlePlayer = false;
boolean paused = true;
int CENTRED = -1;

int maxScore = 10;
float ballMax = 10;
boolean[] keys = new boolean[526];

Minim minim;

void reset()
{
  playerX[0] = 50;
  playerX[1] = width - (50 + playerWidth);
  
  playerY[0] = (height / 2) - (playerHeight / 2);
  playerY[1] = (height / 2) - (playerHeight / 2);
  
  ballX = (width / 2) - (ballSize / 2);
  ballY = (height / 2) - (ballSize / 2);
  
  ballSpeedX = random(3, 5);
  if (random(0, 1) < 0.5f)
  {
    ballSpeedX = - ballSpeedX;
  }
  ballSpeedY = random(-5, 5);
  paused = true;
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
  rect(ballX, ballY, ballSize, ballSize);
}

void setup()
{
  noCursor();
  minim = new Minim(this);
  size(displayWidth, displayHeight);
  
  for (font_size size:font_size.values())
  {
    letters[size.index] = new MovingLetters(this, size.size, 1, 0);
  }
  
  playerHeight = 100;
  playerWidth = 20;
  ballSize = 20;  
  sounds[0] = minim.loadFile("blip0.wav");
  sounds[1] = minim.loadFile("blip1.wav");
  sounds[2] = minim.loadFile("blip2.wav");
  sounds[3] = minim.loadFile("blip3.wav");
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
  if (checkKey('Q'))
  {
    if (playerY[0] > 0)
    {
      playerY[0] -= playerSpeed;
    }    
  }
  if (checkKey('A'))
  {
    if (playerY[0] + playerHeight < height)
    {
      playerY[0] += playerSpeed;
    }    
  }
  
  if (! singlePlayer)
  {  
    if (checkKey('P'))
    {
      if (playerY[1] > 0)
      {
        playerY[1] -= playerSpeed;
      }    
    }
    if (checkKey('L'))
    {
      if (playerY[1] + playerHeight < height)
      {
        playerY[1] += playerSpeed;
      }    
    }
  }
  else
  {
    float halfPlayer = playerHeight / 2;
    float ballCent = ballY + ballSize / 2;
    float playerCent = playerY[1] + halfPlayer;
    
    playerY[1] += (ballCent - playerCent) * 0.5f;
  }  
}

boolean sketchFullScreen() {
  return true;
}


void updateBall()
{
  ballX += ballSpeedX;
  ballY += ballSpeedY;
  if (ballY < 0)
  {
    ballY = 0;
    ballSpeedY = - ballSpeedY;    
    sounds[2].rewind();
    sounds[2].play();   
  } 
  
  if (ballY + ballSize > height)
  {
    ballSpeedY = - ballSpeedY;
    ballY = height - ballSize; 
    sounds[2].rewind();
    sounds[2].play();   
  } 

  float maxY = 10;  
  // Check for left player hit
  if ((ballX < playerX[0] + playerWidth) && (ballY + ballSize > playerY[0]) && (ballY < playerY[0] + playerHeight))
  {
    ballX = playerX[0] + playerWidth;
    ballSpeedX = - ballSpeedX;
    ballSpeedX += 1f;    
    if (ballSpeedX > ballMax)
    {
      ballSpeedX = ballMax;
    }
    
    float halfPlayer = playerHeight / 2; // Half the height of the player
    float ballCent = ballY + ballSize / 2; // The middle of the ball on the Y axis
    float playerCent = playerY[0] + halfPlayer; // The middle of the player
    float ballOffset = ballCent - playerCent; // The difference between the middle of the ball and the middle of the player
    ballSpeedY = (ballOffset / halfPlayer) * maxY; // What proportion of the bat Y is the ball Y and scale it by the maxY   
    sounds[0].rewind();
    sounds[0].play();    
  }
  
  // Check for player right hit
  if ((ballX + ballSize > playerX[1]) && (ballY + ballSize > playerY[1]) && (ballY < playerY[1] + playerHeight))
  {
    ballX = playerX[1] - ballSize;
    ballSpeedX = - ballSpeedX;
    ballSpeedX -= 1f;
    if (ballSpeedX < - ballMax)
    {
      ballSpeedX = - ballMax;
    }
    
    float halfPlayer = playerHeight / 2;
    
    float ballCent = ballY + ballSize / 2;
    float playerCent = playerY[1] + halfPlayer;
    float ballOffset = ballCent - playerCent;
    ballSpeedY = (ballOffset / halfPlayer) * maxY;
    sounds[1].rewind();
    sounds[1].play();    
  }  
  
  // Check for scores
  if (ballX < 0)
  {
     reset();
     score[1] ++;
     sounds[3].rewind();
     sounds[3].play();    
  }  
  
  if (ballX + ballSize > width)
  {
     reset();
     score[0] ++;
     sounds[3].rewind();
     sounds[3].play();    
  }  
}

void game()
{
  updatePlayers();
  if (! paused)
  {
    updateBall();
  }
  else
  {
    if (checkKey('S'))
    {
      paused = ! paused;
      sounds[2].rewind();
      sounds[2].play();   
    }
  }
  drawPlayers();
  drawBall();
  printText("Player 1: " + score[0] + " Player 2: " + score[1], font_size.small, 10, 10);
  line(width / 2, 100, width / 2, height - 100);
  if (score[0] == maxScore || score[1] == maxScore)
  {
    gameState = 0;
  }
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
  printText("Programmed by Bryan Duggan", font_size.medium, CENTRED, 200);
  printText("Player 1 use Q and A keys", font_size.medium, CENTRED, 250);
  printText("Player 2 use P and L keys", font_size.medium, CENTRED, 300);
  printText("Press S to serve", font_size.medium, CENTRED, 350);
  
  stroke(0, 255, 255);
  if (frameCount / 60 % 2 == 0)
  {
    if (score[0] == maxScore)
    {
      printText("Player 1 Wins!", font_size.medium, CENTRED, 450);  
    }
    if (score[1] == maxScore)
    {
      printText("Player 2 Wins!", font_size.medium, CENTRED, 450);  
    }
  }
  stroke(255);
  printText("Press SPACE to play", font_size.large, CENTRED, height - 100);  
  if (checkKey(' '))
  {
    reset();
    gameState = 1;
    score[0] = 0;
    score[1] = 0;
    sounds[3].rewind();
     sounds[3].play();    
  }
}

boolean checkKey(int k)
{
  return keys[k];
}

void mousePressed()
{
}

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

