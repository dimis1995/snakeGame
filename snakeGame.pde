int grid = 32;

ArrayList blocks = new ArrayList<Block>();
Snake snake;
Food food;

void setup() {
  frameRate(10);
  size(1024, 1024);
  for (int i = 0; i < 32; i++) {
    for (int j = 0; j < 32; j++) {
      blocks.add(new Block(i*grid, j*grid));
    }
  }
  snake = new Snake(grid * 8, grid * 8);
  food = new Food(((int)(Math.random() * 32)*grid),((int)(Math.random() * 32))*grid);
}

void draw() {
  background(0);
  blocks.forEach((block) -> {
    ((Block)block).draw();
  });
  ArrayList takenPositions = new ArrayList<PVector>();
  for (int i = 0; i < snake.snakeLength; i++){
    takenPositions.add(snake.tail[i]);
    if (snake.pos.x == snake.tail[i].x && snake.pos.y == snake.tail[i].y) {
      System.out.println("You're dead");
      snake = new Snake(grid * 8, grid * 8);
    }
  }
  if (snake.pos.x == food.pos.x && snake.pos.y == food.pos.y) {
    takenPositions.add(snake.pos);
    PVector randomPosition = new PVector((int)(Math.random() * 32)*grid, (int)(Math.random() * 32)*grid);
    while (takenPositions.contains(randomPosition)){
      randomPosition.x = (int)(Math.random() * 32)*grid;
      randomPosition.y = (int)(Math.random() * 32)*grid;
    }
    food = new Food(((int)(Math.random() * 32)*grid),((int)(Math.random() * 32))*grid);
    snake.snakeLength += 1;
    snake.tail[snake.snakeLength] = new PVector(snake.pos.x, snake.pos.y);
  }
  snake.update();
  snake.draw();
  food.draw();
  
}

void keyPressed() {
  if (keyCode == UP) {
    snake.direction.x = 0;
    if (snake.direction.y != grid) snake.direction.y = -grid;
  } else if (keyCode == DOWN) {
    snake.direction.x = 0;
    if (snake.direction.y != -grid) snake.direction.y = grid;
  } else if (keyCode == LEFT) {
    if (snake.direction.x != grid) snake.direction.x = -grid;
    snake.direction.y = 0;
  } else if (keyCode == RIGHT) {
    if (snake.direction.x != -grid) snake.direction.x = grid;
    snake.direction.y = 0;
  }
}
