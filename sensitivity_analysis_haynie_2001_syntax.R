#############################################################################
# This program examines the sensitivity of the estimates for a direct measure
# of peer delinquency examined in: 
# Delinquent Peers Revisited: Does Network Structure Matter?
# Dana L. Haynie, American Journal of Sociology 2001 106 :1013

#############################################################################
##BEGIN PROGRAM##BEGIN PROGRAM##BEGIN PROGRAM##BEGIN PROGRAM##BEGIN PROGRAM##


#Clear workspace.
rm(list=ls())

################################
#Set up conditions for analysis.

#Build the function.
true.effect <- function(gamma,pi.1,pi.0){
  true <-(1+(gamma-1)*pi.1)/(1+(gamma-1)*pi.0)
  return(true)
}
# in this function "true" returns the value for "B" reported in the text.

# Set up sensitivity values.
pi.1 <- seq(0.51,0.9,length.out=500) # prevalence of U in ego's network.
pi.0 <- seq(0.49,0.1,length.out=500) # prevalence of U outside ego's network.

# Set up estimates.
b.est <- 0.170 # estimate of peer delinquency from p. 1039 .
se    <- 0.001 # standard error.
e.b   <- 2.71^b.est #exponentiated coefficient for point estimate.
uci   <- b.est+(1.96*se) #upper confidence interval (not used in plot).
lci   <- b.est-(1.96*se) #lower confidence interval.
e.uci <- 2.71^uci #exonentiated estimate for upper confidence interval (not used in plot).
e.lci <- 2.71^lci #exonentiated estimate for lower confidence interval.


# Adjust coefficients by dividing the estimate "e.b" or "e.lci by the "true effect" (i.e. B)
# to get the adjusted effect. Each object (e.g. "main.1.10") returns a vector of adjusted
# effects the length of pi.1. Each object varies the value of gamma. For example, main.1.10
# specifies a value of gamma =1.10.

main.1.25 <- round(( e.b   / true.effect(1.25,pi.1,pi.0) -1),3)
main.1.50 <- round(( e.b   / true.effect(1.50,pi.1,pi.0) -1),3)
main.2.00 <- round(( e.b   / true.effect(2.00,pi.1,pi.0) -1),3)
main.3.00 <- round(( e.b   / true.effect(3.00,pi.1,pi.0) -1),3)

# Replace values less than zero as missing to cut segments at zero.
main.1.25[477:500]<-NA
main.1.50[260:500]<-NA
main.2.00[151:500]<-NA
main.3.00[97:500] <-NA

################################
# Make the plot.

#use "?plot" (without quotes) to examine this function.
plot(seq(min(pi.1),max(pi.1),length.out=length(pi.1)),
     seq(-0.04,main.1.25[1],length.out=length(pi.1)),
     type="n",xlab=expression(paste(plain("Prevalence of" ~italic("U")~ "("), pi[1], plain(") in Ego's Network"))),
     ylab="Corrected Effect",
     main="Figure 2: Sensitivity Analysis for the Effect of Friend's \n Delinquency on Ego's Delinquency: Corrected Effects \n of Haynie (2001) Estimates Under Latent Homophily"
)

# Draw line segments for each of the vectors of adjusted effects.
points(pi.1,main.1.25,col="black", pch= NA, type="o", lty=1,lwd=2.5,cex=0.7)
points(pi.1,main.1.50,col="black", pch= NA, type="o", lty=1,lwd=2.5,cex=0.7)
points(pi.1,main.2.00,col="black", pch= NA, type="o", lty=1,lwd=2.5,cex=0.7)
points(pi.1,main.3.00,col="black", pch= NA, type="o", lty=1,lwd=2.5,cex=0.7)
abline(h=0,lty=2) # draw a line at zero.

# Add the text and lines for clarifying "explain away" coordinates.
text(0.88,-0.025,expression(paste(pi[1],plain("=0.88"))),cex=0.8)
text(0.88,-0.035,expression(paste(gamma,plain("=1.25"))),cex=0.8)
segments(0.880, 0.000,0.880,-0.020,lty=3)
segments(0.880,-0.040,0.880,-0.050,lty=3)
text(0.710,-0.025,expression(paste(pi[1],plain("=0.71"))),cex=0.8)
text(0.710,-0.035,expression(paste(gamma,plain("=1.50"))),cex=0.8)
segments(0.710, 0.000,0.710,-0.020,lty=3)
segments(0.710,-0.040,0.710,-0.050,lty=3)
text(0.627,-0.025,expression(paste(pi[1],plain("=0.62"))),cex=0.8)
text(0.627,-0.035,expression(paste(gamma,plain("=2.00"))),cex=0.8)
segments(0.627, 0.000,0.627,-0.020,lty=3)
segments(0.627,-0.040,0.627,-0.050,lty=3)
text(0.585,-0.025,expression(paste(pi[1],plain("=0.58"))),cex=0.8)
text(0.585,-0.035,expression(paste(gamma,plain("=3.00"))),cex=0.8)
segments(0.585, 0.000,0.585,-0.020,lty=3)
segments(0.585,-0.040,0.585,-0.050,lty=3)

#END PROGRAM####END PROGRAM####END PROGRAM#####END PROGRAM#####END PROGRAM###
#############################################################################
