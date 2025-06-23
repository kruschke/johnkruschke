INPUT PROGRAM .
  LOOP #I = 1 TO 3000 .
    DO REPEAT RESPONSE = R1 TO R3 .
      COMPUTE RESPONSE = NORMAL(1.0) .
    END REPEAT .
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

/* S_M is sample mean. */
COMPUTE S_M = MEAN(R1 TO R3) .
/* S_V_N is sample variance when dividing by N (=3). */
COMPUTE S_V_N   = ( (R1-S_M)**2 +(R2-S_M)**2 +(R3-S_M)**2 )/3 .
/* S_V_NMO is sample variance when dividing by N-1 (=3-1=2). */
COMPUTE S_V_NMO = ( (R1-S_M)**2 +(R2-S_M)**2 +(R3-S_M)**2 )/2 .
/* S_SD is sample standard deviation, using N-1. */
COMPUTE S_SD    = SQRT(S_V_NMO) .
COMPUTE S_Z = ( S_M - 0.0 ) / ( 1.0/SQRT(3)) .
COMPUTE S_T = ( S_M - 0.0 ) / (S_SD/SQRT(3)) .

FREQUENCIES VARIABLES = R1  S_V_N  S_V_NMO  S_Z  S_T
 /FORMAT = NOTABLE
 /HISTOGRAM = NORMAL
 /STATISTICS = MEAN STDDEV 
 /PERCENTILES = 2.5 5.0 95.0 97.5 .

IGRAPH
 /X1 = VAR(S_Z) TYPE = SCALE TITLE = 'Sample Z-score'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample Z-score'
 /SUBTITLE = '3000 samples of N=3; population Normal M=0 SD=1'
 /X1LENGTH = 5.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(S_Z) MIN = -5.0 MAX = 5.0
 /SCALERANGE = $count MIN = 0.0 MAX = 300.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .

IGRAPH
 /X1 = VAR(S_T) TYPE = SCALE TITLE = 'Sample T-score'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample T-score'
 /SUBTITLE = '3000 samples of N=3; population Normal M=0 SD=1'
 /X1LENGTH = 5.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(S_T) MIN = -5.0 MAX = 5.0
 /SCALERANGE = $count MIN = 0.0 MAX = 300.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .

EXECUTE .
