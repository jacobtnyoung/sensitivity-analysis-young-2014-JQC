# ==================== #
#  egocentric.stats    # 
# ==================== #

# These functions take an adjacency matrix and a variable and creates the egocentric means and sd for the variable.
# The functions require the adjacency matrix ("adj") and a variable ("var").
# There are three types of networks to call: send, receive, and send and receive. 
# So, there are six functions (3 for mean, 3 for sd).

# The end of the function gives an example of how this works.

# ==================== #
#  egocentric means    # 
# ==================== #

# ===BEGIN FUNCTION=== #
egomean.s <- function(adj,var){
	weight <- t(var*t(adj))
	mean.var.s <-rep(0,length.out=length(var))
		for(i in 1:length(mean.var.s)){
			mean.var.s[i] <- mean(weight[i,adj[i,]!=0],na.rm=T)	
	}
return(mean.var.s)
}
# ===END  FUNCTION=== #

# ===BEGIN FUNCTION=== #
egomean.r <- function(adj,var){
	weight <- t(var*t(adj))
	mean.var.r <-rep(0,length.out=length(var))
		for(i in 1:length(mean.var.r)){
			mean.var.r[i] <- mean(weight[i,adj[,i]!=0],na.rm=T)	
	}
return(mean.var.r)
}
# ===END  FUNCTION=== #

# ===BEGIN FUNCTION=== #
egomean.sr <- function(adj,var){
	weight <- t(var*t(adj))
	mean.var.sr <-rep(0,length.out=length(var))
		for(i in 1:length(mean.var.sr)){
			mean.var.sr[i] <- mean(intersect(weight[i,adj[,i]!=0],weight[i,adj[i,]!=0]))	
	}
return(mean.var.sr) #NOTE: this returns NaN (i.e. missing) for cases that do not have an intersection.
}
# ===END  FUNCTION=== #

# ==================== #
#  egocentric sds      # 
# ==================== #

# ===BEGIN FUNCTION=== #
egosd.s <- function(adj,var){
	weight <- t(var*t(adj))
	sd.var.s <-rep(0,length.out=length(var))
		for(i in 1:length(sd.var.s)){
			sd.var.s[i] <- sd(weight[i,adj[i,]!=0],na.rm=T)	
	}
return(sd.var.s)
}
# ===END  FUNCTION=== #

# ===BEGIN FUNCTION=== #
egosd.r <- function(adj,var){
	weight <- t(var*t(adj))
	sd.var.r <-rep(0,length.out=length(var))
		for(i in 1:length(sd.var.r)){
			sd.var.r[i] <- sd(weight[i,adj[,i]!=0],na.rm=T)	
	}
return(sd.var.r)
}
# ===END  FUNCTION=== #

# ===BEGIN FUNCTION=== #
egosd.sr <- function(adj,var){
	weight <- t(var*t(adj))
	sd.var.sr <-rep(0,length.out=length(var))
		for(i in 1:length(sd.var.sr)){
			sd.var.sr[i] <- sd(intersect(weight[i,adj[,i]!=0],weight[i,adj[i,]!=0]))	
	}
return(sd.var.sr) #NOTE: this returns NaN (i.e. missing) for cases that do not have an intersection.
}
# ===END  FUNCTION=== #

# ================================ #
# ===BEGIN EXAMPLE OF FUNCTIONS=== #

## Create a test to make sure the function is working properly.
## This has 5 individuals and 2 variables.
## "adj" is the adjacency matrix.
## "var1" and "var2" are the variables values we want means for.
# 
# adj <- matrix(c(
# 	0,1,1,0,0,
# 	1,0,0,1,0,
# 	1,1,0,1,0,
# 	1,0,1,0,1,
# 	0,1,1,0,0),nrow=5,ncol=5,byrow=TRUE)
# var1 <-c(1,2,7,5,0)
# var2 <-c(0,1,1,0,1)

## Take the transpose of the adjacency matrix, multiply it by the variable, and then take the transpose.
## t(var*t(adj))
## what this does is replace the value of the tie in the adjacency matrix with the value of the variable.
## so, the ij_th entry of the new matrix is the value of the variable for j and the ji_th is the value for i.

# weight <- t(var1*t(adj))

## now, we need to take the average over the values to get the ego-centric mean.

## Example. 
## Take the mean for node 1 (row 1, i.e. [1,] of adj).
## This is just the row sum divided by the number of non-zero elements in the adjacency matrix.
# mean(weight[1,adj[1,]!=0],na.rm=T)

## Now, right this as a loop to go through the whole matrix.
## First, create the variable that we are going to assign the means too.
# mean.var1.send <-rep(0,length.out=length(var1)) #create zeros the length of the output variable.
# for(i in 1:length(mean.var1.send)){
# 	mean.var1.send[i] <- mean(weight[i,adj[i,]!=0],na.rm=T)	
# }

## For the receive network, we just take the column of the adjacency matrix instead of the row.
## Take the mean for node 1 (column 1, i.e. [,1] of adj).
## This is just the column sum divided by the number of non-zero elements in the adjacency matrix.
# mean(weight[1,adj[,1]!=0],na.rm=T)

## Now, right this as a loop to go through the whole matrix.
## First, create the variable that we are going to assign the means too.
# mean.var1.recv <-rep(0,length.out=length(var1)) #create zeros the length of the output variable.
# for(i in 1:length(mean.var1.recv)){
# 	mean.var1.recv[i] <- mean(weight[i,adj[,i]!=0],na.rm=T)	
# }

## For the send and receive network, we want the intersection.
# mean(intersect(weight[1,adj[,1]!=0],weight[1,adj[1,]!=0]))

# mean.var1.sdrc <-rep(0,length.out=length(var1)) #create zeros the length of the output variable.
# for(i in 1:length(mean.var1.sdrc)){
# 	mean.var1.sdrc[i] <- mean(intersect(weight[i,adj[,i]!=0],weight[i,adj[i,]!=0]))	
# }
## NOTE: this returns NaN (i.e. missing) for cases that do not have an intersection (i.e. there send and receive is an empty set).

# ================================ #
# === END EXAMPLE OF FUNCTIONS === #
