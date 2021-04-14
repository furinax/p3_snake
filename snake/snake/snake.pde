Tail t;

void setup() {
  size(800,600);
  t = new Tail(new PVector(0, 0));
  noFill();
  stroke(255);
}

void draw() {
  background(0);
  t.update(new PVector(mouseX, mouseY));
  t.draw();
}
