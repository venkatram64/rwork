df1 <- read.csv('winequality-red.csv', sep=";")
df2 <- read.csv('winequality-white.csv', sep=';')

#print(df1)
df1$label <- sapply(df1$pH, function(x){'red'})
#print(head(df1))

df2$label <- sapply(df2$pH, function(x){'white'})
print(head(df2))

#combine two dataset
wine <- rbind(df1, df2)

library(ggplot2)
pl <- ggplot(wine, aes(residual.sugar)) 
pl2 <- pl + geom_histogram(aes(fill=label), color='black', bins=50)
pl3 <- pl2 + scale_fill_manual(values=c('#ae4554','#faf7ea'))
#print(pl3)

pl <- ggplot(wine, aes(citric.acid)) 
pl2 <- pl + geom_histogram(aes(fill=label), color='black', bins=50)
pl3 <- pl2 + scale_fill_manual(values=c('#ae4554','#faf7ea'))
#print(pl3)


pl <- ggplot(wine, aes(alcohol)) 
pl2 <- pl + geom_histogram(aes(fill=label), color='black', bins=50)
pl3 <- pl2 + scale_fill_manual(values=c('#ae4554','#faf7ea'))
#print(pl3 + theme_bw())


pl <- ggplot(wine, aes(citric.acid, residual.sugar)) 
pl2 <- pl + geom_point(aes(color=label), alpha=0.5)
pl3 <- pl2 + scale_fill_manual(values=c('#ae4554','#faf7ea'))
#print(pl3 + theme_dark())


pl <- ggplot(wine, aes(volatile.acidity, residual.sugar)) 
pl2 <- pl + geom_point(aes(color=label), alpha=0.5)
pl3 <- pl2 + scale_fill_manual(values=c('#ae4554','#faf7ea'))
#print(pl3 + theme_dark())

#on the basis bove results we can use volatile.acidity, residual.sugar

clus.data <- wine[,1:12]
print(head(clus.data))

wine.cluster <- kmeans(clus.data, 2)
print(wine.cluster$centers)


print(table(wine$label, wine.cluster$cluster))













