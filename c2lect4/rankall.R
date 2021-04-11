rankall <- function(outcome, num = "best"){
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")

  #Define outcome column
  if (outcome == "heart attack"){col <- 11}
  else if (outcome == "heart failure"){col <- 17}
  else if (outcome == "pneumonia"){col <-23}
  else {
    error("Outcome not valid, please re-enter")
  }

  #Define rank
  decreasing <- FALSE
  if (num == "best") {rank <- 1}
  else if (num =="worst") {rank <- 1; decreasing <- TRUE}
  else if (is.numeric(num) & num <= nrow(df)) {rank <- num}
  else {
    error("Rank not valid, please re-enter")
  }
 
  df <- data.frame(state = data$State, hospital = data[,2], Rate = as.numeric(data[,col]))
  s<- split(df,df$state)
  
  output<- sapply(s,function(x) x[order(x[,3],x[,2],na.last=NA,decreasing = decreasing),][rank,])
  t(output)
  
}