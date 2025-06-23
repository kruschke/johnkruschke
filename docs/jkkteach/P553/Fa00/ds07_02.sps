
set highres off .
set width = 80 .
set length = 54 .

COMMENT data from Lockhart textbook, p.332, Data Set 7.2
COMMENT compare with "worked example" 1 on pp. 332-333

data list file = ds07_02.dat free
  / group latency .

variable labels group "Tranquilizer Type" .
value labels group  1 "Control"  2 "T1"   3 "T2".

variable labels latency "Response Latency" .

examine variables = latency by group 
  / plot = boxplot stemleaf histogram npplot .

oneway latency by group(1,3) 
 / format = labels
 / statistics = descriptives homogeneity
 / contrast -1  1  0
 / contrast -1  0  1
 / contrast  0 -1  1
 / ranges = lsd
 / ranges = tukey .

finish .
