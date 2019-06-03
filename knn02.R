#https://www.youtube.com/watch?v=tSPg-JDAF4M&list=PL34t5iLfZddu8M0jd7pjSVUjvjBOBdYZ1&index=27&t=0s


library(caret)
library(pROC)
library(mlbench)
#Boston Housing
data <-read.csv("boston_housing.csv", header=T)
print(str(data))

#Data Partition
set.seed(102)
ind <- sample(2, nrow(data), replace=T, prob=c(0.7, 0.3))
training <- data[ind == 1,]
testing <- data[ind == 2,]

trControl <- trainControl(method="repeatedcv",
                          number = 10,
                          repeats = 3)


set.seed(123)


fit <- train(medv ~ .,
             data = training,
             method='knn',
             tuneLength = 20,
             trControl = trControl,
             preProc = c("center", "scale"))
print(fit)
#Model Performance
pl <- plot(fit)
print(pl)
print(varImp(fit))

pred <- predict(fit, newdata = testing)
print("Prediction...")
print(pred)
print(RMSE(pred, testing$medv))
plot(pred ~ testing$medv)