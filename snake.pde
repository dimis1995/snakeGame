import java.util.Collections;

class Snake {
  PVector pos;
  PVector direction;
  PVector[] tail = new PVector[grid*grid];
  int snakeLength;
  
  public Snake(int x, int y) {
    pos = new PVector(x,y);
    direction = new PVector(grid,0);
    snakeLength = 4;
    for (int i = 0; i < snakeLength; i++) {
      tail[i] = new PVector(x,y);
    }
  }
  
  public void update() {
    if (this.snakeLength != 0) this.tail[this.snakeLength-1] = new PVector(this.pos.x, this.pos.y);
    else this.tail[snakeLength] = new PVector(this.pos.x, this.pos.y);
    for(int i = 0; i < this.snakeLength - 1;i++){
      this.tail[i] = this.tail[i+1];
    }
    this.pos.x += this.direction.x;
    this.pos.y += this.direction.y;
    if (this.pos.x > width-grid) {
      this.pos.x = 0;
    } else if(this.pos.x < 0) {
      this.pos.x = width;
    } else if(this.pos.y > height-grid) {
      this.pos.y = 0;
    } else if(this.pos.y < 0) {
      this.pos.y = height;
    }
  }
  
  public void draw() {
    fill(0, 255, 0);
    stroke(255);
    for (int i = 0; i < this.snakeLength; i++) {
      rect(((PVector)this.tail[i]).x, ((PVector)this.tail[i]).y, grid, grid);
    }
    rect(this.pos.x, this.pos.y, grid, grid);
  }
  
}
