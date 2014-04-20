corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  ## Return a numeric vector of correlations
  tmp_files <- list.files(path=directory, pattern="*.csv")
  current_directory <- getwd()
  setwd(directory)
  crs <- NULL
  for (i in 1:length(tmp_files)) {
    tmp_df <- read.csv(tmp_files[i])
    ok_obs <- complete.cases(tmp_df)
    n_obs <- sum(ok_obs)
    if (n_obs > threshold) {
      crs <- rbind(crs, cor(tmp_df[ok_obs,"nitrate"],tmp_df[ok_obs,"sulfate"]))
    }
  }
  setwd(current_directory)
  crs[,1]
}