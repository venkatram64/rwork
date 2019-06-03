
#Multinomial logistic regression
mydata <- read.csv("Cardiotocographic.csv", header = T)
print(mydata)
print(str(mydata))

mydata$NSPF <- factor(mydata$NSP)
mydata$out <- relevel(mydata$NSPF, ref="1")
library(nnet)
