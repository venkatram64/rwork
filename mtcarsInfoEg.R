someCols = head(mtcars)
print(someCols)

print(mtcars$mpg)
print("different way...")
print(mtcars[, 'mpg'])
print("different way...")
print(mtcars[,1])
print("different way...")
print(mtcars[['mpg']])

somePartDF = mtcars['mpg']
print(somePartDF)

print("partial data...")
print(head(mtcars[c('mpg', 'cyl')]))


print(mtcars[mtcars$mpg > 20,])

print(mtcars[(mtcars$mpg > 20 & mtcars$cyl == 6),])

print(mtcars[(mtcars$mpg > 20 & mtcars$cyl == 6),c('mpg', 'cyl','hp')])
print("another way...")
print(subset(mtcars, mpg > 20 & cyl == 6))

print(mtcars[, c(1,2,3)])

print("check for missing data...")
print(is.na(mtcars))

print(any(is.na(mtcars)))

print(any(is.na(mtcars$mpg)))



