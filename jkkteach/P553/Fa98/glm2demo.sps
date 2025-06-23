
COMMENT  Demo of equivalence of 
COMMENT  t-test, oneway anova, regression, and glm
COMMENT  for two-group data.

set highres off .
set width = 80 .
set length = 54 .

data list free
 / group score code1 code2 .
begin data
 0 1.0 0 0
 0 2.0 0 0
 0 3.0 0 0
 1 5.0 0 1
 1 6.0 0 1
 1 7.0 0 1
 2 3.0 1 0
 2 4.0 1 0
 2 5.0 1 0
end data .


plot
 / plot score with group ;
        score with code1 by code2 .

oneway score by group(0,2) 
 / contrast = -1  0  1
 / contrast = -1  1  0 .

manova score by group(0,2)
 / design  group .

regression variables = score, code1, code2
 / dependent = score
 / method = enter .

finish .