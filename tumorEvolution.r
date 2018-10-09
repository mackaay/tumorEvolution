countdata <- all6prepost
countdata <- as.data.frame(countdata)

rownames(countdata) <- countdata[,1]
rownames(countdata)
countdata <- countdata[,-1]
head(countdata)

logcount <- log(countdata, 2)
logcount <- as.matrix(logcount)
class(logcount) <- "numeric"
logcount <-t(logcount)


library(ggplot2)
library(rlang)
library(devtools)
library(limma)
##Arguments##
#x	
#numeric matrix, or object which can be coerced to a numeric matrix, containing log-expression values.
#weights	
#numeric vector of probe weights. Must be non-negative.
#span	
#span of loess smoothing window, between 0 and 1.
#iterations	
#number of times to cycle through all pairs of columns.
#method	
#character string specifying which variant of the cyclic loess method to use. Options are "fast", "affy" or "pairs".
####

norlogcount <- normalizeCyclicLoess(logcount, weights = NULL, span=0.5, iterations = 30, method = "fast")

boxplot(norlogcount, col = rainbow(norlogcount),xlab="serial samples", ylab="Log2 counts")

write.csv(norlogcount, file = "norlogcount.csv")







