library(ggplot2)
library(dplyr)

bike <- read.csv('bikeshare.csv')

#print(head(bike))

#print(str(bike))

#pl <- ggplot(bike, aes(temp, count)) + geom_point(alpha=0.3, aes(color=temp))

#pl2 <- pl + theme_bw()
#print(pl2)

#convert to timestamp
bike$datetime <- as.POSIXct(bike$datetime)

#pl <- ggplot(bike, aes(datetime, count)) + geom_point(alpha=0.5, aes(color=temp))

#pl2 <- pl + scale_color_continuous(low='#55D8CE', high='#FF6E2E') + theme_bw()
#print(pl2)

bike.cor <- cor(bike[, c('temp', 'count')])
print(bike.cor)

#pl <- ggplot(bike, aes(factor(season), count)) + geom_boxplot(aes(color=factor(season)))
#pl2 <- pl + theme_bw()

#print(pl)

#FEATURE ENGINEERING

#time.stamp <- bike$datetime[4]
#format(time.stamp, '%H')

bike$hour <- sapply(bike$datetime, function(x){ format(x,'%H')})

#new column is added hour
print(bike)

#scatterplot
#pl <- ggplot(filter(bike, workingday==1), aes(hour, count))
pl <- ggplot(filter(bike, workingday==0), aes(hour, count))
#pl2 <- pl + geom_point(aes(color=temp)) 
pl2 <- pl + geom_point(position=position_jitter(w=1, h=0),aes(color=temp),alpha=0.5) 
pl3 <- pl2 + scale_color_gradientn(colours = c('dark blue', 'blue', 'light blue', 'light green', 'yellow', 'orange','red'))
pl4 <- pl3 + theme_bw()
#print(pl4)

#building model
#preding count
bike$hour <- sapply(bike$hour, as.numeric)
#temp.model <- lm(count ~ temp, bike)

##
print("Summary data: ")
#print(summary(temp.model))
# . all the columns minus casual ,registered ,datetime and atemp
model <- lm(count ~ . -casual -registered -datetime -atemp, bike)
print(summary(model))

# How many bike rental counts at 25C

# 6.0462 + 9.17 * 25









