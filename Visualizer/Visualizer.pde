/*
 * Spatial Data Previewer v0.5 - DataPreviewer
 * Authored by Gregory Lucas Moody
 * Prototype Spatial Data Previewer
 * Used for verification of Algorithms
 */
  
String[] data; //The array of strings read from inputed WKT file
ArrayList<SpatialData> spatialData; //Array of spatial data parsed from data
int index = 0; //tracks which entry is being viewed

int PREVIEW_SIZE = 500; //Display size of the Preview
int CANVAS_SIZE = 1000; //Settings from the Data Generator

float SCALE_FACTOR = (float)PREVIEW_SIZE/CANVAS_SIZE;
void settings() {
  size(PREVIEW_SIZE, PREVIEW_SIZE+100);
}

void setup() {
 size(500, 500); //Default size of the canvas
 //background(255); //Default Background color - White
 fill(0); //Default Drawing color - Black
 noLoop();
 
 //Loads strings from all the following WKT files - each element is a WKT entry
 String arrayWKT[] = {"test.polygons.txt","test.linestrings.txt","test.conicSpiral.txt","test.triangles.txt"
             ,"test.randomWalk.txt"};
 spatialData = new ArrayList<SpatialData>();
 for(int i = 0; i < arrayWKT.length; i++){
   
   data = loadStrings(arrayWKT[i]);
   
   
   //For each element of data, parse the WKT entry, and create a SpatialData Object
   for(int j = 0; j < data.length; j++){
      String[] pieces = parseWKT(data[j]);
      spatialData.add(new SpatialData(pieces));
   }
 }
 
}

//Draws current entry to the canvas
void draw() {
  background(255);
  Drawer preview = new Drawer();
  preview.drawSpatialData(spatialData.get(index));
  text(spatialData.get(index).toString(), 0, 550);
}

//handles events on key presses
void mousePressed() {
  index++; 
  if (index >= spatialData.size()) {
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