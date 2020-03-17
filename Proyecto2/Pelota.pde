class Pelota{

  Body body;
  float r;

  color col;


  Pelota(float x, float y, float r_) {
    r = r_;
    makeBody(x, y, r);
    body.setUserData(this);
    col = color(0,0,255);
  }

  void killBody() {
    mundo.destroyBody(body);
  }

  void change() {
    col = color(0);
  }

  boolean done() {
    Vec2 pos = mundo.getBodyPixelCoord(body);
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }


  // 
  void display() {
    
    Vec2 pos = mundo.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(col);
    stroke(0);
    strokeWeight(1);
    ellipse(0, 0, r*2, r*2);
    popMatrix();
    x1= pos.x;
    y1= pos.y;
  }

  void makeBody(float x, float y, float r) {
    BodyDef bd = new BodyDef();
    bd.position = mundo.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = mundo.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = mundo.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 0.5;
    fd.friction = 0.01;
    fd.restitution = 0.3;

    body.createFixture(fd);

    body.setAngularVelocity(random(0, 0));
  }
}
