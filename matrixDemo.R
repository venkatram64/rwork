goog <- c(450, 441, 345, 446, 234)
msft <- c(234, 345, 543, 231, 341)

stocks <- c(goog, msft)
print(stocks)

stock.matrix <- matrix(stocks, byrow=T, nrow=2)

days <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')
st.names <- c('GOOG', 'MSFT')

colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names

print(stock.matrix)