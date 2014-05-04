## Programming Assignment 03
## Part 4

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  source("rankhospital.R")
  outcome_df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states <- unique(outcome_df[,7])
  result_df <- NULL
  for (s in states) {
    hosp_name <- rankhospital(s, outcome, num)
    result_df <- rbind(result_df,data.frame(hospital = hosp_name , state = s))
  }
  result_df
}