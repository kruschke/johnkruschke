/* Sampling distribution of generalized F. */

/* Generate random scores from null hypothesis population. */
INPUT PROGRAM .
  LOOP #I = 1 TO 10000 .
    DO REPEAT RESPONSE = A1 TO A3 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,1.0) .
    END REPEAT .
    DO REPEAT RESPONSE = B1 TO B3 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,1.0) .
    END REPEAT .
    DO REPEAT RESPONSE = C1 TO C3 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,1.0) .
    END REPEAT .
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

/* Determine predictions of full model. */
COMPUTE A1_full = MEAN(A1 TO A3) .
COMPUTE A2_full = MEAN(A1 TO A3) .
COMPUTE A3_full = MEAN(A1 TO A3) .
COMPUTE B1_full = MEAN(B1 TO B3) .
COMPUTE B2_full = MEAN(B1 TO B3) .
COMPUTE B3_full = MEAN(B1 TO B3) .
COMPUTE C1_full = MEAN(C1 TO C3) .
COMPUTE C2_full = MEAN(C1 TO C3) .
COMPUTE C3_full = MEAN(C1 TO C3) .

/* Determine predictions of restricted model. */
COMPUTE A1_restr = (SUM(A1 TO A3)+SUM(B1 TO B3)+SUM(C1 TO C3)) / (3+3+3) .
COMPUTE A2_restr = (SUM(A1 TO A3)+SUM(B1 TO B3)+SUM(C1 TO C3)) / (3+3+3) .
COMPUTE A3_restr = (SUM(A1 TO A3)+SUM(B1 TO B3)+SUM(C1 TO C3)) / (3+3+3) .
COMPUTE B1_restr = (SUM(A1 TO A3)+SUM(B1 TO B3)+SUM(C1 TO C3)) / (3+3+3) .
COMPUTE B2_restr = (SUM(A1 TO A3)+SUM(B1 TO B3)+SUM(C1 TO C3)) / (3+3+3) .
COMPUTE B3_restr = (SUM(A1 TO A3)+SUM(B1 TO B3)+SUM(C1 TO C3)) / (3+3+3) .
COMPUTE C1_restr = (SUM(A1 TO A3)+SUM(B1 TO B3)+SUM(C1 TO C3)) / (3+3+3) .
COMPUTE C2_restr = (SUM(A1 TO A3)+SUM(B1 TO B3)+SUM(C1 TO C3)) / (3+3+3) .
COMPUTE C3_restr = (SUM(A1 TO A3)+SUM(B1 TO B3)+SUM(C1 TO C3)) / (3+3+3) .

/* Compute F ratio. */
COMPUTE E_full = (A1-A1_full)**2+(A2-A2_full)**2+(A3-A3_full)**2+ (B1-B1_full)**2+(B2-B2_full)**2+(B3-B3_full)**2+ (C1-C1_full)**2+(C2-C2_full)**2+(C3-C3_full)**2 .
COMPUTE df_full = (3-1)+(3-1)+(3-1) .
COMPUTE E_restr = (A1-A1_restr)**2+(A2-A2_restr)**2+(A3-A3_restr)**2+ (B1-B1_restr)**2+(B2-B2_restr)**2+(B3-B3_restr)**2+ (C1-C1_restr)**2+(C2-C2_restr)**2+(C3-C3_restr)**2 .
COMPUTE df_restr = (3+3+3 - 1) .
COMPUTE F = ( (E_restr-E_full) / (df_restr-df_full ) ) / ( E_full / df_full ) .


FREQUENCIES VARIABLES = F
 /FORMAT = NOTABLE
 /PERCENTILES = 75 90 95 97.5 99 99.9 .

IGRAPH
 /X1 = VAR(F) TYPE = SCALE TITLE = 'Sample F'
 /Y = $count TITLE = 'Frequency'
 /COORDINATE = VERTICAL  
 /TITLE = 'Histogram of 10,000 Samples of F(2,6)'
 /SUBTITLE = 'N1=N2=N3=3 from normal pop.s M1=0, M2=0, M3=0 SD=1'
 /X1LENGTH = 5.0
 /YLENGTH = 3.0
 /CHARTLOOK = 'C:\Program Files\SPSS\Looks\Grayscale.clo' 
 /SCALERANGE = VAR(F) MIN = 0.0 MAX = 12.0
 /SCALERANGE = $count MIN = 0.0 MAX = 2000.0
 /HISTOGRAM SHAPE = HISTOGRAM CURVE = ON X1INTERVAL AUTO X1START = 0 .
EXECUTE.
