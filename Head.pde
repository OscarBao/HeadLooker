class Head 
{
    int x, y, w, h; // position and size
    float angle = 0.0; // angle of mouse in relation to object
    int segmentID = 0; // current segment id variable
    int numSegments = 8; // number of segments
    boolean mOver = false; // mouse over boolean
    boolean mPressed = false; // mouse pressed boolean

    // object constructor
    Head(int _x, int _y, int _w, int _h) {
        x = _x;
        y = _y;
        w = _w;
        h = _h;
    }
    
    // update internal variables
    void update(int mx, int my) {
      
        // set angle to mouse position offset from the x,y position
        angle = atan2(my-y, mx-x);
        
        // calculate the segment id based on the angle of the mouse position
        segmentID = int(map(angle, PI + radians(45/2), -PI + radians(45/2), 0, numSegments));
        
        // check to see if the mouse is inside the object
        if () {
            
            // set mouseOver to true


            // set mouse pressed variable to internal Processing mousePressed variable

        }
        // else, set mouse pressed and mouse over to false
        else {
        }
    }
    
  
    void display() {        
        
        // push new matrix
        pushMatrix();
        
        // translate to position
        translate(x, y);

        // if mouse over, else
        if (mOver)
            fill(200);
        else
            fill(160);
        
        // if mouse pressed    
        if (mPressed)
            fill(255);
            
        // draw rectangle    
        rect(-w/2, -h/2, w, h);
        
        // rotation display
        rotate(angle);
        line(0, 0, w, 0);
        
        // pop out matrix
        popMatrix();
    }
}

