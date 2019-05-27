library(ggplot2)
library(ggthemes)

df <-mpg

#pl <- ggplot(df,aes(x=hwy))

#pl2 <- pl + geom_histogram(bins=20, fill='red', alpha=0.5)

#print(pl2)

#pl <- ggplot(df,aes(x=manufacturer))

#pl2 <- pl + geom_bar(aes(fill=factor(cyl)), alpha=0.5)

#print(pl2)

df <- txhousing
#print(df)

pl <- ggplot(df,aes(x=sales, y=volume))

pl2<- pl + geom_point(color='blue', alpha = 0.3)

pl3 <- pl2 + geom_smooth(color='red')


print(pl3)
