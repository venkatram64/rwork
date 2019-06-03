#Logistic Regression
#read.csv(file.choose(), header=T)
data <- read.csv("binary.csv", header = T)
print(str(data))

#convert admit, rank into categorical varibales
data$admit <- as.factor(data$admit)
data$rank <- as.factor(data$rank)
print(str(data))

#Two way table of factor variables
xtabs(~admit + rank, data=data)
#there is no zero rows, data looks good.
#Partition data train and test
set.seed(1234)
ind <- sample(2, nrow(data), replace=T, prob=c(0.8,0.2))
training <- data[ind == 1,]
testing <- data[ind == 2,]

#Logistic regression model
model <- glm(admit ~ gre + gpa + rank, data = training, family = 'binomial')
print(summary(model))

#gre is not significant so we can drop

#Logistic regression model
model <- glm(admit ~ gpa + rank, data = training, family = 'binomial')
print(summary(model))

p1 <- predict(model, training, type='response')
print(head(p1))
print(head(training))

#misclassification error train data
pred1 <- ifelse(p1>0.5, 1, 0)
tab1 <- table(Predicted = pred1, Actual=training$admit)
print(tab1) #gives confustion matrix

error <- 1 - sum(diag(tab1))/sum(tab1)
print(error)

#misclassification error test data
p2 <- predict(model, testing, type='response')
pred2 <- ifelse(p2>0.5, 1, 0)
tab2 <- table(Predicted = pred2, Actual=testing$admit)
print(tab2) #gives confustion matrix

error <- 1 - sum(diag(tab2))/sum(tab2)
print(error)

#Goodness of fit test
p_value <- with(model, pchisq(null.deviance - deviance, df.null - df.residual, lower.tail = FALSE))
print(p_value)
#since this value is so small, this model is significant


















