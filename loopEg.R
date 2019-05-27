
#https://www.import.io/

x <- 0

while(x < 10){
  print(paste0('x is: ', x))
  
  x <- x + 1
  if(x == 10){
    print("x is now equal to 10! Break Loop!")
  }
}

v <- c(1:20)
sum <- 0
for (value in v) {
  sum <- sum + value
}

print(sum)


mat <- matrix(1:25, nrow=5)
print(mat)

for(row in 1:nrow(mat)){
  for(col in 1:ncol(mat)){
    print(paste('The element at row: ', row, 'and: ', col, 'is ', mat[row, col]))
    
  }
}