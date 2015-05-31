// Restarts the game
void restart()
{
  gameState = INTRO;
  playIntro.rewind();
  playIntro.play();
  playIntro.loop();
}

// Draws intro screen
void draw_Intro()
{
  fill(0);
  textAlign(CENTER);
  textFont(font, 20);
  imageMode(CORNER);

  image(intro, 0, 0);
  text("Hipster Ball: Da Journey", width/2, height/2-60);
  text("Press 'Space' to start", width/2, height/2-10);
}

void keyPressed_Intro()
{
  if ( key == ' ' )
  {
    startDialog_1();
    playIntro.pause();
  }
}

