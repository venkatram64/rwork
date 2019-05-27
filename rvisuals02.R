library(ggplot2)
df <- mtcars

#DATA & AESTHETICS

pl <- ggplot(df, aes(x=wt, y=mpg))

#GEOMETRY

#print(pl + geom_point(aes(size=factor(cyl))))
#print(pl + geom_point(aes(shape=factor(cyl),color=factor(cyl)),size=5))
#print(pl + geom_point(size=5,color='#111f8b'))
pl2 <- pl + geom_point(aes(color=hp),size=5)
pl3 <- pl2 + scale_color_gradient(low='blue', high='red')
print(pl3)