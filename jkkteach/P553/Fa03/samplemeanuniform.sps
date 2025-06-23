INPUT PROGRAM .
  LOOP #I = 1 TO 4000 .               /* Get 4000 samples          */
    DO REPEAT RESPONSE = R1 TO R1 .   /* Sample size 1             */ 
      COMPUTE RESPONSE = UNIFORM(1) . /* From a uniform population */
    END REPEAT .
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

IGRAPH
 /X1 = VAR(R1) TYPE = SCALE TITLE = 'Sample Score'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample Score'
 /SUBTITLE = '4000 scores; population Uniform [0,1]'
 /X1LENGTH = 5.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(R1) MIN = 0.0 MAX = 1.0
 /SCALERANGE = $count MIN = 0.0 MAX = 400.0
 /HISTOGRAM  SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .

FREQUENCIES VARIABLES = R1
 /FORMAT = NOTABLE
 /HISTOGRAM = NORMAL
 /STATISTICS = MEAN STDDEV .

EXECUTE .

* ------------------------------------------------------------------- .

INPUT PROGRAM .
  LOOP #I = 1 TO 4000 .               /* Get 4000 samples          */
    DO REPEAT RESPONSE = R1 TO R4 .   /* Sample size 4             */ 
      COMPUTE RESPONSE = UNIFORM(1) . /* From a uniform population */
    END REPEAT .
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

COMPUTE SAMPMEAN = MEAN(R1 TO R4) .
EXECUTE .

IGRAPH
 /X1 = VAR(sampmean) TYPE = SCALE TITLE = 'Sample Mean'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample Mean'
 /SUBTITLE = '4000 samples of N=4; population Uniform [0,1]'
 /X1LENGTH = 5.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(sampmean) MIN = 0.0 MAX = 1.0
 /SCALERANGE = $count MIN = 0.0 MAX = 400.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .

FREQUENCIES VARIABLES = sampmean
 /FORMAT = NOTABLE
 /HISTOGRAM = NORMAL
 /STATISTICS = MEAN STDDEV .

EXECUTE .

* ------------------------------------------------------------------- .

INPUT PROGRAM .
  LOOP #I = 1 TO 4000 .               /* Get 4000 samples          */
    DO REPEAT RESPONSE = R1 TO R9 .   /* Sample size 9             */ 
      COMPUTE RESPONSE = UNIFORM(1) . /* From a uniform population */
    END REPEAT .
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

COMPUTE SAMPMEAN = MEAN(R1 TO R9) .
EXECUTE .

IGRAPH
 /X1 = VAR(sampmean) TYPE = SCALE TITLE = 'Sample Mean'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample Mean'
 /SUBTITLE = '4000 samples of N=9; population Uniform [0,1]'
 /X1LENGTH = 5.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(sampmean) MIN = 0.0 MAX = 1.0
 /SCALERANGE = $count MIN = 0.0 MAX = 400.0
 /HISTOGRAM  SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .

FREQUENCIES VARIABLES = sampmean
 /FORMAT = NOTABLE
 /HISTOGRAM = NORMAL
 /STATISTICS = MEAN STDDEV .

EXECUTE .

* ------------------------------------------------------------------- .
