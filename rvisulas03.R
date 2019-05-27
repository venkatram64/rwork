library(ggplot2)
df <- mpg

#print(df)

pl <- ggplot(df,aes(x=class))

#pl2 <- pl + geom_bar(aes(fill=drv))

pl2 <- pl + geom_bar(aes(fill=drv), position = 'dodge')

print(pl2)