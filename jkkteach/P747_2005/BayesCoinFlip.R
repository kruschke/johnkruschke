# BayesCoinFlip.R
# Bayesian estimation of coin bias.
# My first R script ever! 
# John Kruschke, Sept. 2005

# specify the data, i.e., heads and tails
# ------------------------------------------------------------------
# head = 1, tail = 0
data = c( 1 ,1 ,0 )

# specify the comb for the parameter theta, which denotes p(head)
# ------------------------------------------------------------------
nbins = 99	# arbitrary
binwidth = 1.0/nbins
theta <- seq( from = 0.0+(binwidth/2) , 
		to = 1.0-(binwidth/2), 
		by = binwidth )

# specify the prior probability on theta
# ------------------------------------------------------------------
# triangular prior
# p_theta <- 0.5 - abs( theta - 0.5 )
# cusp prior
# p_theta <- (0.5 - abs( theta - 0.5 ))^2
# beta prior
a = 2; b = 2 
p_theta <- theta^(a-1) * (1-theta)^(b-1)
# normalized prob, per bin (not density)
p_theta <- p_theta / sum( p_theta )

# compute the probability of the data for each value of theta
# ------------------------------------------------------------------
N = length( data )
R = sum( data )
p_data_g_theta = choose(N,R) * theta^R * ( 1 - theta )^(N-R)

# compute the posterior probability
# ------------------------------------------------------------------
p_theta_g_data = p_data_g_theta * p_theta
# normalized prob, per bin
p_theta_g_data = p_theta_g_data / sum( p_theta_g_data )

# plot the prior and posterior densities
# ------------------------------------------------------------------
# convert to density
pdens_theta = p_theta / binwidth
pdens_theta_g_data = p_theta_g_data / binwidth
# preliminaries for subsequent use in plots
ymax = 1.0 * max( c( pdens_theta , pdens_theta_g_data ) )
filledcircle <- 15	# convert R numeric code into meaningful name
filledsquare <- 16
solidline <- 1
dashedcoarse <- 5
dashedfine <-3
plot( theta ,pdens_theta 
	,xlab=expression(paste( theta ," [=p(heads)]" ))
	,ylim=c(0,ymax)
	,ylab=expression(paste( "p(" ,theta ,") [density]" ))
	,type="l" #,pch=filledcircle 
	,lty=dashedfine ,lwd=2 ,col="green"
	,main=bquote(paste( "Data: flips = " ,.(N) ,", heads = " ,.(R) )) 
	)
legend( x="topleft" ,legend="Prior" 
	,lty=dashedfine ,lwd=2 ,col="green"
 	)
par(new=T)
plot( theta ,pdens_theta_g_data 
	,xlab=""
	,ylim=c(0,ymax) ,ylab=""
	,type="l" #,pch=filledsquare 
	,lty=solidline ,lwd=2 ,col="red" 
	)
legend( x="topright" ,legend="Posterior" 
	,lty=solidline ,lwd=2 ,col="red"
 	)
par(new=F)

# save the plot as an eps file
# ------------------------------------------------------------------
dev.copy2eps(file="BayesCoinFlipPlot.eps")
