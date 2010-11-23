class Head 
{
    PImage[] frames;
  
    int x, y, w, h; // position and size
    float angle = 0.0; // angle of mouse in relation to object
    int segmentID = 0; // current segment id variable
    int numSegments = 8; // number of segments
    boolean mOver = false; // mouse over boolean
    boolean mPressed = false; // mouse pressed boolean
    
    String id = "";

    // object constructor
    Head(String _id) {
      id = _id;
      
      frames = new PImage[10];
      
      for (int i = 0; i < 10; i++) {
        frames[i] = loadImage(id + "/" + i + ".jpg");        
      }
    }
    
    // update internal variables
    void update(int mx, int my) {
      
        // set angle to mouse position offset from the x,y position
        angle = atan2(my-y, mx-x);
        
        // calculate the segment id based on the angle of the mouse position
        segmentID = int(map(angle, PI + radians(45/2), -PI + radians(45/2), 0, numSegments));
        
        // check to see if the mouse is inside the object
        if (mouseX >= x - w/2 && mouseX <= x + w/2 &&
            mouseY >= y - h/2 && mouseY <= y + h/2) {
            
            // set mouseOver to true
            mOver = true;

            // set mouse pressed variable to internal Processing mousePressed variable
            mPressed = mousePressed;
        }
        // else, set mouse pressed and mouse over to false
        else {
            mOver = false;
            mPressed = false;
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
        
        // draw rectangle    
        rect(-w/2, -h/2, w, h);
        
        // if mouse pressed    
        if (mPressed) {
          // draw image
          image(frames[9], -w/2, -h/2);    
        }
        else {
          // draw image
          image(frames[segmentID], -w/2, -h/2);          
        }
            
        
        // rotation display
        rotate(angle);
        line(0, 0, w, 0);
        
        // pop out matrix
        popMatrix();
    }
}


