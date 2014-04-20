pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  tmp_files <- list.files(path=directory, pattern="*.csv")
  current_directory <- getwd()
  setwd(directory)
  df <- NULL
  for (i in id) {
    df <- rbind(df,read.csv(tmp_files[i]))
  }
  setwd(current_directory)
  mean(df[,pollutant],na.rm=TRUE)
}