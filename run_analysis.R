#
# Matthew Mariano
# 2015-03-22 
# Getting And Cleaning Data Project
#
#
# PREPROCESSING
# It is easiest to format the raw data from the command line (linux in this case) so it mey be read in easily.
# cat X_test.txt|sed -e 's/^  //g'|sed -e 's/^ //g'|sed -e 's/  / /g'|sed -e 's/ /,/g' > X_test.csv
# repeat for training set

# load sqldf. this gives an sql syntax for selecting ,grouping, ordering and performing aggregate functions like mean(or avarage) over columns
# in a data frame.
message("running the analysis. lodaing required libraries, setting global variables")
library(sqldf)
dir="ucihar-data";
#
# return a table 
#
message("defining useful functions")
getTable<-function(fname)
{
  read.table(paste(dir,"/",fname,sep=""))
}
#
# remove the () and make column names readable by inserting a _ between all of the abbreviated words and
# putting the result in lower case.
#
rename=function(x){
  ret="";
  lastchar="-"
  x=gsub("()","",x=x,fixed=T)
  for(i in 1:nchar(x)){
    c=substr(x,i,i);
    delim="";
    if(lastchar!="-" & c!="-" & c==toupper(c)){
      delim="-"
    }
    ret=paste(ret,delim,c,sep="")
    lastchar=c
  }
  ret=gsub("-","_",ret)
  tolower(ret)
}
#
# return the sql statement for avaerging(taking the mean), over all of the measurement columns , grouping by subject and activity
# and finally sorting the results by subject and activity. 
#
 getSql=function(cnames){
  ret=""
  comma=""
  for(i in 3:length(cnames)){
    n=cnames[i]
    ret=paste(ret,comma,"avg(",n,")",sep="")
    comma=","
  }
  ret=paste("SELECT subject,activity, ",ret," FROM alldata GROUP BY subject, activity ORDER BY subject, activity",sep="")
  ret
}
message("get all data sets and create extracted features")
alabels=getTable("activity_labels.txt")
features=getTable("features.txt")
#
# pull out just the mean and std columns and store the logical indices in x
#
x=grep("mean|std",features[,2])
cnames=features[x,2];
#
# create a dataset showing the selected columns with the old names and the new names
# this is useful for the codebook
#
oldnew=cbind(c(seq(1:length(x))),x,as.character(features[x,2]),sapply(as.character(features[x,2]),rename,USE.NAMES=F))
colnames(oldnew)=c("id","index","old-name","new-name")
# read in all of the relevant training data
# note since training data sets can be very large , it is useful to start with a small subset of the data,
# the clause nrows=nrow(train) assures that the associated data sets will be read correctly regardless of whether
# we chose to subset the data or not.
train=read.table(paste(dir,"/","train/X_train.csv",sep=""),sep=",",header = F)
train_subjects=read.table(paste(dir,"/","train/subject_train.txt",sep=""),sep=",",header = F,col.names = c("subject"),nrows=nrow(train))
train_activities=read.table(paste(dir,"/","train/y_train.txt",sep=""),sep=",",header = F,col.names = c("activity"),nrows=nrow(train))
train_activities=sapply(train_activities,function(x){as.character(alabels[x,2])})

# similarly read in the test data
test=read.table(paste(dir,"/","test/X_test.csv",sep=""),sep=",",header = F)
test_subjects=read.table(paste(dir,"/","test/subject_test.txt",sep=""),sep=",",header = F,col.names = c("subject"),nrows=nrow(test))
test_activities=read.table(paste(dir,"/","test/y_test.txt",sep=""),sep=",",header = F,col.names = c("activity"),nrows=nrow(test))
test_activities=sapply(test_activities,function(x){as.character(alabels[x,2])})

#subset the train and test data to look at only the columns of interest
train=train[,x]
test=test[,x]
#
# make the column names friendly or readable.
#
cnames=sapply(cnames,FUN = rename)
cnames
colnames(train)=cnames
colnames(test)=cnames
#
# bind the column vectors subjects and activity to their respective data set.
# I prefer to prepend subject and activity so those columns appear first
#
message("bind subjects and activities to the training and test datasets")
train=cbind(train_subjects,train_activities,train)
test=cbind(test_subjects,test_activities,test)
#
# row bind the train and test data.
# 
#
message("bind the updated training and test data sets")
alldata=rbind(train,test)
#
# generate a sql text statement for grouping by subject , activity and performing the average of each variable over that group.
#
sql=getSql(cnames)
#
# execute the sql and store the tidy result set in tidy 
#
message("generate teh tidy dataset")
tidy=sqldf(sql)
#
# sqldf changed the column names by surrounding each of the friendly names (we previously generated) with avg()
# for example , the first measurement column has the name avg(t_body_acc_mean_x).
# we want to remove the avg(). 
#
message("rename the tidy columns and output the dataset to file")
cnames=colnames(tidy);
cnames=gsub("avg(","",cnames,fixed=T)
cnames=gsub(")","",cnames,fixed=T)
colnames(tidy)=cnames
#
# the tidy data set is ready to be written.
#
write.table(tidy,file="tidy.txt",col.names=T,sep=",",row.names=F)



