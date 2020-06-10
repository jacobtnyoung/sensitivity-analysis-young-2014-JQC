## ***Sensitivity Analysis for Latent Homophily***

Studies of social influence often estimate the effect of peers by regressing some outcome of interest (e.g. delinquency) on a measure of peer behavior (e.g. average peer delinquency in the network). However, latent homophily, an unmeasured factor which influences friendship selection and some outcome of interest, can create artificial statistical dependence between an outcome of interest for two individuals in the absence of any causal relationship ([Shalizi and Thomas 2011](http://www.ncbi.nlm.nih.gov/pubmed/21052008)). This program examines the sensitivity of estimates from a regression model of some outcome on a directly measured outcome of peers. [VanderWeele and Arah (2011)](http://www.ncbi.nlm.nih.gov/pubmed/21052008) and [VanderWeele (2011)](http://smr.sagepub.com/content/40/2/240.short) have developed a means to examine the sensitivity of an estimate to latent homophily. Basically, the approach examines the hypothetical conditions under which the effect of social influence would be explained by latent homophily.

The syntax below provides the sensitivity analyses conducted by [Young (2014)](http://link.springer.com/article/10.1007/s10940-013-9207-0) on two prominent studies of peer delinquency and social influence (i.e. [Haynie 2001](http://www.jstor.org/stable/10.1086/320298); [Meldrum, Young, and Weerman 2009](http://jrc.sagepub.com/content/46/3/353.short)).

*Here are the files:*

[Sensitivity Analysis for Haynie (2001) in .R format](sensitivity_analysis_haynie_2001_syntax.R)

[Sensitivity Analysis for Meldrum, Young, and Weerman (2009) in .R format](sensitivity_analysis_meldrum_2009_syntax.R)

<br>


## ***Add Pie***

This function was written by Christopher Steven Marcum and David R. Schaefer. The function [**add.pie**](marcum_schaefer_add_pie.R) adds pie charts to network visualizations that have been called using the [gplot](https://www.rdocumentation.org/packages/sna/versions/2.5/topics/gplot) function in the [sna](https://cran.r-project.org/web/packages/sna/index.html) package. A discussion of the function is provided in the article [Save Room for Pie: Adding Pie Charts to Network Visualizations in R with statnet and plotrix](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwiq39jx9qfhAhXUFjQIHWXQC9MQFjAAegQIARAC&url=https%3A%2F%2Fosf.io%2Fpreprints%2Fsocarxiv%2F3rw8e%2Fdownload&usg=AOvVaw0nHud2aEW6Ew0gtuAxtL1f).

<br>


## ***Roster to Adjacency***

The [**roster.to.adjacency**](roster.to.adjacency.R) function takes network data in roster format and creates an adjacency matrix from the data.

<br>


## ***Egocentric Stats***

The [**egocentric.stats**]() function is a set of functions, each of which takes an adjacency matrix and a variable and creates the egocentric means and standard deviation for that variable. The functions require the adjacency matrix ("adj") and a variable ("var"). There are three types of networks to call: send, receive, and send and receive. So, there are six functions (3 for mean, 3 for sd). The end of the function gives an example of how this works.


---
