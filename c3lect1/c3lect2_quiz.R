url <- "http://biostat.jhsph.edu/~jleek/contact.html"
##Method 1
con = url(url)
htmlCode = readLines(con)
close(con)

##Method 2
#library(XML)
#html <- htmlParse(url,useInternalNodes=T)

library(httr)
html = GET(url)
content = content(html,as="text")
parsedHtml = htmlParse(content,asText = TRUE)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"