void startLevel_1()
{
  gameState = LEVEL_1;
  ball = new Ball(15, 30, 276);
  JSONArray level = loadJSONArray("Platform Coord/map1.txt"); // load platform coordinates from a file
  chains = new Chains(level);
}

void draw_Level_1()
{
  boxw.step();

  // Defining and limiting scrollOffset
  scrollOffset = map(ball.xX, 150, width, 0, 650);
  scrollOffset = constrain(scrollOffset, 3, 2398);


  stroke(0);
  imageMode(CORNER);
  image(gamebg1, -scrollOffset/6, 0);

  // move the scene
  pushMatrix();
  translate(-scrollOffset, 0);
  ball.update();
  image(level1, 0, 0);
  addBox();
  ball.display();
  image(building1, 1600, 223);
  chains.display();
  popMatrix();

  textAlign(CENTER);
  fill(0);
  if ( ball.offScreen() )
  {
    textFont(font, 45);
    text("EPIC FAIL", width/2, height/2);
    if (  millis() > 2000 + currentMillis )
    {
      ball.kill();
      chains.kill();
      startLevel_1();
    }
  }

  if ( ball.levelEnd())
  {
    textFont(font, 20);
    text("Press 'Space' to buy a burger!", width/2, 45);
  }
}

void keyPressed_Level_1()
{
  if ( key == ' ')
  {
    playDialog1.pause(); 
    playDialog1.rewind();
    ball.kill();
    chains.kill();
    boxw.destroyBody(box);
    startDialog_2();
  }
}

// Defines hanging red box in the beginning of a first level
void addBox()
{
  BodyDef bd = new BodyDef();
  bd.type = BodyType.STATIC;
  bd.position.set(boxw.coordPixelsToWorld(347, 380));
  box = boxw.createBody(bd);

  PolygonShape ps = new PolygonShape();
  float dw = boxw.scalarPixelsToWorld(20);
  float dh = boxw.scalarPixelsToWorld(20);
  ps.setAsBox(dw, dh);
  box.createFixture(ps, 1);
}

