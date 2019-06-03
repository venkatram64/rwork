df <- iris

print(str(df))
library(ggplot2)

pl <- qplot(Petal.Length, Petal.Width, data=iris,
            color=Species)
print(pl)

#Support Vector Machines
library(e1071)
myModel <- svm(Species ~ ., data=iris)
print(summary(myModel))

pl <- plot(myModel, data=iris,
     Petal.Width~Petal.Length,
     slice = list(Sepal.Width = 3, Sepal.Length=4))
print(pl)

#confusion matrix and misclassification error
pred <- predict(myModel, iris)
tab <- table(Predicted = pred, Actual = iris$Species)
print(tab)
error <- 1-sum(diag(tab))/sum(tab)

print(error)
#Tuning 
set.seed(1234)
tmodel <- tune(svm, Species ~ ., data=iris,
     ranges = list(epsilon=seq(0,1,0.1)),
     cost = 2 ^(2:7))
plot(tmodel)
print(summary(tmodel))

mymodel <- tmodel$best.model
print(summary(mymodel))

pl <- plot(mymodel, data=iris,
           Petal.Width~Petal.Length,
           slice = list(Sepal.Width = 3, Sepal.Length=4))
print(pl)






