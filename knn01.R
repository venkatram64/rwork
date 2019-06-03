#https://www.youtube.com/watch?v=tSPg-JDAF4M&list=PL34t5iLfZddu8M0jd7pjSVUjvjBOBdYZ1&index=27&t=0s


library(caret)
library(pROC)
library(mlbench)
#student application classification
data <-read.csv("binary.csv", header=T)
#str(data)
data$admit[data$admit == 0] <- 'No'
data$admit[data$admit == 1] <- 'Yes'
#str(data)
data$admit <- factor(data$admit)
str(data)

#Data Partition
set.seed(102)
ind <- sample(2, nrow(data), replace=T, prob=c(0.7, 0.3))
training <- data[ind == 1,]
testing <- data[ind == 2,]

#KNN Model

#trControl <- trainControl(method="repeatedcv",
#                         number = 10,
#                         repeats = 3)

trControl <- trainControl(method="repeatedcv",
                          number = 10,
                          repeats = 3,
                          classProbs = TRUE,
                          summaryFunction = twoClassSummary)


set.seed(123)
#fit <- train(admit ~ .,
#             data = training,
#             method='knn',
#             tuneLength = 20,
#             trControl = trControl,
#             preProc = c("center", "scale"))

fit <- train(admit ~ .,
             data = training,
             method='knn',
             tuneLength = 20,
             trControl = trControl,
             preProc = c("center", "scale"),
             metric = "ROC",
             tuneGrid=expand.grid(k=1:60))
print(fit)
#Model Performance
pl <- plot(fit)
print(pl)
print(varImp(fit))

pred <- predict(fit, newdata = testing)
print("Prediction...")
print(pred)
print("confustion matrix: ")
print(confusionMatrix(pred, testing$admit))

#Boston Housing

