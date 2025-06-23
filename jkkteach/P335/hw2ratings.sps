set width=80.
set highres off.

COMMENT data file must first have date-string removed, and blank lines removed.
data list file='hw2ratings.dat' free
  / r1 to r12 time .

COMMENT s1 is training disease A, should be +3
compute s1  = mean( r1 to r2 )   .

COMMENT s2 is training disease B, should be -3
compute s2  = mean( r3 to r4 )   .

COMMENT s3 is blocking cases, should be < 0
compute s3  = mean( r5 to r8 )   .

COMMENT s4 is overshadowing cases, should be > 0
compute s4  = mean( r9 to r12 )  .

COMMENT When did people do the exercise?
COMMENT Increment of 86400 seconds is 24 hours
COMMENT frequencies var=time
COMMENT  /barchart inc(86400) .

COMMENT All subjects
descriptives var = s1 to s4 
 / statistics = mean variance semean 
 / format = serial .
frequencies var = s1 to s4
 / barchart min(-3.0) inc(0.25).
correlation var = s1 to s4 .
regression var = s3, s4
 / dependent = s3 
 / method = enter .
plot
 / title 'Blocking vs. Overshadowing'
 / vertical 'Blocking Mean'
 / horizontal 'Overshadowing Mean'
 / plot s3 with s4 .

COMMENT Select only subjects who learned the training cases
select if ( (s1) GT 1  and  (s2) LT -1 ) .
descriptives var = s1 to s4 
 / statistics = mean variance semean 
 / format = serial .
frequencies var = s1 to s4
 / barchart min(-3.0) inc(0.25).
correlation var = s1 to s4 .
regression var = s3, s4
 / dependent = s3 
 / method = enter .
plot
 / title 'Blocking vs. Overshadowing'
 / vertical 'Blocking Mean'
 / horizontal 'Overshadowing Mean'
 / plot s3 with s4 .



