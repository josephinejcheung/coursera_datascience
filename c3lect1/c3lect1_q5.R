c1<- function(DT) {
  DT[,mean(pwgtp15),by=SEX]
}
c2<- function(DT) {
  mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
}
c3<- function(DT) {
  tapply(DT$pwgtp15,DT$SEX,mean)
}
c4<- function(DT) {
  mean(DT$pwgtp15,by=DT$SEX)
}
c5<- function(DT){
  rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
}
c6 <- function(DT){
  sapply(split(DT$pwgtp15,DT$SEX),mean)
}