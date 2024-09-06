post_processor <- function(metadata, input_file, output_file, clean, verbose) {
  log_file <- "post_processor_log.txt"
  
  # Function to log messages by appending them to the log file
  log_message <- function(message) {
    log_conn <- file(log_file, open = "a")  # Open the log file in append mode
    writeLines(message, log_conn)           # Write the message to the log
    close(log_conn)                         # Close the connection
  }
  
  # Start logging
  log_message(">>>>>>>>>>>>>>>>>>>> Log started and so it should have\n")
  
  # Check if the input .tex file exists
  if (file.exists(input_file)) {
    log_message(paste("Input file exists:", input_file, "\n"))
    
    # Read the .tex file
    tex <- readLines(input_file)
    
    # Write the modified .tex content back to the input file
    writeLines(tex, input_file)
  } else {
    log_message("Input file does not exist!\n")
  }
  
  # Final log message
  log_message("Post-processing complete.\n")
  
  # Return the output file
  return(output_file)
}
