/*
 * Main.java
 *
 * Created on March 25, 2007, 8:48 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package tiresizecalculator;

import java.io.*;
import tiresizecalculator.Tire;

/**
 *
 * @author Brian
 */
public class Main {
    
    /** Creates a new instance of Main */
    public Main() {
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        double ErrorPercent, IndicatedMPH, MPHError;
        int currentwidth, comparisonwidth, currentaspect, comparisonaspect, currentdiameter, comparisondiameter;
            
        currentwidth=inputValue("Current Tire Width (mm): ");     
        currentaspect=inputValue("Current Tire Aspect Ratio (whole number): ");
        currentdiameter=inputValue("Current Wheel Diameter (in): ");
        comparisonwidth=inputValue("Comparison Tire Width (mm): ");
        comparisonaspect=inputValue("Comparison Tire Aspect Ratio (whole number): ");
        comparisondiameter=inputValue("Comparison Wheel Diameter (in): ");
        Tire current = new Tire(currentwidth, currentaspect, currentdiameter);
        Tire comparison = new Tire(comparisonwidth, comparisonaspect, comparisondiameter);
        ErrorPercent = 1-(comparison.getRollingDiameter()/current.getRollingDiameter());
        IndicatedMPH = (60+(60*ErrorPercent));
        MPHError = -(60-IndicatedMPH);
        System.out.println("Speedometer error of "+ErrorPercent+" %");
        System.out.println("Indicated "+IndicatedMPH+" MPH for a difference of "+MPHError+" MPH");
    }
    
    private static int inputValue(String output){
        String line = null;
        int val=0;
        
        System.out.print(output);
        try {
            BufferedReader is = new BufferedReader(new InputStreamReader(System.in));
            line = is.readLine();
            val = Integer.parseInt(line);
        } catch (NumberFormatException ex) {
            System.err.println("Not a valid number: " + line);
        } catch (IOException e) {
            System.err.println("Unexpected IO ERROR: " + e);
        }
        return val;
    }
    
}
