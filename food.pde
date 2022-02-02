class Food{
  
  PVector pos;
  
  public Food(int x, int y) {
    pos = new PVector(x,y);
  }
  
  public void draw() {
    fill(255, 0, 0);
    stroke(255);
    rect(this.pos.x, this.pos.y, grid, grid);
  }
}
