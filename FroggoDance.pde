// froggo class
Froggo frog;

void setup() {
  size(420, 750);

  frog = new Froggo();

  rectMode(CENTER);
}

void draw() {
  background(69); // nice
  frog.render();
}

class Froggo {
  int color_LINE = color(0); // for outlines + face + hands
  int color_GREEN = color(#a6c483); // for body
  int color_RED = color(#db5b54); // for heart

  PVector pos;
  float radius;

  float bodySW;
  float bodyTop, bodyRight, bodyBottom, bodyLeft;

  Froggo() {
    this.color_LINE = color(0); // for outlines + face + hands
    this.color_GREEN = color(#a6c483); // for body
    this.color_RED = color(#db5b54); // for heart

    this.pos = new PVector(width * 0.5, height * 0.5);
    this.radius = width * 0.3; // bounding box is a square but whatever

    this.bodyTop = this.radius * -0.75; // box model margin top
    this.bodyBottom = this.radius * 0.70; // box model margin bottom
    this.bodyRight = this.radius * 0.65; // box model margin right
    this.bodyLeft = -this.bodyRight; // box model margin left

    this.bodySW = this.bodyRight * 0.5;
  }

  void render() {
    // position and rotate
    translate(this.pos.x, this.pos.y);
    // rotate(this.angle);

    // whiteBG for testing
    noStroke();
    fill(255);
    rectMode(RADIUS);
    rect(0, 0, this.radius, this.radius);

    // render body
    noStroke();
    fill(this.color_GREEN);

    // eyes
    ellipseMode(CORNERS);
    // left eye
    ellipse(
      this.bodyRight * 0.2, -this.radius,
      this.bodyLeft, (-this.radius - this.bodyTop) * 0.5
      );
    // right eye
    ellipse(
      this.bodyLeft * 0.2, -this.radius,
      this.bodyRight, (-this.radius - this.bodyTop) * 0.5
      );

    // cheeks & between legs
    ellipseMode(CENTER);
    // left cheek
    ellipse(
      this.bodyLeft, this.bodyTop * 0.5,
      (-this.radius - this.bodyLeft) * 2, this.bodyTop
      );
    // right cheek
    ellipse(
      this.bodyRight, this.bodyTop * 0.5,
      (this.radius - this.bodyRight) * 2, this.bodyTop
      );

    // between legs
    float btwnLegs = this.bodyBottom * 0.25;

    ellipse(
      0, this.bodyBottom,
      this.bodyRight * 2, btwnLegs
      );


    // bezier
    // anchor, control, anchor
    noFill();
    strokeWeight(this.bodySW);
    stroke(this.color_GREEN);
    stroke(255, 0, 0);
    // anchor, control, control, anchor
    bezier(
      this.bodyLeft, 0,
      this.bodyLeft, 0,
      this.bodyLeft, 0,
      this.bodyLeft, this.bodyBottom - (this.bodySW * 0.5)
      );


    // debug dots
    //ellipseMode(CENTER);
    //noStroke();
    //fill(255, 0, 0);
    //circle(this.bodyLeft, this.bodyTop, this.radius*0.1);
    //circle(this.bodyRight, this.bodyTop, this.radius*0.1);
    //circle(this.bodyLeft, this.bodyBottom, this.radius*0.1);
    //circle(this.bodyRight, this.bodyBottom, this.radius*0.1);
  }
}
