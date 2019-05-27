library(dplyr)

df <- mtcars
print(df)

result <- filter(mtcars, mpg>20, cyl==6)
print(result)

result <- arrange(mtcars, cyl, desc(wt))
print(result)

result <- select(mtcars, mpg, hp)
print(result)

result <- distinct(select(mtcars, gear))
print(result)

result <- mtcars %>% select(gear) %>% distinct()
print(result)

result <- mutate(mtcars, performance=hp/wt)
print(result)

result <- summarise(mtcars, avg_mpg=mean(mpg))
print(result)

result <- mtcars %>% filter(cyl==6) %>% summarise(avg_hp=mean(hp))
print(result)









