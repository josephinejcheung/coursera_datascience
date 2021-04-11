#corr.R

corr <- function(directory, threshold = 0) {
  #calculate which files are above threshold from complete
  source("complete.R")
  df <- complete("specdata")
  thres_v <- df[,"nobs"] > threshold
  id <- df[,"id"][thres_v]
  
  print ("id")
  print(id)
  
  #get all data that are above hte threshold
  old.dir <- getwd()
  setwd(directory)
  
  print("extracting data from file..")
  list <- numeric(0)
  for (i in id){
    print (i)
    file = list.files()[i]
    filedata <- read.csv(file)
    data <- filedata[!is.na(filedata$sulfate) & !is.na(filedata$nitrate), ]
    
    x <- data[,"sulfate"]
    y <- data[,"nitrate"]
    print(cor(x,y))
    list <- c(list, cor(x,y))
    
  }
 
  setwd(old.dir)
  list

  
}