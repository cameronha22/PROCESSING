PImage img;
PImage img2;
PImage erodedImg;
PImage blurredImg;
PImage dilutedImg;
PImage invertedImg;
PImage grayImg;
PImage posterizeImg;
PImage thresholdImg;
int xStart = 0;

void setup()
{
  size(600, 500);
  background (255, 255, 255);
  img = loadImage ("apples.jpg");
  img.resize(600, 200);
  img2= loadImage("saveIcon.png");
  original();
}

void draw() {
  textAlign(CENTER);
  fill(255, 255, 255);
  drawToolBox();
  filterText();
  //if key pressed go back to orignial photo
  if (keyPressed == true) {
    original();
  }
}

//rectangle that holds all setting
void drawToolBox() {
  //rectangle that holds all setting
  strokeWeight(1.0);
  fill(255, 255);

  //original box
  rect (60, 410, 54, 85);
  erodedImg = loadImage("apples.jpg");
  image(img, 67, 420, 40, 45);

  //blur filter
  rect (114, 410, 54, 85);
  blurredImg = loadImage("apples.jpg");
  blurredImg.filter(BLUR);
  image(erodedImg, 121, 420, 40, 45);

  //erode filter
  rect (168, 410, 54, 85);
  erodedImg = loadImage("apples.jpg");
  erodedImg.filter(ERODE);
  image(erodedImg, 175, 420, 40, 45);

  //dilute
  rect (222, 410, 54, 85);
  dilutedImg = loadImage("apples.jpg");
  dilutedImg.filter(DILATE);
  image(dilutedImg, 229, 420, 40, 45);

  //invert filter
  rect (276, 410, 54, 85);
  invertedImg = loadImage("apples.jpg");
  invertedImg.filter(INVERT);
  image(invertedImg, 283, 420, 40, 45);

  //gray filter
  rect (330, 410, 54, 85);
  grayImg = loadImage("apples.jpg");
  grayImg.filter(GRAY);
  image(grayImg, 337, 420, 40, 45);

  //posterize filter
  rect (384, 410, 54, 85);
  posterizeImg = loadImage("apples.jpg");
  posterizeImg.filter(POSTERIZE, 10);
  image(posterizeImg, 391, 420, 40, 45);

  //Threshold filter
  rect (438, 410, 54, 85);
  thresholdImg = loadImage("apples.jpg");
  thresholdImg.filter(THRESHOLD, .8);
  image(thresholdImg, 445, 420, 40, 45);

  //save
  rect (492, 410, 54, 85);
  image(img2, 500, 423, 40, 45);
}
// TEXT FOR THE CORRESPONDING FILTERS
void filterText() {
  fill(0, 0, 0);
  textSize(12);
  text("Original", 60, 470, 54, 20);
  text("Blur", 114, 470, 54, 65);
  text("Erode", 168, 470, 54, 65);
  text("Dilate", 222, 470, 54, 65);
  text("Invert", 276, 470, 54, 65);
  text("Gray", 330, 470, 54, 20);
  text("Posterize", 384, 470, 54, 20);
  text("Threshold", 438, 470, 54, 20);
  text("Save", 492, 470, 54, 20);
}

//FILTER FUNCTIONS
void original() {
  img=loadImage("apples.jpg");
  image(img, 0, 0, 600, 400);
  //grey box under the filter boxes to show which one you are on 
  selectorIndicator(60);
}

void blurred() {
  PImage blurredImg;
  blurredImg = loadImage("apples.jpg");
  blurredImg.filter(BLUR, 5);
  image(blurredImg, 0, 0, 600, 400);
  selectorIndicator(114);
}

void eroded() {
  PImage erodedImg;
  erodedImg = loadImage("apples.jpg");
  erodedImg.filter(ERODE);
  image(erodedImg, 0, 0, 600, 400);
  selectorIndicator(168);
}

void diluted() {
  PImage dilutedImg;
  dilutedImg = loadImage("apples.jpg");
  dilutedImg.filter(DILATE);
  image(dilutedImg, 0, 0, 600, 400);
  strokeWeight(0);
  selectorIndicator(222);
}

void inverted() {
  PImage invertedImg;
  invertedImg = loadImage("apples.jpg");
  invertedImg.filter(INVERT);
  image(invertedImg, 0, 0, 600, 400);
  selectorIndicator(276);
}

void gray() {
  PImage grayImg;
  grayImg = loadImage("apples.jpg");
  grayImg.filter(GRAY);
  image(grayImg, 0, 0, 600, 400);
  selectorIndicator(330);
}

void posterize() {
  PImage posterizeImg;
  posterizeImg = loadImage("apples.jpg");
  posterizeImg.filter(POSTERIZE, 5);
  image(posterizeImg, 0, 0, 600, 400);
  selectorIndicator(384);
}

void threshold() {
  PImage thresholdImg;
  thresholdImg = loadImage("apples.jpg");
  thresholdImg.filter(THRESHOLD, .8);
  image(thresholdImg, 0, 0, 600, 400);
  selectorIndicator(438);
}

//MOUSE PRESS WILL ACTIVATE THE FILTER FUNCTIONS AND CHANGE THE PHOTO
void mousePressed() {
  if (mouseX>60 && mouseX<114 && mouseY>410 &&mouseY<495) {
    original();
    clearIncreaseToolBar();
  }

  if (mouseX>114 && mouseX<168 && mouseY>410 &&mouseY<495) {
    clearIncreaseToolBar();
    blurred();
  }
    if (mouseX>1 && mouseX<398 && mouseY>398 &&mouseY<408) {
    saveImg();
  }

  if (mouseX>168 && mouseX<222 && mouseY>410 &&mouseY<495) {
    clearIncreaseToolBar();

    eroded();
  }

  if (mouseX>222 && mouseX<276 && mouseY>410 &&mouseY<495) {
    diluted();
    clearIncreaseToolBar();
  }

  if (mouseX>276 && mouseX<330 && mouseY>410 &&mouseY<495) {
    clearIncreaseToolBar();

    inverted();
  }
  if (mouseX>330 && mouseX<384 && mouseY>410 &&mouseY<495) {
    clearIncreaseToolBar();

    gray();
  }

  if (mouseX>384 && mouseX<438 && mouseY>410 &&mouseY<495) {
    clearIncreaseToolBar();
    posterize();
    increaseToolbar(384);
  }

  if (mouseX>438 && mouseX<492 && mouseY>410 &&mouseY<495) {
    clearIncreaseToolBar();
    threshold();
  }
  if (mouseX>492 && mouseX<546 && mouseY>410 &&mouseY<495) {
    saveImg();
  }
  
  //these mouse presses are for changing the threshold value
    if (mouseX>384 && mouseX<402 && mouseY>400 &&mouseY<410) {
     posterizeImg = loadImage("apples.jpg");
  posterizeImg.filter(POSTERIZE,7);
  image(posterizeImg, 0, 0, 600, 400);
  }  if (mouseX>402 && mouseX<420 && mouseY>400 &&mouseY<410) {
      posterizeImg = loadImage("apples.jpg");
  posterizeImg.filter(POSTERIZE, 5);
  image(posterizeImg, 0, 0, 600, 400);
  } 
  if (mouseX>420 && mouseX<438 && mouseY>400 &&mouseY<410) {
  posterizeImg = loadImage("apples.jpg");
  posterizeImg.filter(POSTERIZE, 3);
  image(posterizeImg, 0, 0, 600, 400);  }
}


//IMAGE SAVING FUNCTION
void saveImg() {
  PImage savedImg= get(0, 0, 600, 300);
  savedImg.save("myPhoto-######.png");
}

//filter increaser toolbar
void increaseToolbar(int xStart) {
  strokeWeight(1);
  fill(255, 255, 255);
  rect (xStart, 400, 18, 10);
  rect (xStart+18, 400, 18, 10);
  rect (xStart+36, 400, 18, 10);
  fill(0, 0, 0);
  text("1", xStart, 398, 18, 20);
  text("2", xStart+18, 398, 18, 20);
  text("3", xStart+36, 398, 18, 20);
}

//this clears the filter increase toolbar
void clearIncreaseToolBar() {
  fill(255, 255, 255);
  strokeWeight(0);
  fill(255, 255, 255);
  strokeWeight(0);
  rect (60, 400, 486, 10);
}

//this is the grey box under the filters that shows user what image they are on 
void selectorIndicator(int xStart) {
  int xValue = (xStart +13);
  strokeWeight(1);
  fill(255, 255, 255);
  rect (60, 495, 486, 5);
  fill(211, 211, 211);
  rect (xValue, 495, 27, 85);
}
