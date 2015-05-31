/*
 * Bonus randomly generated level
 */
void start_Bonus()
{
  gameState = BONUS;
  ball = new Ball(15, 100, 20);
  randomSurface = new RandomSurface();
}

void draw_Bonus()
{
  boxw.step();
  scrollOffset = map(ball.xX, 150, width, 0, 650);
  scrollOffset = constrain(scrollOffset, 3, 2398);

  // Slow background colour transition using sin
  a1 += random(0.1);
  a2 += random(0.1);
  a3 += random(0.1);
  tint(155+100*sin(a1), 155+100*sin(a2), 155+100*sin(a3));

  imageMode(CORNER);
  image(gamebg2, -scrollOffset/6, 0);

  // moving the scene
  pushMatrix();
  ball.update();
  translate(-scrollOffset, 0);
  ball.display();
  randomSurface.display();
  popMatrix();

  textFont(font, 20);
  fill(255);
  textAlign(CENTER);
  if ( ball.levelEnd() )
  {
    text("Press 'R' to restart the game", width/2, 45);
    text("Press 'Esc' to exit", width/2, height - 20);
  } else
    if ( ball.offScreen() )
  {
    text("Press 'R' to restart level", width/2, 45 );
  }
}


void keyPressed_Bonus()
{
  if ( key == 'r' && ball.levelEnd() )
  {
    playDialog3.shiftGain(3, -10, 1000);
    playDialog3.pause();
    restart();
    ball.kill();
    randomSurface.kill();
  } else
    if ( key == 'r' && ball.offScreen() )
  {
    ball.kill();
    randomSurface.kill();
    start_Bonus();
  }
}

