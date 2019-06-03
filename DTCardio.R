data <- read.csv("Cardiotocographic.csv")
print(str(data))
#Add new variable, make it factor
data$NSPF <- factor(data$NSP)

#Partition data into Training and Validation datasets
set.seed(1234)
pd <- sample(2, nrow(data), replace=TRUE, prob=c(0.8, 0.2))
training <- data[pd == 1,]
testing <- data[pd == 2,]

#Decision Tree with party
library(party)

tree <- ctree(NSPF ~ LB+AC+FM, data = training,
              controls = ctree_control(mincriterion = 0.99, minsplit = 500))
plot(tree)

pred <- predict(tree, testing, type="prob")

print(pred)

#with rpart
library(rpart)
tree2 <- rpart(NSPF ~ LB+AC+FM, training)
library(rpart.plot)
print(rpart.plot(tree2, extra = 4)) #extra=1

pred <- predict(tree2, training)
print("Predicting...")
print(pred)
#Misclassification error for 'train' data
tab <- table(predict(tree), training$NSPF)
print(tab)

missclassificationError <- 1-sum(diag(tab))/sum(tab)
print(missclassificationError)

#Misclassification error for 'testing' data
testpred <- predict(tree, testing)
tab <- table(testpred, testing$NSPF)
print(tab)

missclassificationError <- 1-sum(diag(tab))/sum(tab)
print(missclassificationError)








