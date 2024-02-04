install.packages("data.table")
library(data.table)

# Required problem 1: Read CSV
opt_data <- fread("C:/Users/19010/Desktop/DevEng 203/week 2/raw_files/combined_time_series_data.csv")

# Required problem 2: Maximum temperature by household_id
max_temperature_by_household_opt <- opt_data[, .(max_temperature = max(value)), by = household_id]

# Required problem 3: High-temperature households
high_temperature_households_opt <- opt_data[value > 130, .(camp, filename, household_id), keyby = .(camp, filename, household_id)]

# Required problem 4: Subset based on high-temperature households
opt_data_hot_house_subset <- opt_data[household_id %in% high_temperature_households_opt$household_id]

# Print the head of data.tables
print(head(opt_data))
print(head(max_temperature_by_household_opt))
print(head(high_temperature_households_opt))
print(head(opt_data_hot_house_subset))