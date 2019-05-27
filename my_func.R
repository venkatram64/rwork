hello <- function(name="Venkatram"){
  print(paste("Hello,", name))
}

hello("Srijan")


addNumbers <- function(num){
  my.sum <- 0
  for(n in 1:num){
    my.sum <- my.sum + n
  }
  return (my.sum)
}

print(addNumbers(10))

num_check <- function(n, v){
  for(e in v){
    if(e == n){
      return (TRUE)
    }
  }
  return(FALSE)
}

print(num_check(4, c(12,3,5,8)))

count_check <- function(n, v){
  count <- 0
  for(e in v){
    if(n == e){
      count <- count + 1
    }
  }
  return (count)
}

print(count_check(4, c(3,3,4,4,4,5,7)))

print("bar count")
bar_count <- function(pack){
  amount.of.ones <- pack %% 5
  amount.of.fives <- (pack - amount.of.ones)/5
  return (amount.of.ones + amount.of.fives)
}

print(bar_count(16))


my_summer <- function(a, b, c){
  out <- c(0)
  if(a%%3 != 0){
    out<- append(a, out)
  }
  
  if(b%%3 != 0){
    out<- append(b, out)
  }
  
  if(c%%3 != 0){
    out<- append(c, out)
  }
  
  return (sum(out))
}

print(my_summer(4,6,8))


prime_check <- function(num){
  if(num == 2){
    return(TRUE)
  }
  
  for(x in 2:(num-1)){
    if(num%%x == 0){
      return (FALSE)
    }
  }
  return (TRUE)
}

print(prime_check(7))

