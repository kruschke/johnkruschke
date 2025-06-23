################################################################################
# Extracting the maximum value from an array.
# John Kruschke, September 2005.

# Set up a silly array for use below.
myarray <- matrix( runif(8) ,nrow=2 ,ncol=4 ,byrow=TRUE )
# Display myarray
myarray

# Display the maximum value (but we don't yet know its location in myarray).
max( myarray )

# Get row and column indices of maximum.
maxindex <- which( myarray == max(myarray) , arr.ind=TRUE )
# Display the indices of the maximum
maxindex

# Display the value at that row and column; this should equal max(myarray).
myarray[ maxindex ]

# You might want the individual row and column indices; here's how to get them: 
rowindex <- maxindex[1]
colindex <- maxindex[2]
