
#Question 1
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, destfile = "./data/question1.csv", method = "curl")
list.files("./data")

data<- read.csv("data/question1.csv")
data_s <- split(data, data$VAL)
nrow(data_s$'24')


#Question 3
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx "
download.file(url, destfile = "./data/question3.xlsx", method = "curl")
library (xlsx)
rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx("./data/question3.xlsx",sheetIndex=1,colIndex=colIndex, rowIndex=rowIndex)


#Question 4
library(XML)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(url, destfile = "./data/question4.xml", method = "curl")
doc <-xmlTreeParse("./data/question4.xml", useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
zips <- xpathSApply(doc,"//zipcode",xmlValue)
zips <- as.numeric(zips)

#Question 5
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
DT <- fread(url)



