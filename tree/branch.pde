class Branch {
  
  float x, y, angle, len;
  int lvl, max, type, clr, thick;
  
  Branch(float x, float y, float angle, float len, int lvl, int max, int type, int clr, int thick) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.len = len;
    this.lvl = lvl;
    this.max = max;
    this.type = type;
    this.clr = clr;
    this.thick = thick;
    show();
  }
  
  void show() {
    pushMatrix();
    translate(x, y);
    
    strokeWeight(map(lvl, 0, max, thick, 1));
    stroke(clr);
    
    line(0, 0, 0, -len);
    
    if(lvl < max) {
      translate(0, -len);
      if (type == 3)  {
          new Branch(0, 0, angle, len * 2/3, lvl + 1, max, type, clr, thick);
      }
      rotate(angle);
      new Branch(0, 0, angle, len * 2/3, lvl + 1, max, type, clr, thick);
      rotate(-2 * angle);
      new Branch(0, 0, angle, len * 2/3, lvl + 1, max, type, clr, thick);
    }   
    popMatrix();
  }
  
}
