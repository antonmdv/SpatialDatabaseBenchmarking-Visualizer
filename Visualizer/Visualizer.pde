/*
 * Spatial Data Previewer v0.5 - DataPreviewer
 * Authored by Gregory Lucas Moody
 * Prototype Spatial Data Previewer
 * Used for verification of Algorithms
 */
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;

float bx; //x coord for scrolling
float by; //y coord for scrolling
float xOffset = 0.0; //mouse x coord for scrolling
float yOffset = 0.0; //mouse y coord for scrolling

float zoom; //float representing doom

GUI settings;

String[] data; //The array of strings read from inputed WKT file
ArrayList<SpatialData> spatialData; //Array of spatial data parsed from data
//int index = 0; //tracks which entry is being viewed
String WKT1 = "data.points.txt";
String WKT2 = "data.points.txt";
String WKT3 = "data.points.txt";

int PREVIEW_SIZE = 500; //Display size of the Preview
int CANVAS_SIZE = 1000; //Settings from the Data Generator

float SCALE_FACTOR = (float)PREVIEW_SIZE/CANVAS_SIZE;

//Settings function - Values enter into GUI go here
void settings() {
  size(PREVIEW_SIZE, PREVIEW_SIZE);
  bx = 0.0;
  by = 0.0;
  zoom = 1.0;
}

void setup() {
  fill(0);
  noLoop();
    
  //java.swing GUI initialization
  size(384, 216);
  JFrame frame =new JFrame("Controls");
  frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  
  settings = new GUI();
  settings.setOpaque(true); //content panes must be opaque
  frame.setContentPane(settings);
  
  //Display the window.
  frame.pack();
  frame.setVisible(true);
  
  //Load default WKTS
  loadWKT();
  surface.setResizable(true);
}

//Draws current entry to the canvas
void draw() {
  background(255); //Default Background color - White
  Drawer preview = new Drawer();
  scale(zoom);
  for(int i = 0; i < spatialData.size(); i++){
    preview.drawSpatialData(spatialData.get(i));
  }
}

//offset of the mouse, so the dragging doesn't center on the mouse
void mousePressed() {
    xOffset = mouseX-bx; 
    yOffset = mouseY-by; 
}

//keeps track off mouse coordinates while clicking and dragging, then redraws the canvas
void mouseDragged() {
    if (keyPressed == true && key == CODED && keyCode == CONTROL){
      zoom += .01;
    }else if (keyPressed == true && key == CODED && keyCode == SHIFT){
      zoom -= .01;
    }else{
      bx = mouseX-xOffset; 
      by = mouseY-yOffset; 
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

void loadWKT(){
  //Loads strings from all the following WKT files - each element is a WKT entry
   String arrayWKT[] = {WKT1,WKT2,WKT3};
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