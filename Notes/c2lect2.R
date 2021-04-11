#if 
if (1 < 2) {
  print ("1 is less than 2")
}

#for
x <- c("a","b","c","d")
for (i in 1:4) {
  print (x[i])
  #can also use next function in a for loop
}

#nested for loop
x<-matrix (1:6,2,3)
for (i in seq_len(nrows(x))){for (j in seq_lens(ncol(x))){
  print (x[i,j])
}}

#while
count <-0
while (count < 10) {
  print (count)
  count <- count + 1
}

#repeat 
x0<- 1
tol <- 1e-8
repeat {
  #run computation of estiamte 
  #if estimate is converging then break, else repeat 
  break
}
#usually use for loop instead of repeat for defined number of iterations

#------------------------------

#Functions
add2 <- function (x,y) {
  x + y
}

#specify default function for n 
aboven <- function (x,n = 10) {
  use <- x>n # vector identifying elements greater than 10
  x[use]
}

columnmean <- function (y,removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc) #empty column created
  for (i in 1:nc){
    means[i] <- mean(y[,i],na.rm =removeNA)
  }
  means
}

#Question 3
f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}