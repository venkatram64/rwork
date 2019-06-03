#install.packages('rpart')
#install.packages('rpart.plot')

library(rpart)


print(head(kyphosis))

print(str(kyphosis))
fit <- rpart(formula=Kyphosis ~ ., data = kyphosis, method = 'class')

printcp(fit)

#pl <- plot(fit, uniform=T,main='kyphosis tree')
#print(pl)


#plt <- text(fit, use.n=T,all=T)
#print(plt)

library(rpart.plot)
pl <- prp(fit)
print(pl)
