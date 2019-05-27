#clear screen ctrl+L

#install.packages('ggplot2')
#install.packages('ggplot2movies')
#rstudio ggplot cheat sheet
#https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

library(ggplot2)
library(ggplot2movies)

#data & aesthetics
df <- movies
#To know the column names, run the following 
#in console 
#library(ggplot2movies)
#colnames(movies)

pl <- ggplot(df, aes(x=rating))

#Geometry
#pl2 <- pl + geom_histogram(binwidth = 0.1, color='red',fill='blue',alpha=0.6)
pl2 <- pl + geom_histogram(binwidth = 0.1, aes(fill=..count..))


pl3 <- pl2 + xlab('Movie Rating') + ylab('Movie Count')

print(pl3 + ggtitle('My Title'))

