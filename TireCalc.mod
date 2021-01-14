MODULE TireCalc;

FROM SRealIO  IMPORT WriteReal;
FROM STextIO  IMPORT WriteLn, WriteString;
FROM SWholeIO IMPORT ReadCard;
FROM Tire     IMPORT RollingDiameter;

VAR
     currentwidth, currentaspect, currentdiameter          : CARDINAL;
     comparisonwidth, comparisonaspect, comparisondiameter : CARDINAL;
     errorpercent, indicatedmph, mpherror                  : REAL;
     current, comparison                                   : REAL;

BEGIN
     InputValue("Current Tire Width (mm): ", currentwidth);
     InputValue("Current Tire Aspect Ratio (whole number): ", currentaspect);
     InputValue("Current Wheel Diameter (in): ", currentdiameter);
     InputValue("Comparison Tire Width (mm): ", comparisonwidth);
     InputValue("Comparison Tire Aspect Ratio (whole number): ", comparisonaspect);
     InputValue("Comparison Wheel Diameter (in): ", comparisondiameter);
     current := RollingDiameter(currentwidth, currentaspect, currentdiameter);
     comparison := RollingDiameter(comparisonwidth, comparisonaspect, comparisondiameter);
     errorpercent := 1 - (comparison / current);
     indicatedmph := (60 + (60 * errorpercent));
     mpherror := - (60 - indicatedmph);
     WriteLn;
     WriteString("Speedometer error of ");
     WriteReal(errorpercent, 10);
     WriteString(" %");
     WriteLn;
     WriteString("Indicated ");
     WriteReal(indicatedmph, 10);
     WriteString(" MPH for a difference of ");
     WriteReal(mpherror, 10);
     WriteString(" MPH);
END TireCalc.


PROCEDURE InputValue (output : ARRAY OF CHAR, VAR input : CARDINAL);

BEGIN
     WriteString(output);
     ReadCard(input);
     WriteLn;
     RETURN
END InputValue;
