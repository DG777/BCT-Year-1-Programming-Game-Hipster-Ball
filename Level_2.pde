void startLevel_2()
{
  gameState = LEVEL_2;
  ball = new Ball(15, 20, 278);
  JSONArray level2 = loadJSONArray("Platform Coord/map2.txt");
  chains = new Chains(level2);
}

void draw_Level_2()
{
  boxw.step();
  scrollOffset = map(ball.xX, 150, width, 0, 650);
  scrollOffset = constrain(scrollOffset, 3, 2398);

  // fluctuating radius
  a1 +=0.1;
  ball.r = 14+sin(a1);

  imageMode(CORNER);
  image(gamebg2, -scrollOffset/6, 0);


  // moving the scene
  pushMatrix();
  translate(-scrollOffset, 0);
  ball.update2();
  image(level2, 0, 0);
  ball.display();
  image(objects2, 1600, 223);
  chains.display();
  popMatrix();

  textAlign(CENTER);
  fill(0);
  if ( ball.offScreen() )
  {
    textFont(font, 45);
    text("EPIC FAIL", width/2, height/2);
    if ( ( millis() > 2000 + currentMillis ))
    {
      ball.kill();
      chains.kill();
      startLevel_2();
    }
  }

  if ( ball.levelEnd() )
  {
    textFont(font, 20);
    text("Press 'Space' to talk", width/2, 45);
  }
}

void keyPressed_Level_2()
{
  if ( (key == ' ' && ball.levelEnd()) || (key == 's') )
  {
    playDialog2.pause();
    playDialog2.rewind();
    ball.kill();
    chains.kill();
    startDialog_3();
  }
}

