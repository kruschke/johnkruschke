
COMMENT  For lab activity that generates F sampling distribution
COMMENT    http://www.indiana.edu/~jkkteach/P553/sampleF.html
COMMENT  Run this on Unix by the command:
COMMENT    spss -m < sampleF.sps > sampleF.lst
COMMENT  Strip out just the F-ratios by then typing:
COMMENT    grep Between sampleF.lst > sampleF.grep

set highres off .
set width = 80 .
set length = 54 .

data list free
 / group s1 to s10 .
begin data
 1   4  7  7  5 10  6  8  4  9  8
 1   7  7 11  9 11  4  6  9 12 11
 1   9  4  7 12  8  7  7 11  2 11
 2   6 10  5  7  9  6  4 11  5  7
 2   7  8  9  9  8  4  4  3  8  8
 2   5  9  9  9 10  7  7  7  5  7
 3   8  5  8  6  7  5  2  7  8  7
 3   7  5  7  3  6  7  4 10  6  7
 3   8  4  9 11  5  7  6  8  7  5
end data .

oneway s1 to s10 by group(1,3) .
