
COMMENT  Demo of equivalence of 
COMMENT  t-test, oneway anova, regression, and glm
COMMENT  for two-group data.

set highres off .
set width = 80 .
set length = 54 .

data list free
 / group score .
begin data
 0 1
 0 2
 0 3
 1 3
 1 4
 1 5
end data .


plot
 / plot score with group .


t-test groups = group(1,0)
 / variables = score .


COMMENT  Check that t**2 (above) equals F (below)

oneway score by group(0,1) .


COMMENT  Check that r**2 (below) equals SS_B / SS_T (above)

correlations variables = score with group .


COMMENT  Compare fitted regression coefficients (below) with plot (above)

regression variables = score, group
 / dependent = score
 / method = enter .


manova score by group(0,1)
 / design group .

finish .
