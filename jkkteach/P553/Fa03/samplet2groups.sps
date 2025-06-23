/* P553 Adv. Stats. in Psych., Prof. Kruschke */.

SET Printback=On .  /* Syntax commands are diplayed in output log. */ 

/* ***************************************************************** */ .

INPUT PROGRAM .
  LOOP #I = 1 TO 5000 .
    DO REPEAT RESPONSE = A1 TO A4 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,1.0) .
    END REPEAT .
    DO REPEAT RESPONSE = B1 TO B4 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,1.0) .
    END REPEAT .
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

COMPUTE N1 = 4 .
COMPUTE M1 = MEAN(A1 TO A4) .
COMPUTE SS1 = ((SD(A1 TO A4))**2)*(N1-1) . /* SD is sqrt(SS/(N-1)) */

COMPUTE N2 = 4 .
COMPUTE M2 = MEAN(B1 TO B4) .
COMPUTE SS2 = ((SD(B1 TO B4))**2)*(N2-1) .

COMPUTE T_P = (M1-M2) / SQRT( ((SS1+SS2)/(N1-1+N2-1))*((1/N1)+(1/N2)) ) .
COMPUTE T_U = (M1-M2) / SQRT( (SS1/(N1-1))/N1 + (SS2/(N2-1))/N2 ) .

FREQUENCIES VARIABLES = T_P
 /FORMAT = NOTABLE
 /STATISTICS = MEAN STDDEV 
 /PERCENTILES = 2.5 5.0 95.0 97.5 .

IGRAPH
 /X1 = VAR(T_P) TYPE = SCALE TITLE = 'Sample T-score (pooled SS)'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample T-score, Equal Variance, Equal Sample Sizes'
 /SUBTITLE = '5000 samples of N1=4 N2=4 from normal populations M1=M2=0 SD1=1.0 SD2=1.0'
 /X1LENGTH = 5.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(T_P) MIN = -5.0 MAX = 5.0
 /SCALERANGE = $count MIN = 0.0 MAX = 500.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .
EXECUTE.

/* ***************************************************************** */ .

INPUT PROGRAM .
  LOOP #I = 1 TO 5000 .
    DO REPEAT RESPONSE = A1 TO A2 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,1.0) .
    END REPEAT .
    DO REPEAT RESPONSE = B1 TO B6 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,1.0) .
    END REPEAT .
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

COMPUTE N1 = 2 .
COMPUTE M1 = MEAN(A1 TO A2) .
COMPUTE SS1 = ((SD(A1 TO A2))**2)*(N1-1) . /* SD is sqrt(SS/(N-1)) */

COMPUTE N2 = 6 .
COMPUTE M2 = MEAN(B1 TO B6) .
COMPUTE SS2 = ((SD(B1 TO B6))**2)*(N2-1) .

COMPUTE T_P = (M1-M2) / SQRT( ((SS1+SS2)/(N1-1+N2-1))*((1/N1)+(1/N2)) ) .
COMPUTE T_U = (M1-M2) / SQRT( (SS1/(N1-1))/N1 + (SS2/(N2-1))/N2 ) .

FREQUENCIES VARIABLES = T_P
 /FORMAT = NOTABLE
 /STATISTICS = MEAN STDDEV 
 /PERCENTILES = 2.5 5.0 95.0 97.5 .

IGRAPH
 /X1 = VAR(T_P) TYPE = SCALE TITLE = 'Sample T-score (pooled SS)'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample T-score, Equal Variance, Unequal Sample Sizes'
 /SUBTITLE = '5000 samples of N1=2 N2=6 from normal populations M1=M2=0 SD1=1.0 SD2=1.0'
 /X1LENGTH = 5.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(T_P) MIN = -5.0 MAX = 5.0
 /SCALERANGE = $count MIN = 0.0 MAX = 500.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .
EXECUTE.

/* ***************************************************************** */ .


INPUT PROGRAM .
  LOOP #I = 1 TO 5000 .
    DO REPEAT RESPONSE = A1 TO A4 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,2.0) .
    END REPEAT .
    DO REPEAT RESPONSE = B1 TO B4 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,0.5) .
    END REPEAT .
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

COMPUTE N1 = 4 .
COMPUTE M1 = MEAN(A1 TO A4) .
COMPUTE SS1 = ((SD(A1 TO A4))**2)*(N1-1) .

COMPUTE N2 = 4 .
COMPUTE M2 = MEAN(B1 TO B4) .
COMPUTE SS2 = ((SD(B1 TO B4))**2)*(N2-1) .

COMPUTE T_P = (M1-M2) / SQRT( ((SS1+SS2)/(N1-1+N2-1))*((1/N1)+(1/N2)) ) .
COMPUTE T_U = (M1-M2) / SQRT( (SS1/(N1-1))/N1 + (SS2/(N2-1))/N2 ) .

FREQUENCIES VARIABLES = T_U
 /FORMAT = NOTABLE
 /STATISTICS = MEAN STDDEV 
 /PERCENTILES = 2.5 5.0 95.0 97.5 .

IGRAPH
 /X1 = VAR(T_U) TYPE = SCALE TITLE = 'Sample T-score (unpooled SS)'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample T-score, Unequal Variance, Equal Sample Sizes'
 /SUBTITLE = '5000 samples of N1=4 N2=4 from normal populations M1=M2=0 SD1=2.0 SD2=0.5'
 /X1LENGTH = 5.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(T_U) MIN = -5.0 MAX = 5.0
 /SCALERANGE = $count MIN = 0.0 MAX = 500.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .
EXECUTE.

/* ***************************************************************** */ .

INPUT PROGRAM .
  LOOP #I = 1 TO 5000 .
    DO REPEAT RESPONSE = A1 TO A2 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,2.0) .
    END REPEAT .
    DO REPEAT RESPONSE = B1 TO B6 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,0.5) .
    END REPEAT .
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

COMPUTE N1 = 2 .
COMPUTE M1 = MEAN(A1 TO A2) .
COMPUTE SS1 = ((SD(A1 TO A2))**2)*(N1-1) .

COMPUTE N2 = 6 .
COMPUTE M2 = MEAN(B1 TO B6) .
COMPUTE SS2 = ((SD(B1 TO B6))**2)*(N2-1) .

COMPUTE T_P = (M1-M2) / SQRT( ((SS1+SS2)/(N1-1+N2-1))*((1/N1)+(1/N2)) ) .
COMPUTE T_U = (M1-M2) / SQRT( (SS1/(N1-1))/N1 + (SS2/(N2-1))/N2 ) .

FREQUENCIES VARIABLES = T_U
 /FORMAT = NOTABLE
 /STATISTICS = MEAN STDDEV 
 /PERCENTILES = 2.5 5.0 95.0 97.5 .

IGRAPH
 /X1 = VAR(T_U) TYPE = SCALE TITLE = 'Sample T-score (unpooled SS)'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample T-score, Unequal Variance, Unequal Sample Sizes'
 /SUBTITLE = '5000 samples of N1=2 N2=6 from normal populations M1=M2=0 SD1=2.0 SD2=0.5'
 /X1LENGTH = 5.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(T_U) MIN = -5.0 MAX = 5.0
 /SCALERANGE = $count MIN = 0.0 MAX = 500.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .
EXECUTE.

