ws.customer.data <- read.csv("Wholesale customers data.csv")
print(str(ws.customer.data))

library(ggplot2)
pl <- ggplot(ws.customer.data, aes(Grocery, Milk, color=Region))
pl2 <- pl + geom_point(size=4) + theme_bw()
#print(pl2)

set.seed(101)
wscd.cluster <- kmeans(ws.customer.data[,3:8],5, nstart = 20)

print(wscd.cluster)
print(wscd.cluster$centers)

print(table(ws.customer.data$Region,wscd.cluster$cluster))


rng <- 2:20 #K from 2 to 20
tries <- 100 #Run the K Means algorithm 100 times
avg.totw.ss <- integer(length(rng)) #Set up an empty vector to hold all of points
for(v in rng){ # For each value of the range variable
  v.totw.ss <- integer(tries) #Set up an empty vector to hold the 100 tries
  for(i in 1:tries){
    k.temp <- kmeans(ws.customer.data[,3:8],centers=v) #Run kmeans
    v.totw.ss[i] <- k.temp$tot.withinss   #Store the total withinss
  }
  avg.totw.ss[v-1] <- mean(v.totw.ss) #Average the 100 total withinss
}
plot(rng, avg.totw.ss, type="b", main="Total Within SS by Various K",
     ylab="Average Total Within Sum of Squares",
     xlab="Value of K")








