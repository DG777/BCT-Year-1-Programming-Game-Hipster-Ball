/*
 * Class for level platforms using JSONArray
 */
class Chains
{
  ArrayList<Vec2> dots;
  JSONArray lines; // load coordinates from a file
  Body surf;


  Chains(JSONArray lines_)
  {
    lines = lines_;
    dots = new ArrayList<Vec2>();
    for ( int i = 0; i<lines.size (); i++ )
    {
      JSONArray linez = lines.getJSONArray(i);
      int[] verts = linez.getIntArray();
      dots.add(new Vec2(verts[0], verts[1]));
    }

    Vec2[] verticles = new Vec2[dots.size()];
    for ( int i = 0; i < verticles.length; i++ )
    {
      Vec2 line = boxw.coordPixelsToWorld(dots.get(i));
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

  // Renders the platfroms
  void display()
  {
    strokeWeight(4);
    noFill();
    beginShape();
    for ( Vec2 vert : dots )
    {
      vertex(vert.x, vert.y );
    }
    endShape();
  }

  // Removes platfroms from the screen
  void kill()
  {
    boxw.destroyBody(surf);
  }
}

