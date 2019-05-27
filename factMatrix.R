animal <- c('d','c', 'd', 'c', 'c')
id <- c(1,2,3,4,5)

fact.ani <- factor(animal)

print(fact.ani)

ord.cat <- c('cold', 'med', 'hot')

temps <- c('cold','med', 'hot', 'hot', 'hot', 'cold', 'med')

fact.temp <- factor(temps, ordered = T, levels = c('cold', 'med', 'hot'))

print(fact.temp)

s <- summary(fact.temp)

print(s)

sl <- summary(temps)
print(sl)