class Block {
  
  int x;
  int y;
  
  public Block(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public void draw () {
    stroke(255);
    fill(0);
    rect(this.x, this.y, grid, grid);
  }
}
