library(ISLR)
library(ggplot2)


df <- College
print(head(df))
print(str(df))
#exploratory data analysis follows...

#pl <- ggplot(df, aes(Room.Board, Grad.Rate))
#pl2 <- pl + geom_point(aes(color=Private), size=4, alpha=0.5)
#print(pl2)

#pl <- ggplot(df, aes(F.Undergrad))
#pl2 <- pl + geom_histogram(aes(fill=Private), color='black', bins = 50, alpha=0.5)
#pl3 <- pl2 + theme_bw()
#print(pl3)

#pl <- ggplot(df, aes(Grad.Rate))
#pl2 <- pl + geom_histogram(aes(fill=Private), color='black', bins = 50, alpha=0.5)
#pl3 <- pl2 + theme_bw()
#print(pl3)
#getting record grad rate more than 100%
df.gradrate <- subset(df,Grad.Rate > 100)

#print(df.gradrate)

#Change the Cazenovia College which is having 118% Grad.Rate, so update to 100%
df['Cazenovia College','Grad.Rate'] <- 100
df.gradrate <- subset(df, Grad.Rate > 100)

print(df.gradrate)

#Train test split
library(caTools)
set.seed(101)

sample <- sample.split(df$Private, SplitRatio = 0.70)
train <- subset(df, sample==T)
test <- subset(df, sample==F)

library(randomForest)
rf.model <- randomForest(Private ~ ., data=train, importance=TRUE)
print("Tree Data...")
print(rf.model)
print("Confustion matrix data ...")
print(rf.model$confusion)

print("importance of the data...")
print(rf.model$importance)

#prediction for test data
print("predictions for test data...")
rf.model.pred <- predict(rf.model, test)

print("Predictions...")
print(head(rf.model.pred))

#confusion matrix
cm <- table(rf.model.pred, test$Private)
print(cm)








