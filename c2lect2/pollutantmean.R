pollutantmean <- function (directory, pollutant, id = 1:332) {
  old.dir <- getwd()
  setwd(directory)
  
  #data <- data.frame(Date="1990-0", sulfate=0, nitrate=0, ID=0)
  for (i in id){
    file = list.files()[i]
    filedata <- read.csv(file)
    if (i != id[1]){
      data <- rbind(data,filedata)
      #print(i, nrow(data))
    }
    else {
      data <- filedata
      #print(i, nrow(data))
    }
    
  }
  setwd(old.dir)
  mean(data[,pollutant], na.rm = TRUE)
}