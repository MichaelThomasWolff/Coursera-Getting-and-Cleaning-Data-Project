Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset.

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: 
https://www.youtube.com/watch?v=XOEN9W05_4A


Variables

uci_data_dir contains the UCI dataset.

txt_x_train contains the data from the "X_train.txt" file
txt_x_test contains the data from the "X_test.txt" file
txt_y_train contains the data from the "y_train.txt" file 
txt_y_test contains the data from the "y_test.txt" file 
txt_subject_train contains the data from the "subject_train.txt" file 
txt_subject_test contains the data from the "subject_test.txt" file 
txt_features contains the data from the "features.txt" file 
txt_activity_labels contains the data from the "activity_labels.txt" file 

The merged dataset of x and y data can be found in the variables df_x and df_y.
