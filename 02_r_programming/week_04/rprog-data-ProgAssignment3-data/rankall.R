## Programming Assignment 03
## Part 4

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  ## Read outcome data
  
  outcome_df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
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
  
  outcome_df[, outcome_col] <- as.numeric(outcome_df[, outcome_col])
  outcome_df <- outcome_df[!is.na(outcome_df[,outcome_col]),]
  
  # Split data by state column values
  list_state_df <- split(outcome_df, outcome_df[,7])
  list_rankings_df <- lapply(list_state_df, function(state_df) rank(state_df, outcome_col, num))
  all_rankings_df <- do.call("rbind", list_rankings_df)
  all_rankings_df[,7] <- row.names(all_rankings_df)
  result <- data.frame(hospital=all_rankings_df[,2] , state= all_rankings_df[,7])
  row.names(result) <- row.names(all_rankings_df)
  result
}

rank <- function(state_df, outcome_col, num = "best") {
  ## Read outcome data
  outcome_df <- state_df
  
  ## Possible ranking inputs for num variable are "best", "worst", or a integer number
  if (identical(num, "best")) {
    ranking <- 1
  }
  else if (identical(num, "worst")) {
    ranking <- nrow(outcome_df)
  }
  else {
    ranking <- num
  }
  
  ## Return hospital name in that state with lowest 30-day death rate
  ordered_df <- outcome_df[order(outcome_df[, outcome_col], outcome_df[, 2]),]
  result <- ordered_df[ranking,] 
}