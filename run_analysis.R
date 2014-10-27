training<-read.table("X_train.txt")
testing<-read.table("X_test.txt")
mergedData<-merge(training,testing,all=TRUE)

mergedDataBackup<-merge(training,testing,all=TRUE)
#mergedData
features<-read.table("features.txt")
colName<-features[,2]
names(mergedData)<-colName
dataNames<-names(mergedData)

extData<-data.frame(rep(1,10299))
indexes<-vector()
for(i in 1:length(dataNames)){
   
   mean<-grepl("-mean()",dataNames[i])
   std<-grepl("-std()",dataNames[i])
   if( mean | std ){
      col<-mergedData[,i]
      extData<-cbind(extData,col)
      indexes<-c(indexes,dataNames[i])
   }
   
}

extData<-extData[,2:length(names(extData))]
names(extData)<-indexes

write.table(extData,row.names=FALSE)




