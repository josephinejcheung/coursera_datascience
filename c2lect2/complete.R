complete <- function(directory, id = 1:332) {
  old.dir <- getwd()
  setwd(directory)
  
  df <- data.frame(id = integer(), nobs = integer())
  for (i in id) {
    file = list.files()[i]
    filedata <- read.csv(file)
    com_sulfate <- is.na(filedata[,"sulfate"]) 
    com_nitrate <- is.na(filedata[,"nitrate"]) 
    #print (com_nitrate[1:10])
    complete <- filedata[,"ID"][!com_sulfate & !com_nitrate]
    #print(complete)
    df_i <- data.frame(id = i, nobs = length(complete))
    df <- rbind(df, df_i)
    
  }
  
  setwd(old.dir)
  df
}