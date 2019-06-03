#unsupervised alogorithm

library(ISLR)
print(head(iris))

library(ggplot2)

pl <- ggplot(iris, aes(Petal.Length, Petal.Width, color=Species))

pl2 <- pl + geom_point(size=4) + theme_bw()

#print(pl2)

set.seed(101)
irisCluster <- kmeans(iris[, 1:4], 3, nstart = 20)
print(irisCluster)

print(table(irisCluster$cluster, iris$Species))

library(cluster)
cp <- clusplot(iris, irisCluster$cluster, color=T,shade=T,labels=0,lines=0)
print(cp)

