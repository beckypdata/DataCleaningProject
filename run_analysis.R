# Read the datasets

xtest <- read.table("test\\X_test.txt")
ytest <- read.table("test\\Y_test.txt")
stest <- read.table("test\\subject_test.txt")
xtrain <- read.table("train\\X_train.txt")
ytrain <- read.table("train\\Y_train.txt")
strain <- read.table("train\\subject_train.txt")
activities <- read.table("activity_labels.txt")
colnames(activities) <- c("ID", "Activity")

# read features.txt, cleanup text to valid and descriptive R variable naming

features <- read.table("features.txt", stringsAsFactors=FALSE) 
for (i in which(duplicated(features$V2)==TRUE)) features$V2[i] <- sprintf("%s_%3d", features$V2[i], i) 
features$V2 <- gsub("fBodyBody","fBody",features$V2) 
features$V2 <- gsub("fBody","FreqDomainBody",features$V2) 
features$V2 <- gsub("tBody","TimeDomainBody",features$V2) 
features$V2 <- gsub("fGravity","FreqDomainGravity",features$V2) 
features$V2 <- gsub("tGravity","TimeDomainGravity",features$V2) 
features$V2 <- gsub("Acc","Accelerometer",features$V2) 
features$V2 <- gsub("Gyro","Gyroscope",features$V2) 
features$V2 <- gsub("[-,)(]","_",features$V2) 
features$V2 <- gsub("__","",features$V2)
features$V2 <- gsub("_$","",features$V2)

# Merge the datasets and calculate summary statistics 

subjdata <- bind_rows(strain,stest)
colnames(subjdata) <- "Subject"
actdata <- bind_rows(ytrain,ytest)
colnames(actdata) <- "ID"
msrdata <- bind_rows(xtrain,xtest) 
colnames(msrdata) <- features$V2
resultdata <- bind_cols(subjdata, actdata, msrdata) %>%
  merge(activities,all=TRUE) %>%
  select(Subject, Activity, contains("mean"), contains("std")) %>%
  select(-contains("angle")) %>%
  arrange(Subject,Activity) %>%
  group_by(Subject, Activity) %>%
  summarise_each(funs(mean))

# write the tidy dataset

write.table(gresult, "tidydata.txt", row.names=FALSE)





