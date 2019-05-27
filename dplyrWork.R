#install.packages('dplyr')
#install data ->  install.packages('nycflights13')

library(dplyr)
library(nycflights13)

print(head(flights))

print(summary(flights))

# filter() and slice()
# arrange()
# select() and rename()
# distinct()
# mutate() and transmute()
# summarize()
# sample_n() and sample_frac()

fd <- filter(flights, month==11, day==3, carrier=='AA')
print(head(fd))
print("another way ")
fd <- flights[flights$month==11 & flights$day==3 & flights$carrier=='AA',]
print(head(fd))

fd <- slice(flights, 1:10)
print(fd)

print("arrange data")

fd <- head(arrange(flights, year, month, day, desc(arr_time)))
print(head(fd))

print("select")
fd <- head(select(flights, carrier, arr_time, month))
print(fd)

print("rename")
fd <- head(rename(flights, airline_carrier=carrier))
print(fd)

print("distinct")
fd <- distinct(select(flights,carrier))
print(fd)

print("mutate")
fd <- head(mutate(flights,new_col=arr_delay-dep_delay))
print(fd)

print("transmute")
fd <- head(transmute(flights,new_col=arr_delay-dep_delay))
print(fd)

print("summarise")
fd <- summarise(flights,avg_air_time=mean(air_time, na.rm=TRUE))
print(fd)

print("summarise")
fd <- summarise(flights,total_time=sum(air_time, na.rm=TRUE))
print(fd)

print("sample")
fd <- sample_n(flights,10)
print(fd)

print("sample_frac")
fd <- sample_frac(flights,0.1)
print(fd)






