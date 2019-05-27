#R Reference Card

sample.numbers <- sample(x = 1:100, 5)
print(sample.numbers)

v <- c(1,2,3,4,5)
addrand <- function(x){
  ran <- sample(1:100, 1)
  return(x+ran)
}

result <- lapply(v, addrand)
print(result)

result <- sapply(v, addrand)
print(result)

v <- 1:5

times2 <- function(num){
  return (num * 2)
}

result <- sapply(v, times2)
print(result)

#anonymous function
print("anonymous function")
v<-1:5

result <- sapply(v, function(num){num*2})
print(result)

#apply with multiple inputs
add_choice <- function(num, choice){
  return(num + choice)
}

result <- sapply(v, add_choice, choice=100)
print(result)





