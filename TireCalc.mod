MODULE TireCalc;

FROM SRealIO  IMPORT WriteFixed;
FROM STextIO  IMPORT SkipLine, WriteLn, WriteString;
FROM SWholeIO IMPORT ReadCard;
FROM Tire     IMPORT RollingDiameter;

VAR
     currentwidth, currentaspect, currentdiameter          : CARDINAL;
     comparisonwidth, comparisonaspect, comparisondiameter : CARDINAL;
     errorpercent, indicatedmph, mpherror                  : REAL;
     current, comparison                                   : REAL;

PROCEDURE InputValue (output : ARRAY OF CHAR; VAR input : CARDINAL);

BEGIN
     WriteString(output);
     ReadCard(input);
     SkipLine;
     WriteLn;
END InputValue;

BEGIN
     InputValue("Current Tire Width (mm): ", currentwidth);
     InputValue("Current Tire Aspect Ratio (whole number): ", currentaspect);
     InputValue("Current Wheel Diameter (in): ", currentdiameter);
     InputValue("Comparison Tire Width (mm): ", comparisonwidth);
     InputValue("Comparison Tire Aspect Ratio (whole number): ", comparisonaspect);
     InputValue("Comparison Wheel Diameter (in): ", comparisondiameter);
     current := RollingDiameter(currentwidth, currentaspect, currentdiameter);
     comparison := RollingDiameter(comparisonwidth, comparisonaspect, comparisondiameter);
     errorpercent := 1.0 - (current / comparison);
     indicatedmph := (60.0 + (60.0 * errorpercent));
     mpherror := - (60.0 - indicatedmph);
     WriteLn;
     WriteString("Speedometer error of ");
     WriteFixed(errorpercent * 100.0, 2, 6);
     WriteString(" %");
     WriteLn;
     WriteString("Indicated ");
     WriteFixed(indicatedmph, 2, 6);
     WriteString(" MPH for a difference of ");
     WriteFixed(mpherror, 2, 6);
     WriteString(" MPH");
END TireCalc.
