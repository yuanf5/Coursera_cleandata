# Clean data homework Code book

This piece of R code generates a tidy dataset that contains the information of the average of each variable for each activity and each subject.

# Source datasets:
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:      

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for the project is at below link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Variable definition as follows:
sb: This variable contains subject number, range from 1 to 30, which contains all 30 volunteers.      
ft: This variable contains all 74 features.      
test: This variable contains 5 activities Volunteers conducted.       
value: This variable gives the average value of the feature for the corresponding
patient, when conducting the corresponding test.        

# transformations or work performed 
1. Read in all datasets
2. Merge training and test datasets to create datasets for all 30 volunteers
3. subset for only measurements on the mean and standard deviation for each measurement.
4. properly label the datasets
5. Calculate the average of each variable for each activity for each subject.
6. Convert dataset so that it's tidy!
