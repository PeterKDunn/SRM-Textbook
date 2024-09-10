cat("YYYYYYYYYYYYYYYYYYYYYYYYYYYY\n")

post_processor <- function(input, output) {
  
  latex_code <- readLines(input)
  
  cat("PPPPPPPPPPPPP", input_file, "\n" )
  cat(deparse(substitute(input_file)),"\n")
  
  new_tex_file <- gsub(pattern = "a",
                       replacement = "XXXXXXXX",
                       x = readLines(latex_code))

  # log_file <- "post_processor_log.txt"
  # 
  # # Function to log messages by appending them to the log file
  # log_message <- function(message) {
  #   log_conn <- file(log_file, open = "a")  # Open the log file in append mode
  #   writeLines(message, log_conn)           # Write the message to the log
  #   close(log_conn)                         # Close the connection
  # }
  # 
  # # Start logging
  # log_message(">>>>>>>>>>>>>>>>>>>> Log started and so it should have\n")
  # 
  # # Check if the input .tex file exists
  # if (file.exists(input_file)) {
  #   log_message(paste("Input file exists:", input_file, "\n"))
  #   
  #   # Read the .tex file
  #   tex <- readLines(input_file)
  #   
  #   # Write the modified .tex content back to the input file
  #   writeLines(tex, input_file)
  # } else {
  #   log_message("Input file does not exist!\n")
  # }
  # 
  # # Final log message
  # log_message("Post-processing complete.\n")
  # 
  # Return the output file
  writeLines( new_tex_file, "BOB.TEX")
  writeLines( new_tex_file, output)
  return(output)
}

