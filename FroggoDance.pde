PImage froggo;

void setup() {
  size(420, 750);

  frameRate(5);


  froggo = loadImage("spritesheet_froggo.png");
  imageMode(CENTER);
  ellipseMode(CENTER);
  smooth(0);
}

void draw() {
  noStroke();
  background(69); // nice
  
  fill(42);
  rect(0, (int)(height*.65), width, height);

  fill(255, 100);
  triangle(
    (int)(width*.5), (int)(height*.2),
    (int)(width*.35), (int)(height*.675),
    (int)(width*.65), (int)(height*.675)
    );
  ellipse(
    (int)(width*.5), (int)(height*.7),
    (int)(width*.5), (int)(height*.1)
    );

  int fr = (int)random(0, 7);

  copy(froggo, fr * 64, 0, 64, 64, width/4, (int)(height*.45), width/2, width/2);
}
