#https://archive.ics.uci.edu/ml/datasets/Student+Performance
#install.packages('corrgram')
#install.packages('corrplot')
#install.packages("caTools")

library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)
library(caTools)

df <- read.csv('student-mat.csv',sep=";")
print(head(df))
#print("structure of data frame")
#print(str(df))
#print("Summary...")
#print(summary(head(df)))
print(any(is.na(df)))

#Num only
num.cols <- sapply(df, is.numeric)
print(num.cols)
#filter
cor.data <- cor(df[, num.cols])
print(cor.data)

#plot, correlation plot
pl <- corrplot(cor.data, method='color')

#print(pl)

plg <- corrgram(df,order=TRUE, lower.panel = panel.shade,
                  upper.panel=panel.pie, text.panel=panel.txt)
#print(plg)

pl <- ggplot(df, aes(x=G3)) + geom_histogram(bins=20, alpha=0.5, fill='blue')


#print(pl)

#split data into train and test set
set.seed(101)
#split up sample
sample <- sample.split(df$G3, SplitRatio=0.7)
#70% of the data goes to train
train <- subset(df, sample == TRUE)
#30% of the data goes to test
test <- subset(df, sample == FALSE)


#The general model of building a linear regression model in R
# looks like this:
# mode < lm(y ~ x1 + x2, data)
# or to use all the feature in your data
# model <- lm(y ~. , data)

#Train and build model
model <- lm(G3 ~ ., data=train)


#Interpret the model
print("After the running the model")
print(summary(model))

res <- residuals(model)
res <-as.data.frame(res)
print(head(res))

pl <- ggplot(res, aes(res)) + geom_histogram(fill='blue', alpha=0.5)
#print(pl)

#plot, 4 plots will be displayed, hit one after the other
#plot(model)

#Predictions
print("Predictions...")
G3.predictions <- predict(model, test)
results <- cbind(G3.predictions, test$G3)
colnames(results) <- c('predicted', 'actual')
results <- as.data.frame(results)
print(results)

#> min(results)
#[1] -2.795582

#Take care of negative values
to_zero <- function(x){
  if(x < 0){
    return (0)
  }else{
    return (x)
  }
}

#Apply Zero function
results$predicted <- sapply(results$predicted, to_zero)

#mean squared error

mse <- mean((results$actual -results$predicted) ^ 2)
print(mse)

#RMSE
print(mse ^ 0.5)

####

SSE <- sum((results$predicted - results$actual) ^ 2)
SST <- sum((mean(df$G3) - results$actual) ^ 2)

R2 <- 1 - SSE/SST
print('R2: ')
print(R2)

