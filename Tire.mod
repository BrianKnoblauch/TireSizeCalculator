IMPLEMENTATION MODULE Tire;

FROM RealMath IMPORT pi;

PROCEDURE RollingDiameter (width, aspect, diameter : CARDINAL) : REAL;

VAR
     height, overall : REAL;

BEGIN
     height := FLOAT(width) * (FLOAT(aspect) / 100.0);
     overall := ((height * 2.0) + (FLOAT(diameter) * 25.4)) * pi;
     RETURN overall
END RollingDiameter;

END Tire.
