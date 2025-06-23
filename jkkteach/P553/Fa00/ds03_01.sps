
set highres off .
set width = 80 .
set length = 54 .

data list file = ds03_01.dat free
  / group anxiety .

variable labels group "Therapy type" .
value labels group  1 "Control"  2 "Desensitization" .

variable labels anxiety "Increase in Heart Rate" .

examine variables = anxiety by group 
  / plot = boxplot stemleaf histogram npplot .

t-test groups = group 
  / variables = anxiety .

finish .
