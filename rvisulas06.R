library(ggplot2)
df <- mpg

#print(df)

pl <- ggplot(df,aes(x=displ, y=hwy))

pl2 <- pl + geom_point()

#pl3 <- pl2 + coord_cartesian(xlim = c(1,4),ylim = c(15,30))

#pl3 <- pl2 + coord_fixed(ratio = 1/3)

#pl3 <- pl2 + facet_grid(. ~ cyl)

#pl3 <- pl2 + facet_grid(drv ~ .)

pl3 <- pl2 + facet_grid(drv ~ cyl)

print(pl3)