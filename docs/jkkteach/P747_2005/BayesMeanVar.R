
# Bayesian estimation of mean and variance for normal likelihood model
# R script by John Kruschke, Sept 2005

# Specify comb values for mean.
# ------------------------------------------------------------------
mu_min <- -30.0	# arbitrary
mu_max <- 30.0	# arbitrary
n_mu_bins <- 59	# arbitrary
mu_binwidth <- ( mu_max - mu_min ) / n_mu_bins
mu <- seq( from = mu_min + (mu_binwidth/2)  
		,to = mu_max - (mu_binwidth/2)  
		,by = mu_binwidth )

# Specify comb values for standard deviation.
# ------------------------------------------------------------------
sd_min <- 0.0	# arbitrary
sd_max <- 50.0	# arbitrary
n_sd_bins <- 49	# arbitrary
sd_binwidth <- ( sd_max - sd_min ) / n_sd_bins
sd <- seq( from = sd_min + (sd_binwidth/2)  
		,to = sd_max - (sd_binwidth/2)  
		,by = sd_binwidth )

# Determine the area of a grid cell.
binarea = mu_binwidth * sd_binwidth

# Specify the prior distribution on joint mu,sd space.
# ------------------------------------------------------------------
# Want prior to capture idea that if mu is small, then so is sd.
# This is just an arbitrary weird function.
p_mu_sd <- function( mu, sd ) { 
	prob <-  exp(-((sd-2 -exp(mu/7))/sqrt(sd))^2) * exp(-((mu-0)/13)^2)
	}
prior <- outer( mu, sd, p_mu_sd )	# unnormalized
prior <- prior / sum( prior )		# normalized
prior_dens <- prior / binarea		# converted to density


# Plot the prior.
# ------------------------------------------------------------------
# Open a new window
windows() # different for Mac or Unix!
layout( 
	matrix( c( 1,1,2,3 ) ,nrow=2 ,ncol=2 ,byrow=TRUE ) 
	,c(1,1) ,c(7,4) 
	) 

# layout figure 1
persp( mu, sd, prior_dens
	,main="Prior Density"
	,xlab="mu" ,ylab="sd" ,zlab="p(mu,sd)"
	,ticktype = "detailed"
	,theta = 45 ,phi = 30 ,expand = 0.8 ,d=2 
	,col="green" ,ltheta=40  ,lphi=20 ,shade=0.7  )

# Compute and plot marginals of prior.
mu_marg = rowSums(prior) 
mu_marg_dens = mu_marg / mu_binwidth
# layout figure 2
plot( mu ,mu_marg_dens
	,xlab=bquote(mu) ,ylab=bquote(paste( "p(" ,mu ,")" ))
	,type="l" ,lty="solid" ,lwd=2 ,col="green" ,cex=2
	,main="Marginal Prior" 
	)

sd_marg = colSums(prior)
sd_marg_dens = sd_marg / sd_binwidth
# layout figure 3
plot(sd,sd_marg_dens
	,xlab=bquote(sigma) ,ylab=bquote(paste( "p(" ,sigma ,")" ))
	,type="l" ,lty="solid" ,lwd=2 ,col="green"
	,main="Marginal Prior" 
	)

# save the plot as an eps file
dev.copy2eps(file="BayesMeanVarPrior.eps")

# Specify data.
# ------------------------------------------------------------------
data <- c( -10 ,5 ,20  )

# Determine likelihood of mu,sd ; that is, probability of data.
# ------------------------------------------------------------------
# This function defines a normal probability model for a single datum.
p_data_g_mu_sd <- function( mu, sd, datum ) {
	prob <- (1/(sd*sqrt(2*pi))) * exp(-0.5*((datum-mu)/sd)^2)
	}
# Initialize likelihood to all ones.
likelihood = matrix( 1 ,nrow=nrow(prior) ,ncol=ncol(prior) )
# Now apply the normal model to every element of the data vector.
for ( datum in data ) {
	likelihood = likelihood * outer( mu, sd,  p_data_g_mu_sd, datum )
}

# Plot the likelihood.
# ------------------------------------------------------------------
# Open a new window
windows() # different for Mac or Unix!
layout( 
	matrix( c( 1,1,2,3 ) ,nrow=2 ,ncol=2 ,byrow=TRUE ) 
	,c(1,1) ,c(7,4) 
	) 

# layout figure 1
persp( mu, sd, likelihood
	,main="Likelihood" ,zlab="p(data)"
	,ticktype = "detailed"
	,theta = 45 ,phi = 30 ,expand = 0.8 ,d=2 
	,col="orange" ,ltheta=40  ,lphi=20 ,shade=0.7  )

# Compute and plot marginals of likelihood.
mu_marg = rowSums(likelihood) 
mu_marg_dens = mu_marg / mu_binwidth
# layout figure 2
plot( mu ,mu_marg_dens
	,xlab=bquote(mu) ,ylab=bquote(paste( "p(" ,mu ,")" ))
	,type="l" ,lty="solid" ,lwd=2 ,col="orange" ,cex=2
	,main="Marginal Likelihood" 
	)

sd_marg = colSums(prior)
sd_marg_dens = sd_marg / sd_binwidth
# layout figure 3
plot(sd,sd_marg_dens
	,xlab=bquote(sigma) ,ylab=bquote(paste( "p(" ,sigma ,")" ))
	,type="l" ,lty="solid" ,lwd=2 ,col="orange"
	,main="Marginal Likelihood" 
	)

# save the plot as an eps file
dev.copy2eps(file="BayesMeanVarLikeli.eps")


# Determine the posterior distribution
# ------------------------------------------------------------------
posterior = likelihood * prior		# unnormalized
posterior <- posterior / sum( posterior )	# normalized
post_dens <- posterior / binarea		# converted to density


# Plot the posterior
# ------------------------------------------------------------------
# Open a new window
windows() # different for Mac or Unix!
layout( 
	matrix( c( 1,1,2,3 ) ,nrow=2 ,ncol=2 ,byrow=TRUE ) 
	,c(1,1) ,c(7,4) 
	) 

# layout figure 1
persp( mu, sd, post_dens
	,main="Posterior Density"
	,xlab="mu" ,ylab="sd" ,zlab="p(mu,sd)"
	,ticktype = "detailed"
	,theta = 45 ,phi = 30 ,expand = 0.8 ,d=2 
	,col="red" ,ltheta=40  ,lphi=20 ,shade=0.7  )

# Compute and plot marginals of prior.
mu_marg = rowSums(posterior) 
mu_marg_dens = mu_marg / mu_binwidth
# layout figure 2
plot( mu ,mu_marg_dens
	,xlab=bquote(mu) ,ylab=bquote(paste( "p(" ,mu ,")" ))
	,type="l" ,lty="solid" ,lwd=2 ,col="red" ,cex=2
	,main="Marginal Posterior" 
	)

sd_marg = colSums(posterior)
sd_marg_dens = sd_marg / sd_binwidth
# layout figure 3
plot(sd,sd_marg_dens
	,xlab=bquote(sigma) ,ylab=bquote(paste( "p(" ,sigma ,")" ))
	,type="l" ,lty="solid" ,lwd=2 ,col="red"
	,main="Marginal Posterior" 
	)

# save the plot as an eps file
dev.copy2eps(file="BayesMeanVarPost.eps")

# ------------------------------------------------------------------
