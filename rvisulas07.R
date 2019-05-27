library(ggplot2)
library(ggthemes)
df <- mtcars

#theme_set(theme_minimal())
#install.packages('ggthemes')

pl <- ggplot(df,aes(x=wt, y=mpg))

#pl2 <- pl + geom_point() + theme_dark()

pl2 <- pl + geom_point() + theme_economist()



print(pl2)