static final float VEL_BASE = 5;
static final int SIZE = 50;
static final int CHUNK = 5;

class Tail {
   ArrayList<PVector> _tail;
   ArrayList<PVector> _velocities;
   Tail(PVector origin) {
     _tail = new ArrayList<PVector>(SIZE+1);
     _velocities = new ArrayList<PVector>(SIZE+1);
   }
  
  public void update(PVector cursor) {
    _tail.add(cursor);
    _velocities.add(new PVector(random(VEL_BASE)-VEL_BASE/2.0, random(VEL_BASE)-VEL_BASE/2.0));
    if( _tail.size() > SIZE){
      _tail.remove(0);
      _velocities.remove(0);
    }
    
    for( int i = 0; i < _tail.size(); i++ )
    {
       _tail.get(i).x += _velocities.get(i).x;
       _tail.get(i).y += _velocities.get(i).y;
    }
  }
  
  public void draw() {

    for( int i = _tail.size()-1 , s = 255; i >= 0 ; i-=CHUNK, s-=15 )
    {
      stroke(s); 
      beginShape();
      for( int x = 0 ; x < CHUNK && i-x >= 0 ; x++ )
      {
          curveVertex(_tail.get(i-x).x, _tail.get(i-x).y);   
      }
      endShape();
    }
    
  }
  
}
