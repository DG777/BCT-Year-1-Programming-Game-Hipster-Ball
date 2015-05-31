/*
 * Randomly generated surface using perlin noise
 */
class RandomSurface
{
  ArrayList<Vec2> surface;
  Body surf;

  RandomSurface()
  {
    surface = new ArrayList<Vec2>();
    float pnz = 0.1; // Perlin noise variable

    for (float x = width*4.3; x > -10; x -=20)
    {
      float y;
      y = 300 + map(noise(pnz), 0, 1.1, -200, 200);
      surface.add(new Vec2(x, y));
      pnz += random(0.1);
    }

    Vec2[] verticles = new Vec2[surface.size()];
    for ( int i = 0; i < verticles.length; i++ )
    {
      Vec2 line = boxw.coordPixelsToWorld(surface.get(i));
      verticles[i] = line;
    }

    BodyDef bd = new BodyDef();
    surf = boxw.createBody(bd);
    bd.type = BodyType.STATIC;
    bd.position.set(0.0f, 0.0f);

    ChainShape chain = new ChainShape();
    chain.createChain(verticles, verticles.length);
    FixtureDef fdplat = new FixtureDef();
    fdplat.shape = chain;
    fdplat.restitution = 0.2f;
    surf.createFixture(fdplat);
  }

  void display()
  {
    strokeWeight(4);
    stroke(255);
    noFill();
    beginShape();
    for ( Vec2 vert : surface )
    {
      vertex(vert.x, vert.y );
    }
    endShape();
  }

  // Destroy platforms
  void kill()
  {
    boxw.destroyBody(surf);
  }
}

