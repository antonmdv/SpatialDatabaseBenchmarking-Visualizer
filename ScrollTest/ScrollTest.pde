float bx;
float by;
int boxSize = 75;
float xOffset = 0.0; 
float yOffset = 0.0; 

String[] data; //The array of strings read from inputed WKT file
SpatialData[] spatialData; //Array of spatial data parsed from data
int index = 0; //tracks which entry is being viewed

int PREVIEW_SIZE = 500; //Display size of the Preview
int CANVAS_SIZE = 1000; //Settings from the Data Generator

float SCALE_FACTOR = (float)PREVIEW_SIZE/CANVAS_SIZE;

void settings() {
   size(PREVIEW_SIZE, PREVIEW_SIZE+100);
   bx = 0.0;
   by = 0.0;
}

void setup() {
   fill(0); //Default Drawing color - Black
   noLoop();
 
   //Loads strings from specified WKT file - each element is a WKT entry
   // .txt must be in the DataPreviewer Directory
   data = loadStrings("data.conicSpiral.txt");
   spatialData = new SpatialData[data.length];
 
   //For each element of data, parse the WKT entry, and create a SpatialData Object
   for(int i = 0; i < data.length; i++){
      String[] pieces = parseWKT(data[i]);
      spatialData[i] = new SpatialData(pieces);
   }
}

void draw() { 
   background(255); //Default Background color - White
   Drawer preview = new Drawer();
   preview.drawSpatialData(spatialData[index]);  
   text(spatialData[index].toString(), 0, 550);
}

//offset of the mouse, so the dragging doesn't center on the mouse
void mousePressed() {
    xOffset = mouseX-bx; 
    yOffset = mouseY-by; 
}

//keeps track off mouse coordinates while clicking and dragging, then redraws the canvas
void mouseDragged() {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
    redraw();
}

/* Parses the WKT  by triming the ")", "(", and ","s 
 * and returing the final String array
 */
String[] parseWKT(String dataWKT){
  String[] parsed = splitTokens(dataWKT, "( , ) ");
  return parsed;
}