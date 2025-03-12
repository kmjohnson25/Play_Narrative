# data_cleaning.R

clean_data <- function(df) {
  df %>%
    rename_all(tolower) %>%  # Convert column names to lowercase
    mutate_all(~ifelse(. == "", NA, .)) %>%  # Convert empty strings to NA
    mutate(across(where(is.character), as.factor)) %>%  # Convert character to factor
    drop_na()  # Remove rows with missing values
}

message("data_cleaning.R loaded successfully!")
