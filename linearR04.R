adult <- read.csv('adult_sal.csv')

#print(head(adult))
#structure of the data set
#print(str(adult))

library(dplyr)
adult <-select(adult, -X)

#print(head(adult))
#structure of the data set
#print(str(adult))

#frequency
print(table(adult$type_employer))

#data cleaning
#combining employer type

unemp <-function(job){
  job <- as.character((job))
  if(job == 'Never-worked' | job == 'Without-pay'){
    return('Unemployed')
  }else{
    return(job)
  }
}

#apply

adult$type_employer <- sapply(adult$type_employer, unemp)
#print(table(adult$type_employer))

#Group self employed and state and local

group_emp <-function(job){
  job <- as.character((job))
  if(job == 'Local-gov' | job == 'State-gov'){
    return('SL-gov')
  }else if(job == 'Self-emp-inc' | job == 'Self-emp-not-inc'){
    return('self-emp')
  }else{
    return(job)
  }
}

adult$type_employer <- sapply(adult$type_employer, group_emp)
#print(table(adult$type_employer))

#marital status

print(table(adult$marital))

group_marital <-function(mar){
  mar <- as.character(mar)
  #Not-Married
  if(mar == 'Separated' | mar == 'Divorced' | mar == 'Widowed'){
    return('Not-Married')
    #Never-Married
  }else if(mar == 'Never-married'){
    return(mar)
    #Married
  }else{
    return('Married')
  }
}

#Apply
adult$marital <- sapply(adult$marital, group_marital)
#print(table(adult$marital))

#Country column data clean
#print(table(adult$country))


Asia <- c('China','Hong','India','Iran','Cambodia','Japan', 'Laos' ,
          'Philippines' ,'Vietnam' ,'Taiwan', 'Thailand')

North.America <- c('Canada','United-States','Puerto-Rico' )

Europe <- c('England' ,'France', 'Germany' ,'Greece','Holand-Netherlands','Hungary',
            'Ireland','Italy','Poland','Portugal','Scotland','Yugoslavia')

Latin.and.South.America <- c('Columbia','Cuba','Dominican-Republic','Ecuador',
                             'El-Salvador','Guatemala','Haiti','Honduras',
                             'Mexico','Nicaragua','Outlying-US(Guam-USVI-etc)','Peru',
                             'Jamaica','Trinadad&Tobago')
Other <- c('South')



group_country <- function(ctry){
  if(ctry %in% Asia){
    return('Asia')
  }else if(ctry %in% North.America){
    return('North.America')  
  }else if(ctry %in% Europe){
    return('Europe')  
  }else if(ctry %in% Latin.and.South.America){
    return('Latin.and.South.America')  
  }else{
    return('Other')
  }
}

adult$country <- sapply(adult$country, group_country)
#print(table(adult$country))



#print(str(adult))

#Missing data analysis
library(Amelia)

adult[adult == '?'] <- NA
#print(table(adult$type_employer))

#Factor

adult$type_employer <- sapply(adult$type_employer, factor)
adult$country <- sapply(adult$country, factor)
adult$marital <- sapply(adult$marital, factor)

print(table(adult$type_employer))
#missing data plot
#missmap(adult)

#missmap(adult, y.at=c(1), y.labels = c(''), col=c('yellow','black'))

#drop missing data
adult <- na.omit(adult)

#missmap(adult, y.at=c(1), y.labels = c(''), col=c('yellow','black'))

library(ggplot2)
#pl <- ggplot(adult, aes(age)) 
#pl2 <- pl + geom_histogram(aes(fill=income), color='black', binwidth = 1)
#pl3 <- pl2 + theme_bw()
#print(pl3)

#pl <- ggplot(adult, aes(hr_per_week)) 
#pl2 <- pl + geom_histogram()
#pl3 <- pl2 + theme_bw()
#print(pl3)

print(head(adult))





















