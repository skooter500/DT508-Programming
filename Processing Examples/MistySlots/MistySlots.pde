import ddf.minim.*;
import de.ilu.movingletters.*;

int CENTRED = -1;
int numSlots = 3;
int numImages = 3;

int[] slots = new int[numSlots];
int[] spin = new int[numSlots];

int coins = 10;

MovingLetters[] letters = new MovingLetters[3];
PImage[] images = new PImage[numImages];

Minim minim;

AudioPlayer coinSound;
AudioPlayer mistySound;
AudioPlayer slotSound;
boolean lastPressed;

int gameMode = 0;
int toAdd;

boolean sketchFullScreen() {
  return true;
}

void spinSlots()
{
  int startAt = 5;
  for (int i = 0 ; i < spin.length ; i ++)
  {
    spin[i] = (int) random(startAt, startAt + 5);
    startAt = spin[i];    
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

void randomiseSlots()
{
  for (int i = 0 ; i < slots.length ; i ++)
  {
    slots[i] = (int) random(0, images.length);
  }
}

void playAudio(AudioPlayer player)
{
  player.rewind();
  player.play();
}

void setup()
{
  size(displayWidth, displayHeight);
  minim = new Minim(this);
  
  for (font_size size:font_size.values())
  {
    letters[size.index] = new MovingLetters(this, size.size, 1, 0);
  }
  
  images[0] = loadImage("misty.jpg");
  images[1] = loadImage("tara.jpg");
  images[2] = loadImage("cat.jpg");
  //images[3] = loadImage("sheep.jpg");
  
  coinSound = minim.loadFile("coin.wav");
  slotSound = minim.loadFile("slot.wav");
  mistySound = minim.loadFile("misty.wav"); 
  
  randomiseSlots();
  lastPressed = false;
}

void checkSlots()
{
  if (toAdd == 0)
  {
    boolean allSame = true;
    gameMode = 0;
    for (int i = 1 ; i < numSlots ; i ++)
    {
      if (slots[i] != slots[i -1])
      {
        allSame = false;
        break;
      }
    }
    if (allSame)
    {
      if (slots[0] == 0)
      {
        toAdd = 10;
        playAudio(mistySound);
      }
      else
      {
        toAdd = 5;
      }      
      gameMode = 3;
    }
  }
}

void draw()
{
  background(0);
  stroke(255);
  printText("MistySlots", font_size.large, CENTRED, 100);
  printText("Press i to insert coin", font_size.large, CENTRED, 200);
  printText("Press SPACE to spin", font_size.large, CENTRED, 300);
  
  int gap = width / (numSlots + 1);
  imageMode(CENTER);
  for (int i = 0 ; i < numSlots ; i ++)
  {
    int x = (i + 1) * gap;
    image(images[slots[i]], x, 500);
  }  
  
  printText("Coins: " + coins, font_size.large, 50, height - 100);
  
  if (gameMode == 0)
  {
    if (keyPressed)
    {
      if (! lastPressed)
      {
        if (key == 'i')
        {
          playAudio(coinSound);
          coins ++;
        }
        if (key == ' ' && coins > 0)
        {
          coins --;
          gameMode = 1;
          spinSlots();
        }      
        lastPressed = true;
      }
    }
    else
    {
      lastPressed = false;
    }
  }

  if (gameMode == 1)
  {
    if (frameCount % 20 == 0)
    {        
      gameMode = 2;
      for (int i = 0 ; i < numSlots ; i ++)
      {
        if (spin[i] > 0)
        {
          gameMode = 1;
          slots[i] = (int) random(0, images.length);
          spin[i] --;
        }
      }
      if (gameMode == 1)
      {
        playAudio(slotSound);      
      }
    }
  }
  
  if (gameMode == 2)
  {  
    checkSlots();   
  }
  if (gameMode == 3)
  {
    if (frameCount % 20 == 0)
    {
      if (toAdd == 0)
      {
        gameMode = 0;
      }
      else
      {
        toAdd --;
        coins ++;
        if (slots[0] == 0)
        {
          playAudio(mistySound);
        }
        else        
        {
          playAudio(coinSound);
        }        
      }
    }    
  }
}


