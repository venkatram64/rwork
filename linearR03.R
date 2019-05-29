#install.packages('Amelia')
library(Amelia)
df.train <-read.csv('titanic_train.csv')
#print(head(df.train))
#print('     ')
#print(str(df.train))
#help('missmap')

#mmap <- missmap(df.train, main='Missing Map', col=c('yellow','black'), legend=FALSE)
#print(mmap)
library(ggplot2)
#pl <- ggplot(df.train, aes(Survived)) + geom_bar()
#pl <- ggplot(df.train, aes(Pclass)) + geom_bar(aes(fill=factor(Pclass)))
#pl <- ggplot(df.train, aes(Sex)) + geom_bar(aes(fill=factor(Sex)))

#print(pl)

#pl <- ggplot(df.train, aes(Age)) + geom_histogram(bins=20, alpha=0.5,fill='blue')
#print(pl)

#pl <- ggplot(df.train, aes(SibSp)) + geom_bar()
#print(pl)

#pl <- ggplot(df.train, aes(Fare)) + geom_histogram(fill='green', color='black', alpha=0.5)
#print(pl)

#pl <- ggplot(df.train, aes(Pclass,Age)) 
#pl2 <- pl + geom_boxplot(aes(group=Pclass, fill=factor(Pclass), alpha=0.4))
#pl3 <- pl2 + scale_y_continuous(breaks=seq(min(0), max(80),by=2))
#pl4 <- pl3 + theme_bw()
#print(pl4)

##IMPUTATION OF AGE BASED ON CLASS
imputeAge <- function(age, class){
  out <- age
  for(i in 1:length(age)){
    if(is.na(age[i])){
      if(class[i] == 1){
        out[i] <- 37
      }else if(class[i] == 2){
        out[i] <- 29
      }else{
        out[i] <- 24
      }
    }else{
      out[i] <- age[i]
    }
  }
  return (out)
}

fixed.ages <- imputeAge(df.train$Age, df.train$Pclass)

df.train$Age = fixed.ages

#mmp <- missmap(df.train, main='Imputation check', col=c('yellow','black'), legend=FALSE)

#print(mmap)
print(str(df.train))

library(dplyr)
#removing the coloumn -PassengerId, -Name, -Ticket, -Cabin from data set
df.train <- select(df.train, -PassengerId, -Name, -Ticket, -Cabin)
print(head(df.train))
#Removed columns would not be displayed.
print(str(df.train))

df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)

#check the continuous data, after modifing into factor
print(str(df.train))

#logistic regression
log.model <- glm(formula=Survived ~ . , family=binomial(link='logit'), data=df.train)



print(summary(log.model))

library(caTools)

set.seed(101)
split <- sample.split(df.train$Survived, SplitRatio = 0.7)

final.train <- subset(df.train, split==TRUE)
final.test <- subset(df.train, split==FALSE)

final.log.model <- glm(formula=Survived ~ ., family=binomial(link='logit'), data=final.train)
print("summary on trained model...")
print(summary(final.log.model))

print("predicting....")
fitted.probabilites <- predict(final.log.model, final.test, type='response')

fitted.results <- ifelse(fitted.probabilites > 0.5, 1,0)
misClassError <- mean(fitted.results != final.test$Survived)

print(1-misClassError)

#Confustion matrix

print(table(final.test$Survived, fitted.probabilites>0.5))















