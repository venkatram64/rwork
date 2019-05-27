mat <- matrix(1:25, byrow=T, nrow=5)

print(mat)

print(mat * 2)

mul <- mat %*% mat

print(mul)

mat <- matrix(1:50, byrow = T, nrow=5)

print(mat)

print(mat[1,])
print(mat[,2])

print(mat[1:3,])

print(mat[2:3, 5:6])
