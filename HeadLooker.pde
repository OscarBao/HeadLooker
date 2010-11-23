// create new head variable
Head[] heads;

int numx = 1, numy = 1;

void setup() 
{
    size(400, 333);
    
    // instance new head array
    heads = new Head[numx * numy];
    heads[0] = new Head("gd");

    // create heads array
    int headw = width / numx;
    int heady = height / numy;
    int headid = 0;
    for (int y = 0; y < numy; y++) {    
        for (int x = 0; x < numx; x++) {            
            heads[headid].x = (x * headw) + headw / 2;
            heads[headid].y = (y * heady) + heady / 2;
            heads[headid].w = width / numx;
            heads[headid].h = height / numy;
            headid++;
        } 
    }
}


void draw() 
{
    background(102);
    for (int i = 0; i < heads.length; i++) {        
        // update head object with mouse variables        
        heads[i].update(mouseX, mouseY);
        // display head
        heads[i].display();
    }
}

