# manuscript_tables.R

library(kableExtra)

apa_table <- function(df, caption = "Descriptive Statistics") {
  df %>%
    kbl(caption = caption, format = "html") %>%
    kable_styling(full_width = FALSE, bootstrap_options = c("striped", "hover"))
}

message("manuscript_tables.R loaded successfully!")
