/*
 * Sets controls for the game (Arrow keys and/or WASD);
 * Sets local (inside GAME STATES) keyPressed functions
 */
void keyPressed() 
{
  switch ( keyCode ) 
  {
  case RIGHT: 
    right = true; 
    break;
  case LEFT: 
    left = true; 
    break;
  case UP: 
    up = true;  
    break;
  }

  switch ( key )
  {
  case 'd': 
    right = true; 
    break;
  case 'a': 
    left = true; 
    break;
  case 'w': 
    up = true;  
    break;
  }

  switch ( gameState )
  {
  case INTRO : 
    keyPressed_Intro(); 
    currentMillis = millis(); 
    break;
  case DIALOG_1 :  
    keyPressed_Dialog_1(); 
    break;
  case LEVEL_1 : 
    keyPressed_Level_1(); 
    currentMillis = millis(); 
    break;
  case DIALOG_2 :  
    keyPressed_Dialog_2(); 
    break;
  case LEVEL_2 : 
    keyPressed_Level_2(); 
    currentMillis = millis(); 
    break;
  case DIALOG_3 : 
    keyPressed_Dialog_3(); 
    break;
  case BONUS : 
    keyPressed_Bonus(); 
    break;
  case END : 
    keyPressed_End(); 
    break;
  }

  if ( keyCode == ESC )
  {
    key = 0;
    currentMillis = millis();
    escapeScreen = true;
  }
}


void keyReleased() 
{
  switch ( keyCode ) 
  {
  case RIGHT: 
    right = false; 
    break;
  case LEFT: 
    left = false; 
    break;
  case UP: 
    up = false;  
    break;
  }

  switch ( key )
  {
  case 'd': 
    right = false; 
    break;
  case 'a': 
    left = false; 
    break;
  case 'w': 
    up = false;  
    break;
  }
}

// Behaviour for when 'Esc' button is pressed
void escMode()
{
  if (escapeScreen)
  {
    rectMode(CORNER);
    fill(0, 150);
    rect(0, 0, width, height);
    rectMode(CENTER);
    fill(0, 230);
    stroke(0);
    strokeWeight(5);
    rect(width/2, height/2, 400, 200);
    fill(#DEDEDE);
    textSize(20);
    textAlign(CENTER);
    text("Do you want to exit?", width/2, height/2-50);
    textSize(30);
    text("Y/N", width/2, height/2+80);
    if ( key == 'y' )
    {
      background(0);
      text("ur LAME", width/2, height/2);
      if ( millis() > currentMillis + 1000)
      {
        stop();
        exit();
      }
    }

    if ( key == 'n' )
    {
      escapeScreen = false;
    }
  }
}

