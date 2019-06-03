loans <- read.csv('loan_data.csv')
print(head(loans))
print(str(loans))

#convert to categorical

loans$credit.policy <- factor(loans$credit.policy)
loans$inq.last.6mths <- factor(loans$inq.last.6mths)
loans$delinq.2yrs <- factor(loans$delinq.2yrs)
loans$pub.rec <- factor(loans$pub.rec)
loans$not.fully.paid <- factor(loans$not.fully.paid)

#EDA

library(ggplot2)
#pl <- ggplot(loans, aes(fico))
#pl2 <- pl + geom_histogram(aes(fill=not.fully.paid), color='black',bins=40, alpha=0.4)
#pl3 <- pl2 + theme_bw()
#pl4 <- pl3 + scale_fill_manual(values=c('green','red'))
#print(pl4)

#pl <- ggplot(loans, aes(x=factor(purpose)))
#pl2 <- pl + geom_bar(aes(fill=not.fully.paid), position = 'dodge')
#pl3 <- pl2 + theme_bw()
#print(pl3)

pl <- ggplot(loans, aes(int.rate,fico))
#pl2 <- pl + geom_point()
pl2 <- pl + geom_point(aes(color=not.fully.paid, alpha=0.4))
pl3 <- pl2 + theme_bw()
#print(pl3)


#train test split on label ie not.fully.paid
library(caTools)
set.seed(101)
sample <- sample.split(loans$not.fully.paid, 0.7)
train <- subset(loans, sample == T)
test <- subset(loans, sample == F)

#Train SVN

library(e1071)
model <-svm(not.fully.paid ~ ., data=train)
print(summary(model))

#which is not having the no.fully.paid label
predicted.values <- predict(model, test[1:13]) 

print(table(predicted.values, test$not.fully.paid))

#tune the model
#tuned.results <- tune(svm, train.x=not.fully.paid ~ .,data=train
#                      ,kernel='radial',ranges=list(cost=c(100,200),gamma=c(0.1)))

#print(summary(tuned.results))

#Parameter tuning of 'svm':
  
#  - sampling method: 10-fold cross validation 

#- best parameters:
#  cost gamma
#100   0.1

#- best performance: 0.2059628 

#- Detailed performance results:
#  cost gamma     error dispersion
#1  100   0.1 0.2059628 0.01465493
#2  200   0.1 0.2208793 0.01276272

#after tuning
print("tuned predictions: ")
tuned.model <- svm(not.fully.paid ~ .,data=train,cost=100,gamma=0.1)
tuned.predicted.values <- predict(tuned.model, test[1:13])
print(table(tuned.predicted.values, test$not.fully.paid))





