## Programming Assignment 03
## The data for this assignment come from the Hospital Compare web site 
## (http://hospitalcompare.hhs.gov) run by the U.S. Department of Health 
## and Human Services. The purpose of the web site is to provide data and 
## information about the quality of care at over 4,000 Medicare-certified 
## hospitals in the U.S. This dataset essentially covers all major U.S. hospitals.
##

## Part 1
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
## Number of Hospitals whose 30-Day Death (Mortality) Rates
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])
