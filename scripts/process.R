# Load necessary packages
library(readr)
library(dplyr)

# Function to add a timestamp suffix to the file name
add_timestamp_suffix <- function(file_name) {
  timestamp <- format(Sys.time(), "%Y%m%d%H%M%S")
  file_name <- gsub("\\.csv$", paste0("-", timestamp, ".csv"), file_name)
  return(file_name)
}

# Read CSV files
contributions <- read_csv("datasets/GR15_contributions.csv")
wallets <- read_csv("inputs/wallets.csv")

# Filter addresses in the contributions dataset 
filtered_addresses <- contributions %>%
  inner_join(wallets, by = "address") %>% 
  filter(amount_in_usdt <= 1) %>%
  group_by(address) %>%
  filter(n() > 1) %>%
  distinct(address)

# Add a new column 'score' to the wallets dataset
wallets <- wallets %>%
  mutate(score = if_else(address %in% filtered_addresses$address, 1, 0))

# Generate a file name with a timestamp suffix
file_name <- add_timestamp_suffix("outputs/wallets.csv")

# Write the filtered data to the CSV file
write_csv(wallets, file_name)
file.copy(from = file_name, to = "outputs/wallets-latest.csv", overwrite = TRUE)
