### Below are several R functions that I (and others) have programmed. I have found these very useful.

## **Sensitivity Analysis for Latent Homophily**

Studies of social influence often estimate the effect of peers by regressing some outcome of interest (e.g. delinquency) on a measure of peer behavior (e.g. average peer delinquency in the network). However, latent homophily, an unmeasured factor which influences friendship selection and some outcome of interest, can create artificial statistical dependence between an outcome of interest for two individuals in the absence of any causal relationship ([Shalizi and Thomas 2011](http://www.ncbi.nlm.nih.gov/pubmed/21052008)). This program examines the sensitivity of estimates from a regression model of some outcome on a directly measured outcome of peers. [VanderWeele and Arah (2011)](http://www.ncbi.nlm.nih.gov/pubmed/21052008) and [VanderWeele (2011)](http://smr.sagepub.com/content/40/2/240.short) have developed a means to examine the sensitivity of an estimate to latent homophily. Basically, the approach examines the hypothetical conditions under which the effect of social influence would be explained by latent homophily.

<br>

The syntax below provides the sensitivity analyses conducted by [Young (2014)](http://link.springer.com/article/10.1007/s10940-013-9207-0) on two prominent studies of peer delinquency and social influence (i.e. [Haynie 2001](http://www.jstor.org/stable/10.1086/320298); [Meldrum, Young, and Weerman 2009](http://jrc.sagepub.com/content/46/3/353.short)).

<br>

*Syntax*

[Sensitivity Analysis for Haynie (2001) in .R format](sensitivity_analysis_haynie_2001_syntax.R)
[Sensitivity Analysis for Meldrum, Young, and Weerman (2009) in .R format](sensitivity_analysis_meldrum_2009_syntax.R)
