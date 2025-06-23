set width=80.
set highres off.

COMMENT data file must first have date-string removed, and blank lines removed.
data list file='hw1ratings.dat' free
  / r1 to r40 time .

compute s12  = mean(  r1, r11, r21, r31 )   .
compute s13  = mean(  r2, r12, r22, r32 )   .
compute s14  = mean(  r3, r13, r23, r33 )   .
compute s15  = mean(  r4, r14, r24, r34 )   .
compute s23  = mean(  r5, r15, r25, r35 )   .
compute s24  = mean(  r6, r16, r26, r36 )   .
compute s25  = mean(  r7, r17, r27, r37 )   .
compute s34  = mean(  r8, r18, r28, r38 )   .
compute s35  = mean(  r9, r19, r29, r39 )   .
compute s45  = mean( r10, r20, r30, r40 )   .

COMMENT When did people do the exercise?
COMMENT Increment of 86400 seconds is 24 hours
COMMENT frequencies var=time
COMMENT  /barchart inc(86400) .

descriptives var = s12 s13 s14 s15 s23 s24 s25 s34 s35 s45 
 / statistics = mean variance .



ttest pairs = s34 s45 .
COMMENT Tests of equal-overlap pairs:
COMMENT These are planned comparisons.
COMMENT DK vs KS

ttest pairs = s15 s35 .
COMMENT Tests of equal-overlap pairs:
COMMENT These are planned comparisons.
COMMENT AS vs DS

ttest pairs = s12 s25 .
COMMENT Tests of equal-overlap pairs:
COMMENT These are planned comparisons.
COMMENT AB vs BS


ttest pairs = s24 s14 .
COMMENT Tests of selected non-monotonicities:
COMMENT These are post-hoc tests.
COMMENT BK vs AK

ttest pairs = s13 s25 .
COMMENT Tests of selected non-monotonicities:
COMMENT These are post-hoc tests.
COMMENT AD vs BS
