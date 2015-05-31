/**
 ** Displays 3 dialogs: loads corresponding images and text;
 ** Uses millis() to time dialogs
 **/

// Default image and text style for dialogs
void defaultDrawStyle()
{
  imageMode(CORNER);
  textAlign(LEFT);
  fill(#DEDEDE);
  textSize(20);
}

/*
 * DIALOG 1
 */

void startDialog_1()
{
  gameState = DIALOG_1;
  playDialog1.rewind();
  playDialog1.loop();
  playDialog1.play();
}

void draw_Dialog_1()
{
  defaultDrawStyle();

  image(radioRinging, 0, 0);

  if ( millis() > 3000 + currentMillis)
  {
    image(ballDialog1, 0, 0);
    text(dialog[0], 50, 390);
  }

  if ( millis() > 6000 + currentMillis)
  {
    image(radioDialog1, 0, 0);
    text(dialog[1], 50, 390);
    text(dialog[2], 50, 427);
  }

  if ( millis() > 9000 + currentMillis)
  {
    image(ballDialog1, 0, 0);
    text(dialog[3], 50, 390);
  }

  if ( millis() > 12000 + currentMillis)
  {
    image(radioDialog1, 0, 0);
    text(dialog[4], 50, 390);
    text(dialog[5], 50, 427);
  }

  if ( millis() > 15000 + currentMillis)
  {
    startLevel_1();
  }
}

void keyPressed_Dialog_1()
{
  if ( key == ' ' )
  {
    startLevel_1();
  }
}


/*
 * DIALOG 2
 */

void startDialog_2()
{
  gameState = DIALOG_2;
  playDialog2.rewind();
  playDialog2.loop();
  playDialog2.play();
}

void draw_Dialog_2()
{
  defaultDrawStyle();

  image(burgerGuy, 0, 0);
  text(dialog[7], 50, 390);

  if ( millis() > 3000 + currentMillis)
  {
    image(ballBurger, 0, 0);
    text(dialog[8], 50, 390);
    text(dialog[9], 50, 427);
  }

  if ( millis() > 6000 + currentMillis)
  {
    image(burgerGuyTrue, 0, 0);
    text(dialog[10], 50, 390);
  }

  if ( millis() > 9000 + currentMillis)
  {
    image(ballBurger, 0, 0);
    text(dialog[11], 50, 390);
  }

  if ( millis() > 12000 + currentMillis)
  {
    startLevel_2();
  }
}

void keyPressed_Dialog_2()
{
  if ( key == ' ' )
  {
    startLevel_2();
  }
}

/*
 * DIALOG 3
 */

void startDialog_3()
{
  gameState = DIALOG_3;
  playDialog3.rewind();
  playDialog3.loop();
  playDialog3.play();
}

void draw_Dialog_3()
{
  defaultDrawStyle();

  image(ballLast, 0, 0);
  text(dialog[13], 50, 390);
  text(dialog[14], 50, 427);


  if ( millis() > 3000 + currentMillis)
  {
    image(radioLast, 0, 0);
    text(dialog[15], 50, 390);
  }

  if ( millis() > 6000 + currentMillis)
  {
    image(ballLast, 0, 0);
    text(dialog[16], 50, 390);
  }

  if ( millis() > 9000 + currentMillis)
  {
    image(radioLast, 0, 0);
    text(dialog[17], 50, 390);
  }

  if ( millis() > 12000 + currentMillis)
  {
    start_End();
  }
}

void keyPressed_Dialog_3()
{
  if ( key == ' ' )
  {
    start_End();
  }
}

