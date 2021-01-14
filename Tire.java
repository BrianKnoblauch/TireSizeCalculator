/*
 * Tire.java
 *
 * Created on October 10, 2007, 7:03 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package tiresizecalculator;

import java.lang.Math;

/**
 *
 * @author Brian
 */
public class Tire {
    int width;
    double aspect;
    int diameter;
    
    /** Creates a new instance of Tire */
    public Tire(int width, int aspect, int diameter) {
        this.width=width;
        this.aspect=(float)aspect/100;
        this.diameter=diameter;
    }
    
    public double getRollingDiameter(){
        double height, overall;
                
        height=width*aspect;
        overall=((height*2)+(diameter*25.4))*Math.PI;
        return overall;
    }
    
}
