library(ggplot2)
library(ggplot2movies)

#install.packages('hexbin')


pl <- ggplot(movies,aes(x=year, y=rating))

#pl2 <- pl + geom_bin2d(binwidth=c(3,1)) + scale_fill_gradient(high='red', low='green')

#pl2 <- pl + geom_hex(binwidth=c(3,1)) + scale_fill_gradient(high='red', low='green')

pl2 <- pl + geom_density2d() 

print(pl2)