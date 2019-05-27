df <- mtcars
print(head(df))

cdf <- df[df$mpg > 20,]
print(cdf)

cdf <- df[df$mpg > 20, 'mpg']
print(cdf)

cdf <- subset(df, mpg > 20)
print(cdf)

cdf <- df[(df$mpg > 20) & (df$hp > 100), ]
print(cdf)