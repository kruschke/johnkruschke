Patterns for ALCOVE should be specified as follows. 
For each pattern, conventionally (but not necessarily) 
all on one line:
------------------------------------------------------------
pat_ID_#   
presence \
value    / (repeat for each input node)  
teacher    (repeat for each output node)
------------------------------------------------------------
where 
 pat_ID_# = any integer; e.g., trial number or pattern label 
 presence = 1 or 0
 value    = floating point number
 teacher = `T', `t', or `n'  */

Here is an example (with two input nodes, two output nodes):
------------------------------------------------------------
 1    1 0.0  1 0.0   T t
 2    1 1.0  1 0.0   t T
 3    1 0.0  1 1.0   T t
 4    1 1.0  1 1.0   t T
------------------------------------------------------------
