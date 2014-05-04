## Programming Assignment 03
## Part 2

best <- function(state, outcome) {
  ## Read outcome data
  outcome_df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  ## state column is number 7 in outcome
  if (!is.element(state, unique(outcome_df[,7]))) {
    stop("invalid state")
  }
  
  ## Possible outcomes are: "heart attack", "heart failure", or "pneumonia"
  if (identical(outcome, "heart attack")) {
    outcome_col <- 11
  }
  else if (identical(outcome, "heart failure")) {
    outcome_col <- 17
  }
  else if (identical(outcome, "pneumonia"))
  {
    outcome_col <- 23
  }
  else {
    stop("invalid outcome")
  }
 
  ## Return hospital name in that state with lowest 30-day death rate
  outcome_df <- subset(outcome_df, state == outcome_df[,7])
  outcome_df[, outcome_col] <- as.numeric(outcome_df[, outcome_col])
  ordered_df <- outcome_df[order(outcome_df[,outcome_col], outcome_df[,2]),]
  result <- ordered_df[1,2] 
}