
#Quesiton 1
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,"./data/question1.csv",method="curl")
data <- read.csv("./data/question1.csv")
names <- strsplit(names(data),"wgtp")
names[[123]]

#Question 2
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url,"./data/question2.csv",method="curl")
data <- read.csv("./data/question2.csv",skip=4)
data$X.4 <- as.numeric(gsub(",","",data$X.4))
data <- data[!is.na(data$X.4)&data$X.1!="",]
mean(data$X.4)

#Question 4
gdpurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
edurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
gdp <- read.csv(gdpurl,skip=4)
ed <- read.csv(edurl)

gdp$X.4 <- as.numeric(gsub(",","",gdp$X.4))
gdp <- gdp[!is.na(gdp$X.4)&gdp$X.1!="",]
merged = merge(gdp,ed,by.x="X",by.y="CountryCode",all=FALSE)
merged <- merged[!is.na(merged$X.4)&merged$X!="",]
fiscal <- grep("^Fiscal year end: June",merged$Special.Notes,value = TRUE)
length(fiscal)

#Question 5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
no2012 <- year(sampleTimes) == 2012
table(no2012)
no2012Mon <- (year(sampleTimes) == 2012) & (wday(sampleTimes) == 2)
table(no2012Mon)