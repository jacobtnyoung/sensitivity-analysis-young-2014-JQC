#############################################################################
# This function adds pie charts to network plots.
# The pie chart represents the proportion of edges w/ some attribute.

# See "Save Room for Pie: Adding Pie Charts to Network Visualizations in R with statnet and plotrix" 
# by Christopher Steven Marcum David R. Schaefer in SocArXiv 

# ======= #
# add.pie # 
# ======= #

# Required packages.
require( sna )
require( network )
require( plotrix )

# ===BEGIN FUNCTION=== #

add.pie <- function(x,p,sf,coord,cols,r=NULL,pielabel=NULL,...){ 
  x<-as.sociomatrix(x)
  dp<-dim(p)
  if(any(is.na(p))){ 
    p[which(is.na(p))]<-0
  }
  if(any(p==0)){
    p.na<-which(p==0,arr.ind=TRUE) 
    p[which(p==0)]<-.00001 
  }
  p<-prop.table(p,2)
  if(is.null(r)){r<-sf/10}
  gplot(x, vertex.cex=sf, coord=coord, interactive=FALSE,...) 
  bisect.angles<-list() 
  if(is.matrix(cols)){
    for (i in 1:dp[2]) { 
      bisect.angles[[i]]<-floating.pie(coord[i,1],coord[i,2], p[,i], 
                                       edges=500,radius=ifelse(length(r)>1,r[i],r), col=cols[,i])
    }
  } 
  else 
    for (i in 1:dp[2]) {
      bisect.angles[[i]]<-floating.pie(coord[i,1],coord[i,2], p[,i], 
                                       edges=500,radius= ifelse(length(r)>1,r[i],r), col=cols) 
    } 
  if(!is.null(pielabel)){
    thelabs<-pielabel$labels 
    for (i in 1:dp[2]) { 
      if(exists("p.na")){
        if(i%in%p.na[,2]){
          tmp.lab<-thelabs 
          tmp.lab[c(p.na[which(p.na[,2]==i),1])]<-"" 
          pielabel$labels<-tmp.lab 
        }
      } 
      
      pielabel$x<-coord[i,1] 
      pielabel$y<-coord[i,2] 
      pielabel$angles<-bisect.angles[[i]] 
      do.call(pie.labels,pielabel) 
      pielabel$labels<-thelabs 
    } 
  } 
} 

# ===END FUNCTION=== #