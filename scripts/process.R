# Load necessary packages
library(dplyr)
library(readr)

# Function to add a timestamp suffix to the file name
add_timestamp_suffix <- function(file_name) {
  timestamp <- format(Sys.time(), "%Y%m%d%H%M%S")
  file_name <- gsub("\\.csv$", paste0("-", timestamp, ".csv"), file_name)
  return(file_name)
}

# Read the CSV file
data <- read_csv("datasets/GR15_contributions.csv")

# Extract addresses with donation amounts in USD less than or equal to 0.01
filtered_data <- data %>%
  filter(amount_in_usdt <= 0.01) %>%
  distinct(address)

# Generate a file name with a timestamp suffix
file_name <- add_timestamp_suffix("results/results.csv")

# Write the filtered data to the CSV file
write_csv(filtered_data, file_name)
file.copy(from = file_name, to = "results/results-latest.csv")

