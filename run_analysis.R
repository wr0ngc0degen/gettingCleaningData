library(dplyr)
library(reshape2)
library(readr)
measure_names <- read.csv2("./features.txt", header = F, sep = " ", stringsAsFactors = F)
meanOrStd <- ifelse(grepl("mean()", measure_names$V2, fixed = T) | grepl("std()", measure_names$V2, fixed = T), T, F)
measure_names <- cbind(measure_names, meanOrStd)
column_names <- measure_names$V2[which(measure_names$meanOrStd)]

#here creating column indices to extract only mean and std 
measure_names <- mutate(measure_names, start = (V1 - 1)*16 + 1)
measure_names <- mutate(measure_names, end = (V1)*16)
start_vector <- measure_names$start[which(measure_names$meanOrStd)]
end_vector <- measure_names$end[which(measure_names$meanOrStd)]

#read test data
X_test <- read_fwf("./test/X_test.txt", fwf_positions(start_vector, end_vector, column_names))

subject_test <- read.csv("./test/subject_test.txt", header = F)
X_test <- cbind(subject_test, X_test)
colnames(X_test)[1] <- "subject_num"

y_test <- read.csv("./test/y_test.txt", header = F)
X_test <- cbind(y_test, X_test)
colnames(X_test)[1] <- "activity_num"

activity_labels <- read.csv2("./activity_labels.txt", header = F, sep = " ")
X_test <- merge(activity_labels, X_test, by.x = "V1", by.y = "activity_num")
X_test <- X_test[-1]
colnames(X_test)[1] <- "activity"

#read train data
X_train <- read_fwf("./train/X_train.txt", fwf_positions(start_vector, end_vector, column_names))

subject_train <- read.csv("./train/subject_train.txt", header = F)
X_train <- cbind(subject_train, X_train)
colnames(X_train)[1] <- "subject_num"

y_train <- read.csv("./train/y_train.txt", header = F)
X_train <- cbind(y_train, X_train)
colnames(X_train)[1] <- "activity_num"

X_train <- merge(activity_labels, X_train, by.x = "V1", by.y = "activity_num")
X_train <- X_train[-1]
colnames(X_train)[1] <- "activity"

#union two sets - training and test
full_set <- rbind(X_train, X_test)

#melting the set to be able to count grouped mean afterwards
full_set_melt <- melt(full_set, id.vars = c("activity", "subject_num"),measure.vars = column_names)

#obtaining final data 
full_data <- dcast(full_set_melt, activity + subject_num ~ variable, mean)

#writitng it to file
write.table(full_data, "final_data_set.txt",  row.name=FALSE)