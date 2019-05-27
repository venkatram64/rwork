#install.packages("RODBC")
library(RODBC)

myconn <- odbcConnect("",uid="", pwd)

dat <- sqlFetch(myconn, "tableName")
querydat <- sqlQuery(myconn, "Select * from table")
close(myconn)