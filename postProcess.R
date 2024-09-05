# postProcess.R
post_processor <- function(metadata, input_file, output_file, clean, verbose) {
  message(">>>>>>>>>>>>>>>>>>>")
  cat("<<<<<<<< PARTYHAT <<<<<<<<<<<<<<\n")
 #if (FALSE) {
   # Debug message to see if the function is being called
  message("Post-processing function called.")
  
  # Print the input LaTeX file being processed
  message(">>>>>>>>>>>> Processing file: ", input_file)
  
  # Read the generated LaTeX (.tex) file
  tex_lines <- readLines(input_file)
  
  # Replace instances of "RQ." with "RQ.\@"
#  tex_lines <- gsub("RQ\\.", "RQ.\\\\@", tex_lines, fixed = FALSE)
  tex_lines <- gsub("RQ", "OXTEROXTER", tex_lines, fixed = FALSE)
  
  # Write the modified .tex file back
  writeLines(tex_lines, input_file)
  
  # Confirm the replacement
  message("Replaced 'RQ.' with 'RQ.\\@' in the LaTeX file.")
  
  # Return the output file so that compilation can continue
  return(output_file)
# }
}

