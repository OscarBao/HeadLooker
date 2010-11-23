// create new head variable
Head[] heads;

int numx = 4, numy = 4;

void setup() 
{
    size(500, 500);
    
    // instance new head array
    heads = new Head[numx * numy];

    // create heads array
    int headw = width / numx;
    int heady = height / numy;
    int headid = 0;
    for (int y = 0; y < numy; y++) {    
        for (int x = 0; x < numx; x++) {            
            heads[headid] = new Head((x * headw) + headw / 2,  (y * heady) + heady / 2 , width / numx, height / numy);
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

