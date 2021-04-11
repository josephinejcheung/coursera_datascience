#c3lect3_dplyr

library(dplyr)
dim(data)
str(data)
names(data)
head(select(data, city:dptp))
head(select(data, -(city:dptp)))
#filtering
df<- filter(data, column1 > 30&column2> 30)

#arrange
data<- arrange(data, column1)
data<- arrange(data, desc(column1))

#rename
data<- rename(data, column1 = col1)

#mutate
data <- mutate(data,avg = col1-mean(col1,na.rm=TRUE))

#group by / summarise
df <- groupby(data,col1)
summarize (df, col1 = mean(col1), col2 = max(col2))
