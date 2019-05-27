v <- c(1,2,3)
m <- matrix(1:10, nrow=2)
df <-mtcars
print(class(v))
print(class(m))
print(class(df))
print("placing items into list..")
my.list <- list(v, m, df)
print(my.list)
print("labelling the list items...")
my.named.list <- list(sample.vec = v, my.matrix = m, sample.df = df)
print(my.named.list)

print("calling list items as label name...")
print(my.named.list$sample.df)

print("calling another list items as label name...")
print(my.named.list[['sample.df']])