/*
 * Defines the hipster ball
 */
class Ball
{
  float x, y;
  float r;
  Body ball;
  float xX; // used for scrollOffset
  boolean onGround; // Listener variable
  float cMillis = millis(); // for jumping time, used in update()

  Ball(float r_, float spawnX, float spawnY)
  {
    r= r_;

    // Creates a body within box2D world
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = boxw.coordPixelsToWorld(spawnX, spawnY);
    bd.bullet = true;
    ball = boxw.createBody(bd);

    // Defining and then assigning a fixture to a ball body
    FixtureDef fdball = new FixtureDef();
    CircleShape csb = new CircleShape();
    csb.m_radius = boxw.scalarPixelsToWorld(r);
    fdball.shape = csb;
    fdball.friction = 1.0f;
    fdball.density = 1.0f;
    fdball.restitution = 0.1f;
    ball.createFixture(fdball);

    ball.setUserData(this);
    onGround = false; // starting in mid-air
  }

  // Draw the ball
  void display()
  {
    Vec2 pos = boxw.getBodyPixelCoord(ball);
    xX = pos.x;

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-ball.getAngle());
    imageMode(CENTER);
    tint(255); // consistent color
    image(ballTexture, 0, 0, r*2+1, r*2+1);
    popMatrix();
  }

  // Listener function
  void setOnGround(boolean _onGround)
  {
    onGround = _onGround;
  }

  // Removes the ball from the sceen
  void kill()
  {
    boxw.destroyBody(ball);
  }

  // Checks if ball has fallen into a pit
  boolean offScreen()
  {
    Vec2 pos = boxw.getBodyPixelCoord(ball);
    if (pos.y > height+r*2)
    {
      ball.m_linearVelocity.x = 0;
      ball.m_linearVelocity.y = 0;
      return true;
    } else {
      return false;
    }
  }

  // Checks if ball is at the end of the level
  boolean levelEnd()
  {
    Vec2 pos = boxw.getBodyPixelCoord(ball);
    return (pos.x > width*4-r*3);
  }

  /*
   * Moves the ball according to questionable physics laws
   */
  void update()
  {
    ball.m_linearDamping = 2; // slow down the ball when keys are not pressed

    updateSame();
    if ( onGround && up && (millis() > 500 + cMillis)) // can only junp if 500 ms has passed
    {
      jumpSound.trigger();
      ball.m_linearVelocity.y = 40;
      cMillis = millis();
    }
  }

  // update function for the 2nd level, superclass didn't work, the ball is "mightier"
  void update2()
  {
    ball.m_linearDamping = 1;

    updateSame();
    if ( onGround && up && (millis() > 500 + cMillis))
    {
      jumpSound.trigger();
      ball.m_linearVelocity.y = 55;
      cMillis = millis();
    }
  }

  // Repeating sections in other update functions, created to avoid code duplication
  void updateSame()
  {
    if ( onGround && right && (ball.getLinearVelocity().x < 20))
    {
      ball.applyForceToCenter(new Vec2(700, 0));
      ball.m_linearDamping = 0;
    }

    if ( onGround && left  && (ball.getLinearVelocity().x > -20))
    {
      ball.applyForceToCenter(new Vec2(-700, 0));
      ball.m_linearDamping = 0;
    }

    if ( !onGround && right && (ball.getLinearVelocity().x < 15))
    {
      ball.applyForceToCenter(new Vec2(200, 0));
    }

    if ( !onGround && left && (ball.getLinearVelocity().x > -15))
    {
      ball.applyForceToCenter(new Vec2(-200, 0));
    }

    if ( !onGround)
    {
      ball.m_linearDamping = 0;
    }
  }
}

