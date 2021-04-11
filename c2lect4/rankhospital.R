
rankhospital <- function(state,outcome,num) {
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
  #Define state
  data_s <- data[data$State == state,]
  if(nrow(data_s)==0){
    error("State not valid, please re-enter")
  }
  
  #Define outcome column
  if (outcome == "heart attack"){col <- 11}
  else if (outcome == "heart failure"){col <- 17}
  else if (outcome == "pneumonia"){col <-23}
  else {
    error("Outcome not valid, please re-enter")
  }
 
  df <- data.frame(Hospital.Name = data_s[,2], Rate = as.numeric(data_s[,col]))
  df <- df[order(df[,2],df[,1],na.last=NA),]
  

  #Define rank
  if (num == "best") {rank <- 1}
  else if (num =="worst") {rank <- nrow(df)}
  else if (is.numeric(num) & num <= nrow(df)) {rank <- num}
  else {
    error("Rank not valid, please re-enter")
  }
  
  df[rank,1]

  
}