void start_End()
{
  gameState = END;
}

// Draws end screen
void draw_End()
{
  background(0);
  textAlign(CENTER);
  fill(#DEDEDE);

  textFont(font, 30);
  text("Thanks for playin'", width/2, height/2);

  textFont(font, 20);
  text("Press 'E' to visit my blog", width/2, height/6*4);
  if ( key == 'e')
  {
    fill(0);
    rectMode(CENTER);
    rect(width/2, height/6*4, 500, 50);
    fill(#DEDEDE);
    text("Press 'E' to visit my blog AGAIN!", width/2, height/6*4);
  }

  // Slow color transition using sin
  a1 += random(0.1);
  a2 += random(0.1);
  a3 += random(0.1);
  fill(155+100*sin(a1), 155+100*sin(a2), 155+100*sin(a3));
  text("To play a bonus level press 'B'", width/2, height/6*5);
}

void keyPressed_End()
{
  if ( key == 'b' )
  {
    start_Bonus();
  }

  if ( key == 'e')
  {
    link("http://matveycolab.tumblr.com/");
  }

  if ( key == 'r' )
  {
    playDialog3.shiftGain(3, -10, 1000);
    playDialog3.pause();
    restart();
  }
}

