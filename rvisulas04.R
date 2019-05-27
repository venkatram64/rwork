library(ggplot2)
df <- mtcars

#print(df)

pl <- ggplot(df,aes(x=factor(cyl), y=mpg))

pl2 <- pl + geom_boxplot(aes(fill=factor(cyl))) 


print(pl2)