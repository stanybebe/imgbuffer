PImage img;
float ratio;
float tilex;
float tiley;
float tilesize;
float t;
float noisee;
float noisee2;
float b;
float b2;



void setup(){
  size(400,400,P3D);
  img= loadImage("stany.png");
  img.resize(400, 400);
   PJOGL.profile=1;

  
}


void draw(){
  t=t+.4;

  background(#121FFF);
 // noStroke();
    ratio =(height/width);
  tilex =70;
  tiley = ratio * tilex;
  tilesize = width/tilex;
  
  for (int y =0; y<img.height;y+=tilesize){
    for (int x =0; x<img.width;x+=tilesize){
      noisee = floor(random(0,5));
      noisee2 = sin(random(0,5));

      color c = img.get(x,y);
      b =map(brightness(c),0,255,1,0);
      b2 =map(brightness(c),0,255,0,.5);
      pushMatrix();
      translate(x,y);
      strokeWeight(b*tilesize);
      stroke(#FA95E4);
      line(0*noisee, 0+noisee2,sin(t*b*tilesize*.02)*20, b*tilesize);
      translate(0,0,sin(t*b2*tilesize*.02)*200);
      noStroke();
      ellipse(0+noisee,0+noisee2,b2*tilesize,b2*tilesize);
      popMatrix();
     
    }
      
  }
  
  
}
void keyPressed() {
  if (key=='s'||key=='S') {

    // Saves each frame as line-000001.png, line-000002.png, etc.
    saveFrame("ingrown-######.png");
  }
}
