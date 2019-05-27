library(ggplot2)
library(data.table)
library(ggthemes)

df <- fread('Economist_Assignment_Data.csv',drop=1)

#print(head(df))
pointsToLabel <-c("Russia", "Venezuela","Iraq", "Myanmar","Sudan",
                  "Afghanistan","Congo","Greece", "Argentina","Brazil",
                  "India","Italy","China","South Africa","Spane",
                  "United States", "Germany","Norway", "Japan","Bhutan",
                  "New Zealand", "Singapore")

pl <- ggplot(df,aes(x=CPI, y=HDI, color=Region))

#pl2 <- pl + geom_point(aes(color=factor(Region)))

pl2 <- pl + geom_point(size=4, shape=1)

pl3 <- pl2 + geom_smooth(aes(group=1), method = 'lm', formula = y~log(x),se=F, color='red')

pl4 <- pl3 + geom_text(aes(label=Country),color="gray20",data=subset(df,Country %in% pointsToLabel), check_overlap=TRUE)

pl5 <- pl4 + scale_x_continuous(limits = c(.9, 10.5),breaks = 1:10) + theme_economist_white()

print(pl5)
