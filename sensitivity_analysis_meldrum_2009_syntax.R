#############################################################################
# This program examines the sensitivity of the estimates for a direct measure
# of peer delinquency examined in: 
# Reconsidering the Effect of Self-Control and Delinquent Peers : 
# Implications of Measurement for Theoretical Significance 
# Ryan C. Meldrum, Jacob T. N. Young and Frank M. Weerman 
# Journal of Research in Crime and Delinquency 2009 46: 353

#############################################################################
##BEGIN PROGRAM##BEGIN PROGRAM##BEGIN PROGRAM##BEGIN PROGRAM##BEGIN PROGRAM##

#Clear workspace.
rm(list=ls())

################################
#Set up conditions for analysis.

#Build the function.Â 
true.effect <- function(gamma,pi.1,pi.0){ 
  true <-(1+(gamma-1)*pi.1)/(1+(gamma-1)*pi.0)
  return(true)
}
# in this function "true" returns the value for "B" reported in the text.

# Set up sensitivity values.
pi.1 <- seq(0.51,0.9,length.out=500) # prevalence of U in ego's network.
pi.0 <- seq(0.49,0.1,length.out=500) # prevalence of U outside ego's network.

# Set up estimates.
b.est <- 0.203 # estimate of peer delinquency from p. 364 .
se    <- 0.064 # standard error.
e.b   <- 2.71^b.est #exponentiated coefficient for point estimate.
uci   <- b.est+(1.96*se) #upper confidence interval (not used in plot).
lci   <- b.est-(1.96*se) #lower confidence interval.
e.uci <- 2.71^uci #exonentiated estimate for upper confidence interval (not used in plot).
e.lci <- 2.71^lci #exonentiated estimate for lower confidence interval.


# Adjust coefficients by dividing the estimate "e.b" or "e.lci by the "true effect" (i.e. B)
# to get the adjusted effect. Each object (e.g. "main.1.10") returns a vector of adjusted
# effects the length of pi.1. Each object varies the value of gamma. For example, main.1.10
# specifies a value of gamma =1.10.

main.1.10 <- round(( e.b   / true.effect(1.10,pi.1,pi.0) -1),3)
lci.1.10  <- round(( e.lci / true.effect(1.10,pi.1,pi.0) -1),3)
main.1.30 <- round(( e.b   / true.effect(1.30,pi.1,pi.0) -1),3)
lci.1.30  <- round(( e.lci / true.effect(1.30,pi.1,pi.0) -1),3)
main.1.50 <- round(( e.b   / true.effect(1.50,pi.1,pi.0) -1),3)
lci.1.50  <- round(( e.lci / true.effect(1.50,pi.1,pi.0) -1),3)
main.2.00 <- round(( e.b   / true.effect(2.00,pi.1,pi.0) -1),3)
lci.2.00  <- round(( e.lci / true.effect(2.00,pi.1,pi.0) -1),3)
main.3.00 <- round(( e.b   / true.effect(3.00,pi.1,pi.0) -1),3)
lci.3.00  <- round(( e.lci / true.effect(3.00,pi.1,pi.0) -1),3)

################################
# Make the plot.

#use "?plot" (without quotes) to examine this function.
plot(seq(min(pi.1),(max(pi.1)),length.out=length(pi.1)),
     seq(-0.04,main.1.10[1],length.out=length(pi.1)),
     type="n",xlab=expression(paste(plain("Prevalence of" ~italic("U")~ "("), pi[1], plain(") in Ego's Network"))),
     ylab="Corrected Effect",
     main="Figure 3: Sensitivity Analysis for the Effect of Friend's \n Delinquency on Ego's Delinquency: Corrected Effects \n of Meldrum et al. (2009) Estimates Under Latent Homophily"
)

# Draw segments for each of the vectors of adjusted effects.
segments(pi.1[1],main.1.30[1],pi.1[484],main.1.30[484],lty=4,lwd=2.5)
segments(pi.1[1],lci.1.30[1] ,pi.1[178],lci.1.30[178] ,lty=4,lwd=2,col="grey60")
segments(pi.1[1],main.1.50[1],pi.1[311],main.1.50[311],lty=3,lwd=2.5)
segments(pi.1[1],lci.1.50[1] ,pi.1[112],lci.1.50[112] ,lty=3,lwd=2,col="grey60")
segments(pi.1[1],main.2.00[1],pi.1[182],main.2.00[182],lty=2,lwd=2.5)
segments(pi.1[1],lci.2.00[1] ,pi.1[62] ,lci.2.00[62]  ,lty=2,lwd=2,col="grey60")
segments(pi.1[1],main.3.00[1],pi.1[117],main.3.00[117],lty=5,lwd=2.5)
segments(pi.1[1],lci.3.00[1] ,pi.1[37] ,lci.3.00[37]  ,lty=5,lwd=2,col="grey60")
abline(h=0) # draw a line at zero.

# Add a legend to identify varies gamma values.
legend(0.78,0.215,
       c(expression(paste(gamma,plain("=1.3"))),expression(paste(gamma,plain("=1.5"))),
         expression(paste(gamma,plain("=0.0"))),expression(paste(gamma,plain("=3.0")))
       ),cex=1.2,lty=c(4,3,2,5),lwd=1.7,
       title=expression(paste(plain("Effect of" ~italic("U"))))
)

# Add the text and lines for clarifying "explain away" coordinates.
text(0.753,-0.012,expression(paste(pi[1],plain("=0.75"))),cex=0.8)
segments(0.753, 0.000,0.753,-0.009,lty=3)
segments(0.753,-0.015,0.753,-0.065,lty=3)
text(0.890,-0.012,expression(paste(pi[1],plain("=0.89"))),cex=0.8)
segments(0.890, 0.000,0.890,-0.009,lty=3)
segments(0.890,-0.015,0.890,-0.065,lty=3)
text(0.650,-0.012,expression(paste(pi[1],plain("=0.65"))),cex=0.8)
segments(0.650, 0.000,0.650,-0.009,lty=3)
segments(0.650,-0.015,0.650,-0.065,lty=3)
text(0.600,-0.012,expression(paste(pi[1],plain("=0.60"))),cex=0.8)
segments(0.600, 0.000,0.600,-0.009,lty=3)
segments(0.600,-0.015,0.600,-0.065,lty=3)
text(0.562,-0.024,expression(paste(pi[1],plain("=0.56"))),cex=0.8)
segments(0.558, 0.000,0.558,-0.021,lty=3)
segments(0.558,-0.027,0.558,-0.065,lty=3)
text(0.536,-0.038,expression(paste(pi[1],plain("=0.54"))),cex=0.8)
segments(0.537, 0.000,0.537,-0.035,lty=3)
segments(0.537,-0.041,0.537,-0.065,lty=3)

#END PROGRAM####END PROGRAM####END PROGRAM#####END PROGRAM#####END PROGRAM###
#############################################################################