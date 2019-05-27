days <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')

temp <- c(22.2, 21, 23, 24.3, 25)

rain <- c(T, T, F, F, T)

df <- data.frame(days, temp, rain)

print(df)

print(str(df))

print(summary(df))

partial.info <- df[1:5, c('days', 'temp')]
print(partial.info)

ss <- subset(df, subset=rain == TRUE)
print(ss)

ss <- subset(df, subset = temp > 23)
print(ss)

print("********")
sorted.temp <- order(df['temp'])
print(sorted.temp)

print(df[sorted.temp,])
desc.temp <- order(-df['temp'])
print(desc.temp)

print(df[desc.temp,])