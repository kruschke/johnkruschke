SET Printback=On .  /* Syntax commands are diplayed in output log. */ 

/* Generates randomly sampled data. */
INPUT PROGRAM .
  LOOP #I = 1 TO 30 .
    COMPUTE GROUP = 1 .
    COMPUTE RT = EXP( 2.0*(NORMAL(1.0)) ).
    END CASE .
  END LOOP .
  LOOP #I = 1 TO 30 .
    COMPUTE GROUP = 2 .
    COMPUTE RT = EXP( 2.0*(NORMAL(1.0) + 0.5) ).
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

/* Adjusts the format of the variables for printing. */
FORMATS group (F1.0) .
FORMATS RT (F5.3) .
EXECUTE .

/* Shows a table of the data. */
SUMMARIZE
  /TABLES=group RT 
  /FORMAT=LIST NOCASENUM NOTOTAL
  /TITLE='Case Summaries'
  /MISSING=VARIABLE
  /CELLS=NONE.
EXECUTE .

/* Conducts t-test. */
T-TEST
  GROUPS=group(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=RT
  /CRITERIA=CIN(.95) .
EXECUTE .
