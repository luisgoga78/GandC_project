

xtrain<-read.table("X_train.txt")

features<-read.table("features.txt")

v<-as.character(features$V2)

names(xtrain)<-v


sub<-read.table("subject_train.txt")
setnames(sub,"V1","sujeto")

ytrain<-read.table("y_train.txt")
setnames(ytrain,"V1","actividad")


xtest<-read.table("X_test.txt")
names(xtest)<-v

sub2<-read.table("subject_test.txt")
setnames(sub2,"V1","sujeto")

ytest<-read.table("y_test.txt")
setnames(ytest,"V1","actividad")

tabla1<-cbind(ytrain,xtrain)
tabla2<-cbind(sub,tabla1)

tabla3<-cbind(ytest,xtest)
tabla4<-cbind(sub2,tabla3)

tablon<-rbind(tabla2,tabla4)

tablon[which(tablon$actividad==1),]$actividad <- 'WALKING'
tablon[which(tablon$actividad==2),]$actividad <- 'WALKING_UPSTAIRS'
tablon[which(tablon$actividad==3),]$actividad <- 'WALKING_DOWNSTAIRS'
tablon[which(tablon$actividad==4),]$actividad <- 'SITTING'
tablon[which(tablon$actividad==5),]$actividad <- 'STANDING'
tablon[which(tablon$actividad==6),]$actividad <- 'LAYING'

solucion<-tablon[,grepl('mean',colnames(tablon))|grepl('std',colnames(tablon))|grepl('sujeto',colnames(tablon))|grepl('actividad',colnames(tablon))]

datat <- data.table(solucion)

datat.agg <- datat[, lapply(.SD, mean), by=c("sujeto","actividad")]

data.agg





