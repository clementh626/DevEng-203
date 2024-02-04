setwd("C:/Users/19010/Desktop/DevEng 203/week 2/raw_files")


# Get a list of all CSV files in the directory
csv_files <- list.files(pattern = "\\.csv$")

# Initialize an empty list to store data frames
data_frames_list <- list()

# Initialize an ID counter
id_counter <- 1

# Define a function to read and process a single CSV file
read_and_process_csv <- function(file) {
  # Read CSV file, skip lines above the data
  df <- read.csv(file, skip = 19, stringsAsFactors = FALSE)
  
  # Rename columns
  colnames(df) <- c("time", "unit", "value")
  
  # Parse timestamps
  if ("time" %in% colnames(df)) {
    df$time <- as.POSIXct(df$time, format = "%Y/%m/%d %H:%M:%S")
  } else {
    warning("No 'time' column found in file:", file)
  }
  
  # Add columns based on file name
  df$filename <- file
  df$variable <- "temperature"
  file_parts <- strsplit(gsub(".*/", "", file), "_")[[1]]
  df$camp <- file_parts[1]
  df$datalogger_id <- sub(".csv", "", file_parts[2])
  df$household_id <- id_counter
  
  # Increment ID counter
  id_counter <<- id_counter + 1
  
  return(df)
}

# Use lapply to read and process all CSV files
processed_data_list <- lapply(csv_files, read_and_process_csv)

# Combine all processed data frames into a single data frame
combined_data <- do.call(rbind, processed_data_list)

# Reorder columns
combined_data <- combined_data[, c("filename", "time", "unit", "value", "variable", "camp", "datalogger_id", "household_id")]

# Write the combined data frame to a new CSV file
write.csv(combined_data, file = "combined_time_series_data.csv", row.names = FALSE)