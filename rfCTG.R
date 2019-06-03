data <- read.csv("CTG.csv", header=T)
print(str(data))
data$NSP <- as.factor(data$NSP)
print(str(data))
print(table(data$NSP))

#Data partition
set.seed(1234)
ind <- sample(2, nrow(data), replace=T, prob=c(0.7,0.3))
training <- data[ind == 1,]
testing <- data[ind == 2,]

#random forest
# it can be used for classification or regression(continuous)
library(randomForest)
set.seed(222)
rf <- randomForest(NSP ~ ., data=training)
print(rf)
print(attributes(rf))

#Prediction & Confusion Matrix train data
library(caret)
p1 <- predict(rf, training)
print(head(p1))
confusionMatrix(p1, training$NSP)
#Prediction & confustion matrix - test data
p2 <- predict(rf, testing)
confusionMatrix(p2, testing$NSP)
#error rate of random forest

plot(rf)
#tune mtry
t <- tuneRF(training[, -22], training[,22],
     stepFactor = 0.5,
     plot = TRUE,
     ntree=300,
     trace = TRUE,
     improve = 0.04)

#now try with below 
rf <- randomForest(NSP ~ ., data=training,
                   ntree=300,
                   mtry=8,
                   importance=TRUE,
                   proximity=TRUE)
print(rf)
#prediction
p1 <- predict(rf, training)
print(head(p1))
confusionMatrix(p1, training$NSP)

#Prediction & confustion matrix - test data
p2 <- predict(rf, testing)
confusionMatrix(p2, testing$NSP)
#No of nodes for the trees
hist(treesize(rf),
     main="No. of Nodes for the trees",
     col="green")

#variable importance
#varImpPlot(rf)

varImpPlot(rf,
           sort=T,
           n.var = 10,
           main="Top 10 - variable importance.")
importance(rf)
varUsed(rf)
#Partial Dependence Plot
partialPlot(rf, training, ASTV, "3") #class 1

#extract single tree
getTree(rf, 1, labelVar = TRUE)

#multi dimensional scaling plot of proximity matrix
MDSplot(rf, training$NSP)
