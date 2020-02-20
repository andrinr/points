int groupA = 123;
int groupB = 127;
int stepA = 11;
int stepB = 13;
int i, j;
int frame = 0;
int a = 0;
int iterations = 40;

float r, g, b;
void setup() {
  size(1080, 1080);
  background(0);
  i = 0; j = 0;
}

void draw() {
  noStroke();
  //print(frame+":");
  for (int speed = 0; speed < 200; speed++) {
    if (a++ >= groupA*groupB/5.){
          frame++;
          a = 0;
          //break;
        }
    for (int x = i; x < width; x+=groupA) {
      for (int y = j; y < height; y+=groupB) {
  
        //print(a);
        float cx = x-width/2;
        float cy = y-height/2+0.5;
        
        cx = (0.1-0.01*frame+3)*1.*cx/((float)width);
        cy = (0.1-0.01*frame+3)*1.*cy/((float)height);

        int iteration;
        for (iteration = 0; iteration < 255; iteration++) {
          
          //float tmpX = cx * cx + cx * cx * cx - cy*cy*cx - 2*cx*cy*cy- cy * cy + 0.2952;
          //float tmpY = 2*cx*cy + 2*cx*cx*cy + cy*cx*cx - cy*cy*cy + 0.4923;
          
          //float tmpX = cx * cx + cx * cx * cx - cy*cy*cx - 2*cx*cy*cy- cy * cy + 0.2952 - 0.04*(frame/40.);
          //float tmpY = 2*cx*cy + 2*cx*cx*cy + cy*cx*cx - cy*cy*cy + 0.4983 - 0.04*(frame/40.);
          
          //float tmpX = cx * cx + cx * cx * cx - cy*cy*cx - 2*cx*cy*cy- cy * cy + 0.1952 - 0.04*(frame/80.);
          //float tmpY = 2*cx*cy + 2*cx*cx*cy + cy*cx*cx - cy*cy*cy + 0.4993 - 0.04*(frame/80.);
          
          float tmpX = cx * cx + cx * cx * cx - cy*cy*cx - 2*cx*cy*cy- cy * cy + 0.1952 - 0.04*(frame/80.);
          float tmpY = 2*cx*cy + 2*cx*cx*cy + cy*cx*cx - cy*cy*cy + 0.5993 - 0.04*(frame/80.);
          
          //float tmpX = cx * cx - cy * cy + 0.2952 + 0.02*(frame/80.);
          //float tmpY = 2*cx*cy + 0.4923 + 0.02*(frame/80.);
          
          //float tmpX = cx * cx - cy * cy + 0.2952 + 0.01*(frame/80.);
          //float tmpY = 2*cx*cy + 0.4423 + 0.01*(frame/80.);
          cx = tmpX;
          cy = tmpY;
          
          float res = cx * cx + cy * cy;
          //print(res + " ");
         
          if (res > 1)
            break;
        }
        iteration *= 10;
        if (iteration < 255/3.){
          fill(iteration*3,0,0);
        }
        else if (iteration < 255*2/3.){
          fill(255-iteration*3 - 255/3. ,iteration*3 - 255/3. ,0);
        }
        else{
          fill(0,255 -iteration*3 - 2*255/3. ,iteration*3 - 2*255/3.);
        }
        fill(iteration%255);
        rect(x, y, 1,1);
      }
    }
    i+= 5;
    i = i % groupA;
    
    j+= 40;
    j = j % groupB;
   
    
  }
}

void keyPressed() {
  saveFrame("line-######.png");
}
