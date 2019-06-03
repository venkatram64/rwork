
#Multinomial logistic regression
mydata <- read.csv("Cardiotocographic.csv", header = T)
print(mydata)
print(str(mydata))

#multinomial logistic regression model
mydata$NSPF <- factor(mydata$NSP)
mydata$out <- relevel(mydata$NSPF, ref="1")
library(nnet)

mymodel <- multinom(out ~ LB+AC+FM, data = mydata)
print(summary(mymodel))

#predict
#p1 <- predict(mymodel, mydata)
p1 <- predict(mymodel, mydata, type="prob")
print(p1)

#misclassification error
cm <- table(predict(mymodel), mydata$NSPF)
print(cm)

error <- 1-sum(diag(cm))/sum(cm)
print(error)

#2-tailed z test
z <- summary(mymodel)$coefficients/summary(mymodel)$standard.errors
p <- (1-pnorm(abs(z), 0, 1)) * 2
print(p)
