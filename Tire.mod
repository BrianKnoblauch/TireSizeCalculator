IMPLEMENTATION MODULE Tire;

PROCEDURE RollingDiameter (width, aspect, diameter : CARDINAL) : REAL;

VAR
     height, overall : REAL;

BEGIN
     height := FLOAT(width) * FLOAT(aspect);
     overall := (height / 2540.0 * 2.0) + FLOAT(diameter);
     RETURN overall
END RollingDiameter;

END Tire.
