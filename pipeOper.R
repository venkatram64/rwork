library(dplyr)

df <- mtcars

#ad <- arrange(sample_n(filter(df, mpg > 20), size=5), desc(mpg))
#print(ad)

a <- filter(df, mpg > 20)
b <- sample_n(a, size=5)
result <- arrange(b, desc(mpg))
print(result)

print("another easy way with pipe operator")

result <- df %>% filter(mpg>20) %>% sample_n(size=5) %>% arrange(desc(mpg))
print(result)

