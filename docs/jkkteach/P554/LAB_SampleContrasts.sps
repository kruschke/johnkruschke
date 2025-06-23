/* Lab exercise. Fill in the missing sections and run. */

/* Generate random scores from null hypothesis population. */
INPUT PROGRAM .
  LOOP #I = 1 TO 1000 .
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

/* Compute three contrasts. */
compute psi_1 = (1)*mean(A1 to A3) + (-1)*mean(B1 to B3) + (0)*mean(C1 to C3) .
compute psi_2 = /* Type in formula for M1-M3 */ . 
compute psi_3 = /* Type in formula for (M1+M2)/2 - M3 */ . 

/* Attach meaningful labels to the three contrast variables. */
variable labels 
  psi_1 'M1-M2' 
  psi_2 'M1-M3'  
  psi_3 '(M1+M2)/2-M3' .

FREQUENCIES VARIABLES = psi_1 psi_2 psi_3
 /FORMAT = NOTABLE
 /PERCENTILES = 95 97.5  .

/* Show correlations of the three contrasts. */
CORRELATIONS
  /VARIABLES=psi_1 psi_2 psi_3
  /PRINT=TWOTAIL NOSIG
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE .

/* Graph the contrasts, making the correlations visible in scatterplot. */
IGRAPH 
  /VIEWNAME='Scatterplot' 
  /X1 = VAR(psi_3) TYPE = SCALE 
  /Y = VAR(psi_1) TYPE = SCALE 
  /COORDINATE = VERTICAL  
  /FITLINE METHOD = REGRESSION LINEAR  LINE = TOTAL  SPIKE = OFF
  /TITLE='Contrasts Psi1 and Psi3 across samples'
  /X1LENGTH=5.0
  /YLENGTH=5.0
  /X2LENGTH=5.0
  /CHARTLOOK='NONE'
  /SCATTER COINCIDENT = NONE.


/* Copy and paste the above code for a scatterplot, but this time plot  */
/* psi_2 and psi_3. Change the title appropriately.                               */


EXECUTE.
