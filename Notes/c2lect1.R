#Lecture 1 notes

x <- 1
y <- 1:10
#number can include Inf and NaN
z1 <- 1 / Inf #prints 0
z2 <- 0/0 # prints NaN
a <- c(1,2,3) #vector
b <- list(1, "a", TRUE, 1+4i) #list

c <- matrix (1:6, nrow = 2, ncol = 3)
dim (c)
#can define vector like 1:10 and then assign dim
#can also bind cbind() rbind()

#Factors
d <- factor (c("yes","yes","no","yes","no"), levels = c("yes","no"))
table (d)
unclass(d) #convert it back to levels

#Missing values
x <-c(1,2,NA,NaN,3)
is.na(x) #missing values
is.nan(x) 

#Data frame
x<- data.frame(foo=1:4, bar = c(T,T,F,T))

#Names
x <-1:3
names(x) <- c("a","b","c") # name objeects 
y <- list(a=1,b=2,c=3)
z <- matrix(1:4, nrow=2, ncol=2)
dimnames(z)<- list(c("a","b"), c("c","d"))


#Reading data
#most common is read.table. Has attributes file, header, sep, colClasses, nrows,
#comment.char, skip, stringsAsFactors
data <- read.table("foo.txt",nrows=100)
#or read.csv for excel files
#can calculate how much memory do you need before runnign read.table

#dump and dput from R will preserve metadata i.e. what format they are in
y<-data.frame(a=1,b="a")
dput(y) #write r code so you can dget it later

#Connections
#file, gzfile (compressed data file), bzfile, url
con <-file("foo.txt","r")
data <-read.csv(con)
x<-readLines(con,10)
x
close(con)

#Subsetting
#single [ - subset vector, get back the same class
# double [[ can be used to extract single elements of a list or data frame
# $ used to extract elements of a list by name
x<-c("a","b","c")
x[1]
x[1:2]
x[x>"a"]
x<-matrix(1:6,2,3)
x[1,2] 
x[1,]
x[1,,drop=FALSE]

#Partial matching
x <- list(aardvark = 1.5)
x$a #works and matches anything with a
x[["a", exact = FALSE]] #double bracket is exact by default, need to set to false if partial matching

#remove missing values
x <- c(1,2,NA,4,NA)
bad <- is.na(x)
x[!bad]
#for two vectors or more, can use complete.cases
good <-complete.cases(x,y)

#Vectorised operations
#multiply, divide, add, subtrat is done in parallel for each element of the vecotr 
x<-matrix(1:4,2,2); y<- matrix(rep(10,4),2,2)
x*y #element multiplication
x %*% y #true matrix multiplication

