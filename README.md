# Getting and Cleaning Data Project - Peer Assessments

### Purpose
The purpose of this project is to demonstrate out ability to collect, work with, and clean a data set.

### Goal
The goal is to prepare tidy data that can be used for later analysis. To do so, we will be required to submit

	1. A tidy data set as described below

	2. A link to a Github repository with our script for performing the analysis

	3. A code book, called `CodeBook.md` that describes:
		3.1	The variables
		3.2 The data, and
		3.3 Any transformations or work that we performed to clean up the data
	
	4. We should also include a README.md in the repo with our scripts. This repo explains how all of the scripts
	work and how they are connected.

### Data set
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Requirements
Create one R script called `run_analysis.R` that does the following:

	1. Merges the training and the test sets to create one data set
	2. Extracts only the measurements on the mean and standard deviation for each measurement
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names
    
From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

### Dependent libraries
`run_analysis.R` depends on two libraries: `data.table` and `reshape2`. It is assumed that you have already downloaded the packages. Othewise, download/install the libraries using `install.packages("data.table")` and `install.packages("reshape2)`. 
 
