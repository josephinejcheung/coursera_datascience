#outcome <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
#outcome[,11] <-as.numeric(outcome[,11])
#hist(outcome[,11])

best <- function (state,outcome) {
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
  data_s <- data[data$State == state,]
  if(nrow(data_s)==0){
    error("State not valid, please re-enter")
  }

  if (outcome == "heart attack"){
    col <- 11
  }
  else if (outcome == "heart failure"){
    col <- 17
  }
  else if (outcome == "pneumonia"){
    col <-23
  }
  else {
    error("Outcome not valid, please re-enter")
  }
  rates <- as.numeric(as.character(data_s[,col]))

  min <- min(rates,na.rm=TRUE)
  print(min)
  hospital <- data_s[data_s[,col]==min,][,2]
  
  hospital
}