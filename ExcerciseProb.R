A <- c(1,2,3)
B <- c(4,5,6)

c.bind <- cbind(A,B)
print(c.bind)

r.bind <- rbind(A, B)
print(r.bind)

#q 2

mat <- matrix(1:9, byrow=TRUE, nrow=3)
print(mat)

#

print(is.matrix(mat))
#

mat2 <- matrix(1:25, byrow=T, nrow=5)

print(mat2)

#

print(mat2[2:3, 2:3])

#
print(mat2[4:5, 4:5])

# 7
s.m <- sum(mat2)
print(s.m)

print(colSums(mat2))
print(rowSums(mat2))

#help(runif)
print(runif(20))

print(runif(20, min=0,max=100))

mat3 <- matrix(runif(20),nrow=4)
print(mat3)