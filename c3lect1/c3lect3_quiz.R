
#Question 1
url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,"./data/question1.csv",method ="curl")
#list.files("./data")

data <- read.csv("./data/question1.csv")
library(dplyr)

agriculturalLogical <- data["ACR"] ==3 & data["AGS"] == 6

#Question 2
url <- " https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
#download.file(url,"./data/jeff.jpg",mode = "wb", method = "curl")
pic <- readJPEG("./data/getdata_jeff.jpg")

#Quesiton 3
gdpurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
edurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
gdp <- read.csv(gdpurl,skip=4)
ed <- read.csv(edurl)

gdp <- gdp[gdp$X.1!="",]
merged = merge(gdp,ed,by.x="X",by.y="CountryCode",all=FALSE)
merged <- merged[!is.na(merged$X.4)&merged$X!="",]
merged$X.4 <- as.numeric(gsub(",","",merged$X.4))
merged$X.1 <- as.numeric(merged$X.1)
merged <- arrange(merged,X.4)

head(select(merged,X,X.4,Short.Name),20)
sapply(split(merged$X.1,merged$Income.Group),mean)

merged <- arrange(merged, X.1)
head(select(merged,Income.Group,X.1,Short.Name),38)

