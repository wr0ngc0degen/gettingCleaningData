# Human Activity Recognition Using Smartphones

Attention! In order to script work correctly your working directory should be set to "UCI HAR Dataset"

description of run_analysis.R:

1. loads necessary libraries
2. gets names of measures from the file features.txt
3. Filtering only columns with mean() and std() data
4. creating vectors with start and end coordinates for columns
5. reading data into R usidg readr::read_fwf packages and position vectors created earlier for test data
6. reading subject number data and binding it to the dataset
7. reading activity data and binding it to the dataset
8. repeating the same for train data
9. union two sets - test and train
10. melting the set to be able to count grouped mean afterwards
11. obtaining final data using dcast
12. writing final dataset to the file
