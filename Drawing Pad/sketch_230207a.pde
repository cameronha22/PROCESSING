PImage img;
PGraphics pg;
PImage img2;
float r= 0;
float g = 0;
float b = 0;
int x = 1;
void setup()
{
  size(400, 400);
  pg = createGraphics(width, height);
  background (255, 255, 255);
  img = loadImage ("saveSymbol.jpg");
  img2 = loadImage ("clearSymbol.jpg");
  drawToolBox();
}
void drawToolBox() {
  //rectangle that holds all setting
  strokeWeight(1.0);
  stroke (0, 0, 0);
  rect (10, 330, 380, 65);

  //rectangle that  holds colors
  fill(255);
  rect (10, 330, 150, 65);


  //rectangle that holds stoke weight picker
  fill(255);
  rect (160, 330, 100, 65);


  //save image box
  fill(255);
  rect (325, 330, 65, 65);

  //clear image box
  fill(250);
  rect (260, 330, 65, 65);
  //stroke weight picker

  fill(0);
  circle(180, 365, 15);

  fill(0);
  circle(205, 365, 20);

  fill(0);
  circle(235, 365, 25);
}
void draw() {
  drawToolBox();


  //color options
  //yellow
  rect (30, 340, 25, 20);
  fill(255, 255, 0);


  //red
  rect (60, 340, 25, 20);
  fill(255, 0, 0);

  //orange
  rect (90, 340, 25, 20);
  fill(255, 165, 0);

  //green
  rect (120, 340, 25, 20);
  fill(0, 255, 0);

  //teal
  rect (30, 370, 25, 20);
  fill(0, 128, 128);

  //purple
  rect (60, 370, 25, 20);
  fill(128, 0, 128);

  //pink
  rect (90, 370, 25, 20);
  fill(255, 192, 203);

  //black
  rect (120, 370, 25, 20);
  fill(32, 32, 32);



  //clear image
  img2.resize(30, 30);
  image (img2, 280, 350);



  //save image
  img.resize(30, 30);
  image (img, 340, 350);
}



void mouseDragged()
{
  strokeWeight(x);
  stroke(r, g, b);

  line(pmouseX, pmouseY, mouseX, mouseY );
}

//mouse pressed funtion
void mousePressed() {
  stroke(r, g, b);

  strokeWeight(x);

  line(pmouseX, pmouseY, mouseX, mouseY );

  //clear image
  if (mouseX>260 && mouseX<330 && mouseY>330 &&mouseY<395) {
    background (255);
  }
  //save image
  if (mouseX>330 && mouseX<395 && mouseY>330 &&mouseY<395) {
    saveFrame("myDrawing-##.png");
  }


  //stroke change
  if (mouseX>170 && mouseX<190 && mouseY>355 &&mouseY<375) {
    x=5;
  }
  if (mouseX>195 && mouseX<215 && mouseY>355 &&mouseY<375) {
    x=15;
  }

  if (mouseX>220 && mouseX<250 && mouseY>352 &&mouseY<380) {
    x=25;
  }




  //black
  if (mouseX>30 && mouseX<55 && mouseY>340 &&mouseY<360) {
    r=0;
    g =0;
    b=0;
  }
  //yellow
  if (mouseX>60 && mouseX<85 && mouseY>340 &&mouseY<360) {
    r=255;
    g =255;
    b=0;
  }
  //red
  if (mouseX>90 && mouseX<115 && mouseY>340 &&mouseY<360) {
    r=255;
    g =0;
    b=0;
  }
  //orange
  if (mouseX>120 && mouseX<145 && mouseY>340 &&mouseY<360) {
    r=255;
    g =165;
    b=0;
  }

  //green
  if (mouseX>30 && mouseX<55 && mouseY>370 &&mouseY<390) {
    r=0;
    g =255;
    b=0;
  }
  //teal
  if (mouseX>60 && mouseX<85 && mouseY>370 &&mouseY<390) {
    r=0;
    g =128;
    b=128;
  }
  //purple
  if (mouseX>90 && mouseX<115 && mouseY>370 &&mouseY<390) {
    r=128;
    g =0;
    b=128;
  }
  //pink
  if (mouseX>120 && mouseX<145 && mouseY>370 &&mouseY<390) {
    r=255;
    g =192;
    b=203;
  }
}
