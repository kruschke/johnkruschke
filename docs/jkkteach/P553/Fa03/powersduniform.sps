INPUT PROGRAM .
  LOOP #I = 1 TO 10000 .                    /* Draw 10000 samples.              */
    DO REPEAT RESPONSE = R1 TO R4 .         /* Sample size N = 4.               */
      COMPUTE RESPONSE = UNIFORM(1) - 0.5 . /* Population is uniform [-0.5,0.5] */
    END REPEAT .
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

/* Make a histogram of just the first score in each sample,       */
/* just to see that the scores really look uniformly distributed. */ 
IGRAPH
 /X1 = VAR(R1) TYPE = SCALE TITLE = 'Sample Score'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample Score'
 /SUBTITLE = '10000 sample scores from Uniform Population [-0.5,0.5]'
 /X1LENGTH = 3.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(R1) MIN = -1.1 MAX = 1.1
 /SCALERANGE = $count MIN = 0.0 MAX = 600.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .

COMPUTE SAMPSD = SD(R1 TO R4) .
EXECUTE .

IGRAPH
 /X1 = VAR(SAMPSD) TYPE = SCALE TITLE = 'Sample SD'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample SD'
 /SUBTITLE = '10000 sample SDs from Uniform Population [-0.5,0.5]'
 /X1LENGTH = 3.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(SAMPSD) MIN = 0.0 MAX = 1.1
 /SCALERANGE = $count MIN = 0.0 MAX = 1000.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .

FREQUENCIES VARIABLES = sampsd
 /FORMAT = NOTABLE
 /HISTOGRAM = NORMAL
 /STATISTICS = MEAN STDDEV
 /PERCENTILES = 2.5 5.0 95.0 97.5 .
EXECUTE .

/* ************************************************************** */

INPUT PROGRAM .
  LOOP #I = 1 TO 10000 .
    DO REPEAT RESPONSE = R1 TO R4 .
      COMPUTE RESPONSE = UNIFORM(2) - 1.0 .  /* Uniform population [-1.0,1.0] */
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
 /SUBTITLE = '10000 sample scores from Uniform Population [-1.0,1.0]'
 /X1LENGTH = 3.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(R1) MIN = -1.1 MAX = 1.1
 /SCALERANGE = $count MIN = 0.0 MAX = 600.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .

COMPUTE SAMPSD = SD(R1 TO R4) .
EXECUTE .

IGRAPH
 /X1 = VAR(SAMPSD) TYPE = SCALE TITLE = 'Sample SD'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of Sample SD'
 /SUBTITLE = '10000 sample SDs from Uniform Population [-1.0,1.0]'
 /X1LENGTH = 3.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(SAMPSD) MIN = 0.0 MAX = 1.1
 /SCALERANGE = $count MIN = 0.0 MAX = 1000.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .

FREQUENCIES VARIABLES = sampsd
 /FORMAT = NOTABLE
 /HISTOGRAM = NORMAL
 /STATISTICS = MEAN STDDEV
 /PERCENTILES 10 20 30 40 50 60 70 80 90.

EXECUTE .
