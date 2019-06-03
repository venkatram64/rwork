#install.packages("ISLR")

library(ISLR)
#Caravan dataset, insurance company, insurance policy
#print(Caravan)
#print(str(Caravan))
#print(summary(Caravan$Purchase))
print(any(is.na(Caravan)))
print(var(Caravan[,1]))
print(var(Caravan[,2]))

purchase <- Caravan[,86]
standardized.Caravan <- scale(Caravan[,-86])
print(var(standardized.Caravan[,1]))
print(var(standardized.Caravan[,2]))

#Train Test Split

test.index <- 1:1000
test.data<- standardized.Caravan[test.index,]
test.purchase <- purchase[test.index]

#Train

train.data <- standardized.Caravan[-test.index,]
train.purchase <- purchase[-test.index]


#KNN model

library(class)
set.seed(101)
predicted.purchase <- knn(train.data, test.data, train.purchase, k=5)
print(head(predicted.purchase))

misclass.error <- mean(test.purchase != predicted.purchase)
print(misclass.error)

#Choose a K Value

predicted.purchase <- NULL
error.rate <- NULL

for(i in 1:20){
  set.seed(101)
  predicted.purchase <- knn(train.data, test.data, train.purchase, k=i)
  error.rate[i] <- mean(test.purchase != predicted.purchase)
}

#print(error.rate)

#visualize k elbow method

library(ggplot2)
k.values <- 1:20
error.df <- data.frame(error.rate, k.values)

print(error.df)

pl <- ggplot(error.df, aes(k.values, error.rate)) + geom_point()
pl2 <- pl + geom_line(lty='dotted',color='red')

print(pl2)