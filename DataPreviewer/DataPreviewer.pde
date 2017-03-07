/*
 * Spatial Data Previewer v0.5 - DataPreviewer
 * Authored by Gregory Lucas Moody
 * Prototype Spatial Data Previewer
 * Used for verification of Algorithms
 */
  
String[] data; //The array of strings read from inputed WKT file
SpatialData[] spatialData; //Array of spatial data parsed from data
int index = 0; //tracks which entry is being viewed

int PREVIEW_SIZE = 500; //Display size of the Preview
int CANVAS_SIZE = 1000; //Settings from the Data Generator

float SCALE_FACTOR = (float)PREVIEW_SIZE/CANVAS_SIZE;
//float SCALE_FACTOR = 2.5;


void settings() {
  size(PREVIEW_SIZE, PREVIEW_SIZE+100);
}

void setup() {
 //size(500, 500); //Default size of the canvas
 background(255); //Default Background color - White
 fill(0); //Default Drawing color - Black
 noLoop();
 
 //Loads strings from specified WKT file - each element is a WKT entry
 // .txt must be in the DataPreviewer Directory
 //data = loadStrings("data.polygons.txt");
 //data = loadStrings("data.linestrings.txt");
 data = loadStrings("data.conicSpiral.txt");
 //data = loadStrings("data.triangles.txt");
 //data = loadStrings("data.randomWalk.txt");
 //data = loadStrings("dara.midPointDisplacement.txt");
 //data = loadStrings("data.Quick-StarPolygons.txt");
 spatialData = new SpatialData[data.length];
 
 //For each element of data, parse the WKT entry, and create a SpatialData Object
 for(int i = 0; i < data.length; i++){
    String[] pieces = parseWKT(data[i]);
    spatialData[i] = new SpatialData(pieces);
 }
 
}

//Draws current entry to the canvas
void draw() {
  background(255);
  Drawer preview = new Drawer();
  preview.drawSpatialData(spatialData[index]);
  text(spatialData[index].toString(), 0, 550);
}

//handles events on key presses
void mousePressed() {
  index++; 
  if (index >= spatialData.length) {
    index = 0;  // go back to the beginning
  } 
  redraw();
}

/* Parses the WKT  by triming the ")", "(", and ","s 
 * and returing the final String array
 */
String[] parseWKT(String dataWKT){
  String[] parsed = splitTokens(dataWKT, "( , ) ");
  return parsed;
}