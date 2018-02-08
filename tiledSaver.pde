// hit the 's' key to save tiles
int w = 5000;
int h = 2500;

// scale to shrink the window so that it fits on the screen
int scale = 5;

PGraphics pg;
PGraphics tiler;

PImage img;

// how many tiles across and down should we save
// will output tiles*tiles # of images
int tiles = 4;

void settings(){
  size(w/scale, h/scale);
  
  img = loadImage("gradient.jpg");
}

void setup(){
  // setup pgraphics
  pg = createGraphics(w, h);
  tiler = createGraphics(w/tiles, h/tiles);
}

void draw(){
  pg.beginDraw();
    // do your drawing in here
    pg.image(img,0,0);
  pg.endDraw();
  
  // draw the pgraphics to the screen
  image(pg, 0,0,w/scale, h/scale);
}

void tileAndSave(){
 
  int inc = 0;
  String timestamp = year() + nf(month(),2) + nf(day(),2) + "-"  + nf(hour(),2) + nf(minute(),2) + nf(second(),2) + "/";
  
  for(int y = 0; y<tiles; y++){
    for(int x = 0; x<tiles; x++){
      tiler.beginDraw();
        tiler.image(pg, x*-(w/tiles), y*-(h/tiles), pg.width, pg.height);
      tiler.endDraw();
      
      String file = str(inc) + ".png";
      println("saving " + file);
      tiler.save( "tiles/" + timestamp + file );
      inc++;
    }
  }
}

void keyPressed(){
 if(key == 's'){
  tileAndSave(); 
 }
}