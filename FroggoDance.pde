PImage[] froggo;

void setup() {
  //size(420, 750);
  fullScreen(); // p2 fixes flicker and copy issues, something to do with pngs bitmap

  frameRate(4);

  froggo = new PImage[10];

  for (int index = 0; index < 10; ++index)
    froggo[index] = loadImage("froggo_0" + index + ".png");

  imageMode(CENTER);
  ellipseMode(CENTER);
  rectMode(CENTER);
  noSmooth();
}

void draw() {
  noStroke();
  background(69); // nice

  fill(42);
  rect(width/2, (int)(height * .85), width, (int)(height * .3));

  fill(255, 100);
  triangle(
    width/2, height/5,
    width/2 + width/4, height*2/3 + width/4,
    width/2 - width/4, height*2/3 + width/4
    );
  arc(
    width/2, height*2/3 + width/4,
    width/2, height/10,
    0, PI
    );
  ellipse(
    width/2, height*2/3 + width/4,
    width/2, height/10
    );

  int randomIndex = (int)random(0, froggo.length);
  image(froggo[randomIndex], width/2, height*2/3, width/2, width/2);
}
