/* FILL IN AS INSTRUCTED. */

/* YOUR NAME AND ID:   */

/* Generate random scores from null hypothesis population. */
INPUT PROGRAM .
  LOOP #I = 1 TO 10000 .
    DO REPEAT RESPONSE = A1B1_1 TO A1B1_4 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,1.0) .
    END REPEAT .
    DO REPEAT RESPONSE = A1B2_1 TO A1B2_4 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,1.0) .
    END REPEAT .
    DO REPEAT RESPONSE = A2B1_1 TO A2B1_4 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,1.0) .
    END REPEAT .
    DO REPEAT RESPONSE = A2B2_1 TO A2B2_4 .
      COMPUTE RESPONSE = RV.NORMAL(0.0,1.0) .
    END REPEAT .
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

/* Compute cell and marginal means. */
compute M11 = mean( A1B1_1 to A1B1_4 ) .
compute M12 = mean( A1B2_1 to A1B2_4 ) .
compute M21 = mean( A2B1_1 to A2B1_4 ) .
compute M22 = /* REPLACE WITH PROPER FORMULA */ .
compute Mdotdot = ( M11 + M12 + M21 + M22 ) / 4 .  /* assumes equal n's */
compute M1dot = ( M11 + M12 ) / 2 .
compute M2dot = ( M21 + M22 ) / 2 .
compute Mdot1 = ( M11 + M21 ) / 2 .
compute Mdot2 = /* REPLACE WITH PROPER FORMULA */ .

/* Compute effects. */
compute alpha1 = M1dot - Mdotdot .
compute alpha2 = M2dot - Mdotdot .
compute beta1 = Mdot1 - Mdotdot .
compute beta2 =  /* REPLACE WITH PROPER FORMULA */ .
compute alphabeta11 = M11 - ( Mdotdot + alpha1 + beta1 ) .
compute alphabeta12 = M12 - ( Mdotdot + alpha1 + beta2 ) .
compute alphabeta21 = M21 - ( Mdotdot + alpha2 + beta1 ) .
compute alphabeta22 =  /* REPLACE WITH PROPER FORMULA */ .

/* compute mean squared effects. */
compute msalpha = ( alpha1 **2 + alpha2 **2 ) / 2 .
compute msbeta =  /* REPLACE WITH PROPER FORMULA */ .
compute msalphabeta = ( alphabeta11 **2 +  alphabeta12 **2 + 
                  alphabeta21 **2 +  alphabeta22 **2 ) / 4 .

/* ANSWER THIS HERE, BASED ON THE OUTPUT OF THE CORRELATIONS 
COMMAND BELOW. SUPPOSE THE NULL HYPOTHESIS IS TRUE. YOU RUN
AN EXPERIMENT AND GET A FALSE ALARM REGARDING THE MAIN EFFECT
OF A. DOES THAT INCREASE YOUR CHANCES OF GETTING A FALSE
ALARM REGARDING THE MAIN EFFECT OF B? DOES IT INCREASE YOUR
CHANCES OF GETTING A FALSE ALARM REGARDING THE INTERACTION? */ 

/* Show correlations of the three effects. */
CORRELATIONS
  /VARIABLES = msalpha msbeta msalphabeta
  /PRINT=TWOTAIL NOSIG
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE .

/* Graph the effects, making the correlations visible in scatterplot. */
IGRAPH 
  /VIEWNAME='Scatterplot' 
  /X1 = VAR(msalpha) TYPE = SCALE 
  /Y = VAR(msbeta) TYPE = SCALE 
  /COORDINATE = VERTICAL  
  /FITLINE METHOD = REGRESSION LINEAR  LINE = TOTAL  SPIKE = OFF
  /TITLE='Mean squared main effects across samples'
  /X1LENGTH=5.0
  /YLENGTH=5.0
  /X2LENGTH=5.0
  /CHARTLOOK='NONE'
  /SCATTER COINCIDENT = NONE.

/* MAKE A SCATTERPLOT LIKE THE ONE ABOVE, THIS TIME OF MSALPHA 
AND MSALPHABETA. CHANGE THE TITLE APPROPRIATELY. */


EXECUTE.
