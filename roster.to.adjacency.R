# =================== #
# roster.to.adjacency # 
# =================== #

# Required packages.
require(sna)
require(network)

# ===BEGIN FUNCTION=== #

roster.to.adjacency <- function(input.data){

y       <- input.data[,names(input.data)]
ids     <-y[,1] #the first column is the ids
sid     <-sort(unique(ids)) #sort them
x       <-matrix(0, ncol=length(sid), nrow=length(sid)) #make a matrix with sid X sid dim
id      <-match(ids,sid)
f1      <-match(y[,2] ,sid)
f2      <-match(y[,3] ,sid)
f3      <-match(y[,4] ,sid)
f4      <-match(y[,5] ,sid)
f5      <-match(y[,6] ,sid)
f6      <-match(y[,7] ,sid)
f7      <-match(y[,8] ,sid)
f8      <-match(y[,9] ,sid)
f9      <-match(y[,10],sid)
f10     <-match(y[,11],sid)

#Loop over the data to recode the ids into "1"
for (i in 1:nrow(y)){
 if(!is.na(f1[i])) {x[id[i], f1[i]]<-1 }
 if(!is.na(f2[i])) {x[id[i], f2[i]]<-1 }
 if(!is.na(f3[i])) {x[id[i], f3[i]]<-1 }
 if(!is.na(f4[i])) {x[id[i], f4[i]]<-1 }
 if(!is.na(f5[i])) {x[id[i], f5[i]]<-1 }
 if(!is.na(f6[i])) {x[id[i], f6[i]]<-1 }
 if(!is.na(f7[i])) {x[id[i], f7[i]]<-1 }
 if(!is.na(f8[i])) {x[id[i], f8[i]]<-1 }
 if(!is.na(f9[i])) {x[id[i], f9[i]]<-1 }
 if(!is.na(f10[i])){x[id[i], f10[i]]<-1}
}

dimnames(x)<-list(sid,sid)
mat  <-as.matrix(x)
return(mat) #return the adjacency matrix.
}

# ===END FUNCTION=== #
