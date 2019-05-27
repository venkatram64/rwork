#for writing data into exel, dowload below one
#install.packages('xlsx')

library(xlsx)
write.xlsx(mtcars, "output_mtcars.xlsx")