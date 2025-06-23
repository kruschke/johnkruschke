
# Plotting a 2D confidence region.
# R script by John Kruschke, Sept 2005

# Specify comb values for mu (parameter 1).
mu_min <- -30.0	# arbitrary
mu_max <- 30.0	# arbitrary
n_mu_bins <- 59	# arbitrary
mu_binwidth <- ( mu_max - mu_min ) / n_mu_bins
mu <- seq( from = mu_min + (mu_binwidth/2)  
		,to = mu_max - (mu_binwidth/2)  
		,by = mu_binwidth )

# Specify comb values for sd (parameter 2).
sd_min <- 0.0	# arbitrary
sd_max <- 30.0	# arbitrary
n_sd_bins <- 49	# arbitrary
sd_binwidth <- ( sd_max - sd_min ) / n_sd_bins
sd <- seq( from = sd_min + (sd_binwidth/2)  
		,to = sd_max - (sd_binwidth/2)  
		,by = sd_binwidth )

# Determine the area of a grid cell.
binarea = mu_binwidth * sd_binwidth

# Specify a distribution on joint mu,sd space.
#
# Want mydistrib to capture idea that if mu is small, then so is sd.
# This is just an arbitrary weird function.
p_mu_sd <- function( mu, sd ) { 
	prob <-  exp(-((sd-2 -exp(mu/7))/sqrt(sd))^2) * exp(-((mu-0)/13)^2)
	}
mydistrib <- outer( mu, sd, p_mu_sd )	# unnormalized
mydistrib <- mydistrib / sum( mydistrib )		# normalized
mydistrib_dens <- mydistrib / binarea		# converted to density

# Plot the distribution.

# Open a new window
windows(width=8.5,height=8.5/3) # different for Mac or Unix!

layout( 
	matrix( c( 1,2,3 ) ,nrow=1 ,ncol=3 ,byrow=TRUE ) 
	,c(1,1) ,c(1,1) 
	) 

# Make a perspective plot.
persp( mu, sd, mydistrib
	,main="persp"
	,xlab="mu" ,ylab="sd" ,zlab="p(mu,sd)"
	,ticktype = "detailed"
	,theta = 45 ,phi = 30 ,expand = 0.8 ,d=2 
	,col="green" ,ltheta=40  ,lphi=20 ,shade=0.7  )

# Make a contour plot.
contour( mu, sd, mydistrib
	,main="contour"
	,xlab="mu" ,ylab="sd" )

# HERE'S THE NEW STUFF:
# Determine the confidence region
# ------------------------------------------------------------------
# This algorithm just starts at a height of zero and increments the
# height slightly until the sum above that height is just less than
# the desired confidence level. N.B.: "mydistrib" must be a 
# probability distribution -- i.e., sums to 1.0 -- not a density!
# This is not a very sophisticated or general search algorithm; it's
# just a brute-force rough-and-ready heuristic.
#
confidence_level = 0.95
ht_inc <- max(mydistrib)/5000		# arbitrary, depends on shape.
height <- 0.0				# initialize height at zero.
while (TRUE) {
	confid <- sum( mydistrib[ mydistrib > height ] )
	if ( confid > confidence_level ) {
		height <- height + ht_inc
	} else {
		height <- height - ht_inc
		break
	}
}
critical_ht <- height

# Plot the confidence region.
#
contour( mu, sd, mydistrib
	,main="95% Confidence Region"
	,levels = critical_ht
	,drawlabels = FALSE
	,xlab="mu" ,ylab="sd" )

dev.copy2eps(file="ConfidenceRegion.eps")

# ------------------------------------------------------------------

