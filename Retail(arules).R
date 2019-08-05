install.packages("arules")
library(arules)
install.packages("arulesViz")
library(arulesViz)
library(datasets)

file.choose()
w1 = read.table("C:\\Users\\CDSS\\Desktop\\retail.csv")

trans = read.transactions("C:\\Users\\CDSS\\Desktop\\retail.csv", format = "basket", sep=",");

itemFrequencyPlot(trans,topN=20,type="absolute")


rules<-apriori(data=trans, parameter=list(supp=0.001,conf = 0.08), 
               appearance = list(default="lhs",rhs="mobile"),control = list(verbose=F))

rules<-sort(rules, decreasing=TRUE,by="confidence")


inspect(rules[1:10])


plot(rules,method="graph",interactive=TRUE,shading=NA)
