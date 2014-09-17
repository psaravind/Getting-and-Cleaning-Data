# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

# Download zip file

if (!file.exists("data")) {
    dir.create("data")
}

if (!file.exists("data/UCI HAR Dataset")) {
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  download.file(fileurl, destfile="./data/UCI_HAR_Dataset.zip")
  unzip("./data/UCI_HAR_Dataset.zip", exdir="data")
}

# load all data
trainx <- read.table("data/UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("data/UCI HAR Dataset/train/y_train.txt")

testx <- read.table("data/UCI HAR Dataset/test/X_test.txt")
testy <- read.table("data/UCI HAR Dataset/test/y_test.txt")

trainSubject <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
testSubject <- read.table("data/UCI HAR Dataset/test/subject_test.txt")

features <- read.table("data/UCI HAR Dataset/features.txt")

activity <- read.table("data/UCI HAR Dataset/activity_labels.txt")

# merge train and test data
data <- rbind(trainx, testx)

# set variable names

## clean variable names, remove '-()'

features$V2 <- gsub("[-()]", "", features$V2)
colnames(data) <- c(as.character(features$V2))
colnames(data) <- tolower(colnames(data))

# Extracts only the measurements on the mean and standard deviation for each measurement
data <- data[, grepl("mean|std", colnames(data))]

# merge subject data
mergeSubject <- rbind(trainSubject, testSubject)
names(mergeSubject) <- "subject"

# merge Activity data
mergeActivity <- rbind(trainy, testy)

# replace activity id's with activity labels
mergeActivity$activity <- activity[mergeActivity$V1,]$V2
mergeActivity$V1 <- NULL
names(mergeActivity) <- "activity"

# merge all data
data <- cbind(data, mergeSubject, mergeActivity)

# aggregate and calculate the mean for all columns by activity & subject and create tidyData
tidyData <- aggregate(data, by=list(Group.activity=data$activity, Group.subject=data$subject), FUN=mean)

# remove columns activity and subject, since we have new Group.activity & Group.subject variables
tidyData$activity <- NULL
tidyData$Subject <- NULL

# rename Group.activity & Group.subject variable names to activity and subject 
names(tidyData)[names(tidyData)=="Group.activity"] <- "activity"
names(tidyData)[names(tidyData)=="Group.subject"] <- "subject"

# persist data by writing tidy data 
write.table(tidyData, file = "./tidy_data.txt", row.name=FALSE)
