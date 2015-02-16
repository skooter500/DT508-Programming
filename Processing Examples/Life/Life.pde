boolean[][] board;
boolean[][] temp;

int rows;
int cols;
int cellSize = 2;

void setup()
{
   size(500, 500);
   rows = height / cellSize;
   cols = width / cellSize;
  
   board = new boolean[rows][cols];
   temp = new boolean[rows][cols];
   randomBoard(); 
}

void randomBoard()
{
  for (int row = 0 ; row < rows ; row ++)
  {
    for (int col = 0 ; col < cols ; col ++)
    {
      if (random(0, 1) < 0.2f)
      {
        board[row][col] = true;
      }
    }
  }
}

int countLiveCellsAround(int row, int col)
{
  int count = 0;
  
  // Top left
  if (row > 0 && col > 0 && board[row - 1][col - 1])
  {
    ++ count;
  }
  // Top
  if (row > 0 && board[row -1][col])
  {
    ++ count;
  }
  // Top right
  if (row > 0 && col < (cols - 1) && board[row - 1][col + 1])
  {
     ++ count;
  }
  // Left
  if (col > 0 && board[col - 1][row])
  {
    ++ count;
  }
  // Right
  if (col < cols -1 && board[row][col + 1])
  {
    ++ count;
  }
  
  // Bottom left
  if (col > 0 && row < rows -1 && board[row + 1][col - 1])
  {
    ++ count;
  }
  // Bottom
  if (row < rows -1 && board[row + 1][col])
  {
    ++ count;
  }
  // Bottom right
  if (row < rows -1 && col < cols - 1 && board[row + 1][col + 1])
  {
    ++ count;
  }  
  return count;
}

void update()
{
  for (int row = 0 ; row < rows ; row ++)
  {
    for (int col = 0 ; col < cols ; col ++)
    {
      temp[row][col] = false;
      int count = countLiveCellsAround(row, col);
      if (board[row][col])
      {
         if (count < 2)
         {
            temp[row][col] = false;
         }
         if (count == 2 || count == 3)
         {
           temp[row][col] = true;
         }
         if (count > 3)
         {
           temp[row][col] = false;
         }
      }
      else
      {
        if (count == 3)
        {
          temp[row][col] = true;
        }
      }
    }
  }  
  boolean[][] c;
  c = board;
  board = temp;
  temp = c; 
}

void drawBoard()
{
  fill(255);
  stroke(255);
  
  for (int row = 0 ; row < rows ; row ++)
  {
    for (int col = 0 ; col < cols ; col ++)
    {
      if (board[row][col])
      {
        float x = col * cellSize;
        float y = row * cellSize;
        
        rect(x, y, cellSize, cellSize);
      }
    }
  }
}

void draw()
{
  background(0);
  drawBoard();
  update();
}
