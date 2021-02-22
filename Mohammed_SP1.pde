
int size = 40;
int[][] grid = new int[25][25];

Player player;
Enemy enemy;
Food food;

void setup()
{
    size(1001, 1001);
    player = new Player(3, 4);
    enemy = new Enemy(20, 19, player);
    food = new Food(13, 5, player);
    //food = new Food(17, 3, player);
    //food = new Food(3, 5, player);
    //food = new Food(10, 1, player);

}

void draw()
{
    clearBoard();
    updateEntities();
    updateEnemies();
    updateFood();
    drawBoard();
    collissionDetection();
    isGameOver();
    
    
}

void clearBoard()
{
    for (int x = 0; x < grid.length; x++)
    {
        for (int y = 0; y < grid[0].length; y++)
        {
            grid[x][y] = 0;
        }
    }
}

void drawBoard()
{
    for (int x = 0; x < grid.length; x++)
    {
        for (int y = 0; y < grid[0].length; y++)
        {
            fill(getColorFromType(grid[x][y]));
            
            rect(x * size, y * size, size, size);
        }
    }
    
}

void updateEntities()
{
    grid[player.x][player.y] = player.type;
    
    player.takeDamage();   
}

void updateEnemies()
{
    grid[enemy.x][enemy.y] = enemy.type;
    enemy.MoveTowardsPlayer();
}

void updateFood()
{
  grid[food.x][food.y] = food.type;
    food.MoveAwayFromPlayer();
}


color getColorFromType(int type) 
{
    color c = color(255);
    
    switch(type)
    {
        case 0: 
            c = color(127);
            break;
        case 1: 
            c = color(255,0,0);
            break;
        case 2: 
            c = color(0, 255, 0);
            break;
        case 3: 
            c = color(0,0,255);
            break;
        case 4: 
            c = color (0,255,255);
            break;
            
    }    
    
    return c; 
}

void printIntArray(int[][] arr) 
{
    System.out.println("");
    System.out.println("");
    System.out.println("");
    for (int x = 0; x < arr.length; x++)
    {
        for (int y = 0; y < arr[0].length; y++) 
        {

            System.out.print(arr[x][y] + ", ");
            
        }
        println();
    }
}

void keyPressed()
{
    
    if(key == 'w')
    {
      player.y--;   
    }
    if(key == 'a')
    {
      player.x--;   
    }
    if(key == 's')
    {
      player.y++;   
    }
    if(key == 'd')
    {
      player.x++;   
    }
    player.x = constrain(player.x,0,24);
    player.y = constrain(player.y,0,24);
    println("points");
    println(player.health + "health");
    

}
