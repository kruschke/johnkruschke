INPUT PROGRAM .
  LOOP #I = 1 TO 8000 .                 /* 8000 samples              */
    DO REPEAT RESPONSE = R1 TO R3 .     /* Sample size 3             */
      COMPUTE RESPONSE = NORMAL(3.5) .  /* Normal population, SD=3.5 */ 
    END REPEAT .
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

COMPUTE SAMPLEM = MEAN(R1 TO R3) .
COMPUTE SAMPLEZ = ( SAMPLEM - 0.0 ) / (3.5/SQRT(3.0)) .
EXECUTE .

IGRAPH
 /X1 = VAR(samplem) TYPE = SCALE TITLE = 'Sample Mean'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample Mean'
 /SUBTITLE = '8000 samples of N=3 from Normal Population with M=0 SD=3.5'
 /X1LENGTH = 5.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(samplem) MIN = -4.0 MAX = 4.0
 /SCALERANGE = $count MIN = 0.0 MAX = 500.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .

IGRAPH
 /X1 = VAR(samplez) TYPE = SCALE TITLE = 'Sample Z-score'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample Z-score'
 /SUBTITLE = '8000 samples of N=3 from Normal Population with M=0 SD=3.5'
 /X1LENGTH = 5.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(samplez) MIN = -4.0 MAX = 4.0
 /SCALERANGE = $count MIN = 0.0 MAX = 500.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .

FREQUENCIES VARIABLES = samplez
 /FORMAT = NOTABLE
 /HISTOGRAM = NORMAL
 /STATISTICS = MEAN STDDEV
 /PERCENTILES = 2.5 5.0 95.0 97.5 .

EXECUTE .
