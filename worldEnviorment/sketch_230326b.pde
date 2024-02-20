import processing.video.*; //<>//

//variables for globe
int x=0;
PImage earth;
PShape globe;
// initial rotation angle
float rotation = 0; 

//is movie playing
Boolean moviePlaying=false;

//font
PFont Font1;

//initial header
String titleText;
String subtitleText;
String sourceText;

//initiate data parse varitables
Table table;
IntList yearList;
IntList graphedData;
String fileName;
String name;

//initiate mobvie variable
Movie movie;

//icon variables + load images
PImage treeIcon, carbonIcon, seaIcon, homeIcon;
void loadIcons() {
  treeIcon = loadImage("tree.png");
  carbonIcon = loadImage("carbon.png");
  seaIcon = loadImage("sea.png");
  homeIcon = loadImage("home.png");
}
//labels and buttons
void loadLabelsAndButtons() {
  // Draw sea level button
  fill(255); // added fill color

  //c02 button
  rect(50, 560, 150, 30, 18);
  textSize(12);
  textAlign(CENTER);
  fill(0);
  text("c02 Increase", 130, 580);

  //sealevel button
  fill(255); // added fill color
  rect(250, 560, 150, 30, 18);
  fill(0, 105, 148);
  text("Sea Level", 330, 580);

  //deaforstation button
  fill(255); // added fill color
  rect(450, 560, 150, 30, 18);
  fill(  2, 48, 32);
  text("Deforestation", 532, 580);

  //sea level button icon
  image(seaIcon, 260, 560, 30, 30);

  //c02 button icon
  image(carbonIcon, 60, 560, 30, 30);

  //deforestation button icon
  image(treeIcon, 455, 560, 30, 30);

  //deforestation button icon
  image(homeIcon, 645, 565, 20, 20);
}
void setup() {
  size(700, 600, P3D);
  background(255);
  //set homepage to 1
  x=1;

  seaIcon = loadImage("sea.png");
  carbonIcon = loadImage("carbon.png");
  treeIcon = loadImage("tree.png");
  homeIcon = loadImage("home.png");


  //set so movie plays earth movie on initial view
  movie = new Movie(this, "earth.mp4");
  loadIcons();
  titleText = "Concerning Environmental Facts";
  subtitleText = "";
  sourceText = "Created by: Cameron Haley";
}
//movie reading
void movieEvent(Movie movie) {
  movie.read();
}
//rotate
void earthRotate() {
  noStroke();
  fill(255);
  earth = loadImage("earth1.png");
  globe = createShape(SPHERE, 100);
  globe.setTexture(earth);
  translate(width/2, height/2);
  // rotate around y-axis
  rotateY(rotation); 
  shape(globe);
  // increase rotation angle
  rotation += 0.01; 
}
void draw() {

  //rectangle is shown in same position in all views
  fill(255, 255, 255);
  rect(175, 65, 350, 100);
  if (x == 0) {
    //plays the movive for all the graphs in same position
    image(movie, 150, 40, 400, 150);
    movie.play();
    movie.loop();
  }
//if page is = 1 then rotate if not it will not show up 
  if (x == 1) {
    pushMatrix();
    earthRotate();
    popMatrix() ;
  }
  //get rid of lines on globe
  stroke(1);
  
  //call headers and buttons
  loadLabelsAndButtons();
  drawText(titleText, subtitleText, sourceText);
}


//when buttons are clicked
void mousePressed() {
  //sky map button
  if (mouseX > 50 && mouseX < 200 && mouseY > 560 && mouseY < 590) {
    //set page to 0
    x=0;
    // was slowing down after moultiple clicks so i added movie stop
    //for each press before the new videdo is called
    movie.stop();
    //changes the video
    movie = new Movie(this, "smog.mp4");
    fill(255);

    //text stuff
    titleText = "Global c02 increase scince 1970";
    subtitleText = "";
    sourceText = "(WDCE, Billion metric tons)";
    drawText(titleText, subtitleText, sourceText);

    //draw sky map
    drawGraph("sky.csv");
  }
  //sealevel map button
  if (mouseX > 250 && mouseX < 400 && mouseY > 560 && mouseY < 590) {
    x=0;
    movie.stop();
    ///change nmovie
    movie = new Movie(this, "sea.mp4");
    //draw graph
    drawGraph("seaLevel.csv");
    //title
    titleText = "Sea level increase scince 1960";
    subtitleText = "";
    sourceText = "(Source:NOAA,Millimeters)";
  }
  //deforestation map button
  if (mouseX > 450 && mouseX < 600 && mouseY > 560 && mouseY < 590) {
    x=0;
    movie.stop();
    ///change nmovie
    movie = new Movie(this, "forest.mp4");
    //draws graph
    drawGraph("deforest.csv");
    titleText = "Global deforestation scince 1960";
    subtitleText = "";
    sourceText = "(Source: World Data, Million Hectares)";
  } else if (mouseX > 635 && mouseX < 665 && mouseY > 560 && mouseY < 585) {
    movie.stop();

    x=1;
    background(255);
    //redraw initial screen
    redraw();
    movie = new Movie(this, "earth.mp4");
    titleText = "Concerning Environmental Facts";
    subtitleText = "";
    sourceText = "Created by: Cameron Haley";
  }
}
void drawGraph(String name) {
  //clears canvas
  background(255);
  //loads the labels and buttons that are used for all the graphs
  loadLabelsAndButtons();

  //gets data for new graph to draw
  parseData(name);

  //calls x axis labels
  yearText();

  //crate the shape from the data points
  int y = 600;
  int x = 50;
  int v = 0;

  //creates the shape
  beginShape();
  for (v = 0; v < yearList.size(); v++) {
    y = graphedData.get(v);
    // align to the middle of the screen
    vertex(x, (900 - y) / 2 + 50);
    x = x + 50;
  }
  // add vertex to complete the shape
  vertex(x-50, 900/2 + 50);
  endShape();
  yearText();
}

//gets data for graphs from each spreadsheet
void parseData(String fileName) {
  //water levels
  yearList = new IntList();
  graphedData = new IntList();
  table = loadTable(fileName, "header");
  for (TableRow row : table.rows()) {
    int year = row.getInt("Year");
    int yValue = row.getInt("Rise");
    yearList.append(year);
    graphedData.append(yValue);
  }
}
//headers for x axis
void yearText() {
  int y = 0;
  int yText = 0;
  int x = 50;
  int v = 0;
  int xText = 0;
  //alligning
  for (v = 0; v < yearList.size(); v++) {
    yText = graphedData.get(v);
    xText = yearList.get(v);
    y = (900 - yText) / 2 + 50;
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text(yText, x, y - 10);
    text(xText, x, 550);
    x = x + 50;
  }
}
//headers for all the views in same position
void drawText(String title, String subtitle, String source) {
  Font1 = createFont("Arial Bold", 18);
  textFont(Font1);

  // header for initial home page
  if (x==1) {
    fill(0);
    textSize(20);
    text(title, 350, 100);
    //secondary header
    textSize(12);
    text(subtitle, 350, 125);
    fill(128, 128, 128);
    text(source, 350, 150);
  }
  //headers for graph pages
  if (x ==0) {
    fill(255);
    textSize(20);
    text(title, 350, 100);
    //third header
    textSize(14);
    text(subtitle, 350, 185);
    fill(255, 255, 255);
    text(source, 350, 150);
  }
}
