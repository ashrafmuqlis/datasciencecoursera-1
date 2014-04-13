setwd("~/Downloads/coursera/data_science/03_getting_and_cleaning_data/hw_scripts/week_01")

download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile="getdata-data-ss06hid.csv", method="curl")
df <- read.csv("getdata-data-ss06hid.csv")

