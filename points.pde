// both group sizes MUST be prime numbers
int groupSizeX = 123;
int groupSizeY = 127;

int groupSize = groupSizeX * groupSizeY;

// step sizes can have any size
// in number theory any number is a generator of a group
int stepSizeX = 11;
int stepSizeY = 13;
int groupCoordX, groupCoordY;

// defines the percentage of pixels for each animationFrame
// this directly speeds up the renderer
float completeness = 0.1;

// animation frame
int animationFrame = 0;
int pixelsRendered = 0;

// color
float r, g, b;

void setup() {
  size(1080, 1080);
  background(0);
  groupCoordX = 0; groupCoordY = 0;
}

void draw() {
  noStroke();
  
  // in each iteration we process floor(width / groupA) * floor(height / groupB) number of pixels
  // thus the total number of pixels is floor(groupA / stepA) * floor(groupB / stepB) * speed
  // increasing the value for speed effectively increases the number of pixels being renderer in one frame
  int speed = 300;
  for (int k = 0; k < speed; k++) {
    
    if (pixelsRendered++ >= groupSize * completeness){
      animationFrame++;
      // we start the next animationFrane, thus the counter for pixels rendered is reset to zero
      pixelsRendered = 0;
    }
        
    for (int x = groupCoordX; x < width; x+=groupSizeX) {
      for (int y = groupCoordY; y < height; y+=groupSizeY) {
  
        // standartize coordinates
        float cx = x-width/2;
        float cy = y-height/2;
        
        // animation specific, have to adapted for different fractals
        cx = (0.1-0.01*animationFrame+3)*1.*cx/((float)width);
        cy = (0.1-0.01*animationFrame+3)*1.*cy/((float)height) - 0.6;

        int iteration;
        for (iteration = 0; iteration < 255; iteration++) {
          
          // uncomment for different fractal variations
          
          //float tmpX = cx * cx + cx * cx * cx - cy*cy*cx - 2*cx*cy*cy- cy * cy + 0.2952;
          //float tmpY = 2*cx*cy + 2*cx*cx*cy + cy*cx*cx - cy*cy*cy + 0.4923;
          
          //float tmpX = cx * cx + cx * cx * cx - cy*cy*cx - 2*cx*cy*cy- cy * cy + 0.2952 - 0.04*(animationFrame/40.);
          //float tmpY = 2*cx*cy + 2*cx*cx*cy + cy*cx*cx - cy*cy*cy + 0.4983 - 0.04*(animationFrame/40.);
          
          //float tmpX = cx * cx + cx * cx * cx - cy*cy*cx - 2*cx*cy*cy- cy * cy + 0.1952 - 0.04*(animationFrame/80.);
          //float tmpY = 2*cx*cy + 2*cx*cx*cy + cy*cx*cx - cy*cy*cy + 0.4993 - 0.04*(animationFrame/80.);
          
          //float tmpX = cx * cx + cx * cx * cx - cy*cy*cx - 2*cx*cy*cy- cy * cy + 0.1952 - 0.04*(animationFrame/80.);
          //float tmpY = 2*cx*cy + 2*cx*cx*cy + cy*cx*cx - cy*cy*cy + 0.5993 - 0.04*(animationFrame/80.);
          
          float tmpX = cx * cx - cy * cy + 0.2952 + 0.01*(animationFrame/80.);
          float tmpY = 2*cx*cy + 0.4923 + 0.01*(animationFrame/80.);
          
          //float tmpX = cx * cx - cy * cy + 0.2952 + 0.01*(animationFrame/80.);
          //float tmpY = 2*cx*cy + 0.4423 + 0.01*(animationFrame/80.);
          cx = tmpX;
          cy = tmpY;
          
          float res = cx * cx + cy * cy;
          //print(res + " ");
         
          if (res > 1)
            break;
        }
        iteration *= 10;
        fill(iteration%255);
        rect(x, y, 1 ,1);
      }
    }
    groupCoordX+= 5;
    groupCoordX = groupCoordX % groupSizeX;
    
    groupCoordY+= 40;
    groupCoordY = groupCoordY % groupSizeY;
  }
  saveFrame("line-######.png");
}

void keyPressed() {
  
}
