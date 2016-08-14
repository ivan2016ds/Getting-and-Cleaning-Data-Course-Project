# Getting-and-Cleaning-Data-Course-Project

The project purpose is to tidy the data from the source below and produce summary of the data with average of mean and standard deviation of measurements by the group of activity and subject.

Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Content

1. run_analysis.R
	* R script to process and clean data from the above data source
		1. Load datasets into R
		2. Merge all datasets into single, unified dataset
		3. Subset dataset with measurements of mean and standard deviation only
		4. Rename "activity" with descriptive values
		5. Summarize dataset, identify average of current variables group by activity and subject

2. tidyData.txt
	* Final dataset produced from R script execution in "run_analysis.R"

3. Codebook.md 
	* Codebook that explains information about final dataset in "tidyData.txt"

### Final Dataset
You can read the final dataset using the following line in R:
`\tidyData <- read.table("tidyData.txt")`

### Reference (Data source)

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.