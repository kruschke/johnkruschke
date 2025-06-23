
SET Printback=On .  /* Syntax commands are diplayed in output log. */ 

/* Generates randomly sampled data. */
INPUT PROGRAM .
  LOOP #I = 1 TO 32 .
    COMPUTE GROUP = 2 .
    COMPUTE area = NORMAL(1.0) + 5.0 .
    COMPUTE radius = sqrt( area / (4.0*3.1415926) ) .
    COMPUTE volume = area**1.5 / (6.0*sqrt(3.1415926) ) .
    END CASE .
  END LOOP .
  LOOP #I = 1 TO 28 .
    COMPUTE GROUP = 1 .
    COMPUTE area = NORMAL(1.0) + 5.4 .
    COMPUTE radius = sqrt( area / (4.0*3.1415926) ) .
    COMPUTE volume = area**1.5 / (6.0*sqrt(3.1415926)) .
    END CASE .
  END LOOP .
  END FILE .
END INPUT PROGRAM .
EXECUTE .

/* Determines the ranks of the scores. */
RANK
  VARIABLES=area radius volume  (A) /RANK /PRINT=YES
  /TIES=MEAN .
EXECUTE .

/* Adjusts the format of the variables for printing. */
FORMATS group (F1.0) .
FORMATS area (F5.3) .
FORMATS radius (F5.3) .
FORMATS volume (F5.3) .
FORMATS Rarea (F3.0) .
FORMATS Rradius (F3.0) .
FORMATS Rvolume (F3.0) .
EXECUTE .

/* Shows a table of the data. */
SUMMARIZE
  /TABLES=group area radius volume rarea rradius rvolume
  /FORMAT=LIST NOCASENUM NOTOTAL
  /TITLE='Case Summaries'
  /MISSING=VARIABLE
  /CELLS=NONE.
EXECUTE .

/* Conducts t-tests on the different scores. */
T-TEST
  GROUPS=group(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=area radius volume rarea
  /CRITERIA=CIN(.95) .
EXECUTE .

/* Histograms of the different scores, by group. */

IGRAPH 
  /VIEWNAME='Histogram' 
  /X1=VAR(area) TYPE=SCALE 
  /Y=$count 
  /COORDINATE=VERTICAL 
  /PANEL VAR(GROUP) 
  /YLENGTH=5.2 
  /X1LENGTH=6.5 
  /CHARTLOOK='NONE' 
  /CATORDER VAR(GROUP) (ASCENDING VALUES OMITEMPTY) 
  /Histogram SHAPE=HISTOGRAM CURVE=OFF X1INTERVAL AUTO X1START=0.
EXECUTE .
IGRAPH 
  /VIEWNAME='Histogram' 
  /X1=VAR(radius) TYPE=SCALE 
  /Y=$count 
  /COORDINATE=VERTICAL 
  /PANEL VAR(GROUP) 
  /YLENGTH=5.2 
  /X1LENGTH=6.5 
  /CHARTLOOK='NONE' 
  /CATORDER VAR(GROUP) (ASCENDING VALUES OMITEMPTY) 
  /Histogram SHAPE=HISTOGRAM CURVE=OFF X1INTERVAL AUTO X1START=0.
EXECUTE .
IGRAPH 
  /VIEWNAME='Histogram' 
  /X1=VAR(volume) TYPE=SCALE 
  /Y=$count 
  /COORDINATE=VERTICAL 
  /PANEL VAR(GROUP) 
  /YLENGTH=5.2 
  /X1LENGTH=6.5 
  /CHARTLOOK='NONE' 
  /CATORDER VAR(GROUP) (ASCENDING VALUES OMITEMPTY) 
  /Histogram SHAPE=HISTOGRAM CURVE=OFF X1INTERVAL AUTO X1START=0.
EXECUTE .
IGRAPH 
  /VIEWNAME='Histogram' 
  /X1=VAR(Rarea) TYPE=SCALE 
  /Y=$count 
  /COORDINATE=VERTICAL 
  /PANEL VAR(GROUP) 
  /YLENGTH=5.2 
  /X1LENGTH=6.5 
  /CHARTLOOK='NONE' 
  /CATORDER VAR(GROUP) (ASCENDING VALUES OMITEMPTY) 
  /Histogram SHAPE=HISTOGRAM CURVE=OFF X1INTERVAL AUTO X1START=0.
EXECUTE .

/* Descriptions, including skewness and kurtosis, of the groups. */
USE ALL.
COMPUTE filter_$=(group = 1).
VARIABLE LABEL filter_$ 'group = 1 (FILTER)'.
VALUE LABELS filter_$  0 'Not Selected' 1 'Selected'.
FORMAT filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE .

DESCRIPTIVES
  VARIABLES=area radius volume rarea
  /STATISTICS=MEAN STDDEV KURTOSIS SKEWNESS .
EXECUTE .

USE ALL.
COMPUTE filter_$=(group = 2).
VARIABLE LABEL filter_$ 'group = 2 (FILTER)'.
VALUE LABELS filter_$  0 'Not Selected' 1 'Selected'.
FORMAT filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE .

DESCRIPTIVES
  VARIABLES=area radius volume rarea
  /STATISTICS=MEAN STDDEV KURTOSIS SKEWNESS .
EXECUTE .

FILTER OFF.
USE ALL.
EXECUTE .

/* Mann-Whitney and Wilcoxon rank sum test. */
NPAR TESTS
  /M-W= area radius volume rarea   BY group(1 2)
  /MISSING ANALYSIS.
EXECUTE .
