// Import Minim (Sound library)
import ddf.minim.effects.*;
import ddf.minim.analysis.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.*;
import ddf.minim.ugens.*;

// Importing PBox2D and JBox2D
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.dynamics.Body;



// Declaring objects
Box2DProcessing boxw;
Ball ball;
Body box;
RandomSurface randomSurface;
Chains chains;

// Declaring audio tracks and a sample
Minim minim;
AudioPlayer playIntro, playDialog1, playDialog2, playDialog3;
AudioSample jumpSound;

// Loading dialogs
String[] dialog;

// Initialise key_Pressed states
boolean right = false, left = false, up = false;

// Dialog Images
PImage radioRinging, radioDialog1, ballDialog1, 
burgerGuy, ballBurger, burgerGuyTrue, 
radioLast, ballLast;
// Game Sprites
PImage ballTexture;
PImage building1, gamebg1, level1, 
gamebg2, level2, objects2;
PImage intro;

// Loading font
PFont font;

// Various game variables
float currentMillis;
float scrollOffset;
float a1, a2, a3; // variables for smooth colour transition

/*
 * GAME STATES
 */
final int INTRO = 0;
final int DIALOG_1 = 1;
final int LEVEL_1 = 2;
final int DIALOG_2 = 3;
final int LEVEL_2 = 4;
final int DIALOG_3 = 5;
final int BONUS = 6;
final int END = 7;

int gameState;

void setup()
{
  size(800, 450);
  smooth();

  // Setup Dialog
  dialog = loadStrings("Dialogs/Script.txt");

  // Setup Sounds
  minim = new Minim(this);
  playIntro = minim.loadFile("Sounds/Guided Meditation.mp3");
  playDialog1 = minim.loadFile("Sounds/Rust.mp3");
  playDialog2 = minim.loadFile("Sounds/Deep Cover.mp3");
  playDialog3 = minim.loadFile("Sounds/A Real Hero (Instrumental Cover).mp3");
  jumpSound = minim.loadSample("Sounds/jump.wav");


  /*
   * Load Images
   */
  //  load background, start screen, gameover, end
  ballTexture = loadImage("ball.png");
  intro = loadImage("intro.png");
  gamebg1 = loadImage("Level1Sprites/gamebg1.png");
  level1 = loadImage("Level1Sprites/level1.png");
  building1 = loadImage("Level1Sprites/building1.png");

  gamebg2 = requestImage("Level2Sprites/gamebg2.png");
  level2 = requestImage("Level2Sprites/level2.png");
  objects2 = requestImage("Level2Sprites/objects.png");

  // Dialog 1
  ballDialog1 = requestImage("Dialogs/ballDialog1.jpg"); 
  radioDialog1 = requestImage("Dialogs/radioDialog1.jpg");
  radioRinging = requestImage("Dialogs/radioRinging.jpg");

  // Dialog 2
  ballBurger = requestImage("Dialogs/ballBurger.jpg");
  burgerGuy = requestImage("Dialogs/burgerGuy.jpg");
  burgerGuyTrue = requestImage("Dialogs/burgerGuyTrue.jpg");

  // Dialog 3
  ballLast = requestImage("Dialogs/ballLast.jpg");
  radioLast = requestImage("Dialogs/radioLast.jpg");

  // Load a font, set size;
  font = loadFont("Fipps_Regular_45.vlw");
  textFont(font, 20);

  // Initialising JBox2D World
  boxw = new Box2DProcessing(this);
  boxw.createWorld();
  boxw.setGravity(0, -150);
  boxw.listenForCollisions();

  scrollOffset = 0; // Scrolling offset
  restart(); // restart game function
}

void draw()
{
  switch ( gameState )
  {
  case INTRO : draw_Intro(); break;
  case DIALOG_1 : draw_Dialog_1(); break;
  case LEVEL_1 : draw_Level_1(); break;
  case DIALOG_2 : draw_Dialog_2(); break;
  case LEVEL_2 : draw_Level_2(); break;
  case DIALOG_3 : draw_Dialog_3(); break;
  case BONUS : draw_Bonus(); break;
  case END : draw_End(); break;
  }
}

/*
 * Box2D Listener, checks if an object is on ground
 */
void beginContact(Contact c)
{
  Object oA = c.getFixtureA().getBody().getUserData();
  Object oB = c.getFixtureB().getBody().getUserData();
  if ( ball.equals(oA) || ball.equals(oB) )
  {
    ball.setOnGround(true);
  }
}

void endContact(Contact c)
{
  Object oA = c.getFixtureA().getBody().getUserData();
  Object oB = c.getFixtureB().getBody().getUserData();
  if ( ball.equals(oA) || ball.equals(oB) )
  {
    ball.setOnGround(false);
  }
}

/*
 * Stoping minim library and unloading the memory
 */
void stop()
{
  minim.stop();
  minim = null;
  super.stop();
}

