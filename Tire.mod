IMPLEMENTATION MODULE Tire;

FROM RealMath IMPORT pi;

PROCEDURE RollingDiameter (width, aspect, diameter : REAL) : REAL;

VAR
     height, overall : REAL;

BEGIN
     height := width * (aspect / 100);
     overall := ((height * 2) + (diameter * 25.4)) * pi;
     RETURN overall
END RollingDiameter.
