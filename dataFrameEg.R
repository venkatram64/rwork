empty <- data.frame()
c1 <- 1:10
c2 <- letters[1:10]
df <- data.frame(col.name.1=c1, col.name.2 = c2)
print(df)

print(nrow(df))
print(ncol(df))
print(colnames(df))
print(rownames(df))
print("accessing the data frame data...")
#print(df[[5,2]])
print(df[[5,'col.name.2']])

print("modifing the cell value...")
scell <- df[[2,'col.name.1']] <- 1000
print(scell)

print("writing and reading data from file...")
write.csv(df, file='saved_df.csv')

rdf <- read.csv(file='saved_df.csv')

print(rdf)

df2 <- data.frame(col.name.1 = 2000, col.name.2 = 'new')
print(df2)


dfnew <- rbind(df, df2)
print(dfnew)

print("adding new column...")
df$newcol <- 2*df$col.name.1
print(df)

print("another way to add new column...")
df[, 'newcol.copy2'] <- df$newcol
print(df)

print("getting colnames...")
print(colnames(df))

print("Renaming the column names...")
colnames(df)[1] <- 'new col name'
print(df)

print("selecting some rows")
print(df[1:4,])
print("selecting everything not 2nd row...")
print(df[-2,])

