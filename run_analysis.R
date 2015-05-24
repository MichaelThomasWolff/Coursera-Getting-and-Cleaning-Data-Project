library(plyr)

#---------------------------
# Prep: Files and directories 
#---------------------------

uci_data_dir <- "UCI\ HAR\ Dataset"

txt_x_train <- paste(uci_data_dir, "/train/X_train.txt", sep = "")
txt_x_test  <- paste(uci_data_dir, "/test/X_test.txt", sep = "")

txt_y_train <- paste(uci_data_dir, "/train/y_train.txt", sep = "")
txt_y_test  <- paste(uci_data_dir, "/test/y_test.txt", sep = "")

txt_subject_train <- paste(uci_data_dir, "/train/subject_train.txt", sep = "")
txt_subject_test <- paste(uci_data_dir, "/test/subject_test.txt", sep = "")

txt_features <- paste(uci_data_dir, "/features.txt", sep = "")

txt_activity_labels <- paste(uci_data_dir, "/activity_labels.txt", sep = "")


#---------------------------------------------------------------------
# Step 1 Merges the training and the test sets to create one data set.
#---------------------------------------------------------------------

# Data set x
df_train_x <- read.table(txt_x_train)
df_test_x <- read.table(txt_x_test)

df_x <- rbind(df_train_x, df_test_x)

# Data set y
df_train_y <- read.table(txt_y_train)
df_test_y <- read.table(txt_y_test)

df_y <- rbind(df_train_y, df_test_y)

# Data set subject
df_subject_train <- read.table(txt_subject_train)
df_subject_test <- read.table(txt_subject_test)

df_subject_data <- rbind(df_subject_train, df_subject_test)


#-----------------------------------------------------------------------------------------------
# Step 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
#-----------------------------------------------------------------------------------------------

df_features <- read.table(txt_features)

# Get only mean or std
df_mean_std_features <- grep("-(mean|std)\\(\\)", df_features[, 2])

df_x <- df_x[, df_mean_std_features]

names(df_x) <- df_features[df_mean_std_features, 2]


#-------------------------------------------------------------------------------
# Step 3 Uses descriptive activity names to name the activities in the data set.
#-------------------------------------------------------------------------------

df_activities <- read.table(txt_activity_labels)

df_y[, 1] <- df_activities[df_y[, 1], 2]

names(df_y) <- "activity"


#--------------------------------------------------------------------------
# Step 4 Appropriately labels the data set with descriptive variable names. 
#--------------------------------------------------------------------------

names(df_subject_data) <- "subject"

# Bind data into total data set
df_total <- cbind(df_x, df_y, df_subject_data)


#-------------------------------------------------------------------------------------------------------------------------
# Step 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#-------------------------------------------------------------------------------------------------------------------------

# ncol(df_total) = 68
# colnames(df_total) shows activity and subject last

df_avg <- ddply(df_total, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(df_avg, "activity-rec-avg.txt", row.name=FALSE)

