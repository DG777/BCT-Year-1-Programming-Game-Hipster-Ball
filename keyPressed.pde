/*
 * Sets controls for the game (Arrow keys and/or WASD);
 * Sets local (inside GAME STATES) keyPressed functions
 */
void keyPressed() 
{
  switch ( keyCode ) 
  {
    case RIGHT: right = true; break;
    case LEFT: left = true; break;
    case UP: up = true;  break;
  }
  
  switch ( key )
  {
    case 'd': right = true; break;
    case 'a': left = true; break;
    case 'w': up = true;  break;
  }
  
  switch ( gameState )
  {
    case INTRO : keyPressed_Intro(); currentMillis = millis(); break;
    case DIALOG_1 :  keyPressed_Dialog_1(); break;
    case LEVEL_1 : keyPressed_Level_1(); currentMillis = millis(); break;
    case DIALOG_2 :  keyPressed_Dialog_2(); break;
    case LEVEL_2 : keyPressed_Level_2(); currentMillis = millis(); break;
    case DIALOG_3 : keyPressed_Dialog_3(); break;
    case BONUS : keyPressed_Bonus(); break;
    case END : keyPressed_End(); break;
  }
}


void keyReleased() 
{
  switch ( keyCode ) 
  {
    case RIGHT: right = false; break;
    case LEFT: left = false; break;
    case UP: up = false;  break;
  }
  
  switch ( key )
  {
    case 'd': right = false; break;
    case 'a': left = false; break;
    case 'w': up = false;  break;
  }
}
