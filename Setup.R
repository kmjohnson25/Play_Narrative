# setup.R

# Load necessary packages
packages <- c("tidyverse", "ggplot2", "dplyr", "knitr", "broom", "rmarkdown", "quarto", "readr")
lapply(packages, require, character.only = TRUE)

# Set global options
options(stringsAsFactors = FALSE)  # Avoid factors in data frames
theme_set(theme_minimal())  # Set default ggplot2 theme

# Print message to confirm script is sourced
message("setup.R loaded successfully!")
