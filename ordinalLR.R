data <- read.csv("Cardiotocographic.csv", header = T)
print(str(data))
#convert into ordinal data
data$NSP <- as.ordered(data$NSP)
print(summary(data))
#convert tendency into categorical value
data$Tendency <- as.factor(data$Tendency)
print(summary(data))
#tendency with NSP and Tendency
xtabs(~NSP + Tendency, data)

#Partition data into Training and Validation datasets
set.seed(1234)
pd <- sample(2, nrow(data), replace=TRUE, prob=c(0.8, 0.2))
training <- data[pd == 1,]
testing <- data[pd == 2,]
#Ordinal Logistic Regression or Proportioanl Odds Logistic
library(MASS)
#model <- polr(NSP~ LB + AC + FM, training, Hess = TRUE)
#model <- polr(NSP~ . -Max, training, Hess = TRUE)
#remove not significant variables by looking their p value
model <- polr(NSP~ . -Max-LB-MSTV-Nmax-Nzeros-Median-FM-MLTV, training, Hess = TRUE)
print(summary(model))

#p-value calculation
ctable <- coef(summary(model))
print(ctable)
p <- pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2
print(p)
ctable <- cbind(ctable, "pvalue" = p)
print(ctable)


#Prediction
#p1 <- predict(model, training, type='prob')
#print(p1, digits = 3)
p1 <- predict(model, training)
print(p1)
#confustion matrix & error for training data
tab1 <- table(p1, training$NSP)
print(tab1)
error <- 1 - sum(diag(tab1))/sum(tab1)

##confustion matrix & error for testing data
p2 <- predict(model, testing)
print(p2)
tab2 <- table(p2, testing$NSP)
print(tab2)
error <- 1 - sum(diag(tab2))/sum(tab2)