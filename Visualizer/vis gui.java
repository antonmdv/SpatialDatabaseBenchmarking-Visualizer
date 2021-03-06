//Generated by GuiGenie - Copyright (c) 2004 Mario Awad.
//Home Page http://guigenie.cjb.net - Check often for new versions!

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;

public class vis gui extends JPanel {
    private JButton visGen;
    private JTextField windowSize;
    private JPasswordField databaseSize;
    private JLabel windowLabel;
    private JLabel dataLabel;
    private JLabel wkt1Label;
    private JLabel wkt2Label;
    private JLabel wkt3Label;
    private JComboBox wkt1Select;
    private JComboBox wkt2Select;
    private JComboBox wkt3Select;

    public vis gui() {
        //construct preComponents
        String[] wkt1SelectItems = {"Points", "Line Strings", "Conic Spiral", "Midpoint Displacement", "Random Walk", "Polygons", "Quick Star Polygons", "Squares", "Triangles"};
        String[] wkt2SelectItems = {"Points", "Line Strings", "Conic Spiral", "Midpoint Displacement", "Random Walk", "Polygons", "Quick Star Polygons", "Squares", "Triangles"};
        String[] wkt3SelectItems = {"Points", "Line Strings", "Conic Spiral", "Midpoint Displacement", "Random Walk", "Polygons", "Quick Star Polygons", "Squares", "Triangles"};

        //construct components
        visGen = new JButton ("Generate");
        windowSize = new JTextField (5);
        databaseSize = new JPasswordField (5);
        windowLabel = new JLabel ("Window SIze");
        dataLabel = new JLabel ("Database Size");
        wkt1Label = new JLabel ("WKT 1");
        wkt2Label = new JLabel ("WKT 2");
        wkt3Label = new JLabel ("WKT 3");
        wkt1Select = new JComboBox (wkt1SelectItems);
        wkt2Select = new JComboBox (wkt2SelectItems);
        wkt3Select = new JComboBox (wkt3SelectItems);

        //adjust size and set layout
        setPreferredSize (new Dimension (268, 309));
        setLayout (null);

        //add components
        add (visGen);
        add (windowSize);
        add (databaseSize);
        add (windowLabel);
        add (dataLabel);
        add (wkt1Label);
        add (wkt2Label);
        add (wkt3Label);
        add (wkt1Select);
        add (wkt2Select);
        add (wkt3Select);

        //set component bounds (only needed by Absolute Positioning)
        visGen.setBounds (85, 255, 100, 20);
        windowSize.setBounds (10, 50, 100, 25);
        databaseSize.setBounds (155, 50, 100, 25);
        windowLabel.setBounds (10, 25, 100, 25);
        dataLabel.setBounds (155, 25, 100, 25);
        wkt1Label.setBounds (115, 85, 100, 25);
        wkt2Label.setBounds (110, 135, 100, 25);
        wkt3Label.setBounds (115, 185, 100, 25);
        wkt1Select.setBounds (85, 110, 100, 25);
        wkt2Select.setBounds (85, 160, 100, 25);
        wkt3Select.setBounds (85, 205, 100, 25);
    }


    public static void main (String[] args) {
        JFrame frame = new JFrame ("vis gui");
        frame.setDefaultCloseOperation (JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add (new vis gui());
        frame.pack();
        frame.setVisible (true);
    }
}
