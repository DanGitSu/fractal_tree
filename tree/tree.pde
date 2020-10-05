import controlP5.*;

PImage startscreen;
PFont title;
int stage;
int n = 150;
ControlP5 cp5;

// adjustable variables
int branchColor, trunkThickness, numOfBranches, branchSize, treeType;

void setup() {
  //size(1080, 720);
  stage = 1;
  size(1920, 1080);
  startscreen = loadImage("start.jpg");
  title = loadFont("font.vlw");
  textFont(title,13);
  
  cp5 = new ControlP5(this);
}

void draw() {
  if (stage == 1 )  {  // start screen
    image(startscreen,0,0,1920,1080);
    textAlign(CENTER);
    text("WELCOME TO THE TREE GENERATOR", 150, 150);
    text("Press enter to get started", 150, 170);
    text("Press backspace to go back screens",150,190);
  }
  if (stage == 2 )  { // adjustment screen
    background(0);
    fill(255);
    text("Enter the Color of the Tree", 300, n); // Branch Color
    branchColor = 255;
    DropdownList colorList = cp5.addDropdownList("DEFAULT: White").setPosition(500, n);
    String[] fields = {"red","green","blue"};
    setBox(fields, colorList);
    
    text("Enter the Thickness of the Trunk", 300, n+100); // Trunk Start Thickness
    trunkThickness = 10;
    
    text("Enter the Maximum number of Branches", 300, n+200 ); // Max number of Branches
    numOfBranches = 10;
    
    text("Enter the Length of the Branches", 300, n+300); // Branch Size
    branchSize = 300;
    
    text("Enter the Tree Type", 300, n+400); // Tree Type 2 / 3
    treeType = 2;
    
  }
  if (stage == 3)  {  // tree
    background(0);
    new Branch(width/2, height, map(mouseX, 0, width, 0, PI/2), branchSize, 0, numOfBranches, treeType, branchColor, trunkThickness);
  }
}

void setBox(String[] fields, DropdownList colorList){
    int i = 0;
    for (String n: fields){
      i++;
      colorList.addItem(i+". "+n, i);
    }
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    println(theEvent.getGroup() + " => " + theEvent.getGroup().getValue());
  }
}

void keyPressed(){
  if (key == ENTER||key==RETURN){
    stage++;
  }else if (key == BACKSPACE){
    stage--;
  }
}
