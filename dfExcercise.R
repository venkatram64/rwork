Name <- c('Sam', 'Frank', 'Amy')
Age <- c(22, 25, 26)
Weight <- c(150, 165, 120)
Sex <- c('M', 'M', 'F')

df <- data.frame(row.names = Name, Age, Weight, Sex)
print(df)

rownames(df) <- c('A', 'B', 'C')
print(df)

print(is.data.frame(mtcars))

mat <- matrix(1:25, nrow=5)
print(mat)
print("data frame as mat")
print(as.data.frame(mat))

df <- mtcars
print(df)

print(mean(df$mpg))

print(df[df$cyl == 6, ])

print(subset(df, cyl == 6))

print(df[, c('am', 'gear', 'carb')])
print("added column data...")
df$performance <- df$hp/df$wt
print(df)

print("added rounding column data...")
df$performance <- round(df$hp/df$wt, digits=2)
print(df)
print("filtered data...")
print(subset(df, hp>100 & wt>2.5))

print("filtered mean data...")
print(mean(subset(df, hp>100 & wt>2.5)$mpg))

print("another way for mean")
print(mean(df[df$hp > 100 & df$wt > 2.5, ]$mpg))

print(df['Hornet Sportabout', ]$mpg)




