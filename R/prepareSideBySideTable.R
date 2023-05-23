

prepareSideBySideTable <- function(twoTables) {

  # Takes two tables tgat are joiuned using  kables
  # and adds a space between them, and centres them, 
  # which I could not get to work any other way.
  # The output should NOT need to be  print()-ed.

  # CENTRE TABLES
  # A hack: Add \centering, but need to make space for it first
  
  out <- paste( substr(twoTables, 1, 13), # This is just \\begin{table}
                 "\\centering", # New text
                 substr(twoTables, 15, nchar(twoTables)) )

  # ADD SPACE BETWEEN TABLES
  findEndTabular <- unlist(gregexpr('end{tabular}',   # Find the stringf  tabular... 
                                    out,             # ... in  out2 ...
                                    fixed = TRUE))    # ... taking the curly brackets literally
  findEndTabular <- findEndTabular[1] + 11 # Need to move to the *end* of the \end{tabular} string to add the spacing
  out <- paste( substr(out, 1, findEndTabular),
                 "\\quad\\quad",
                 substr(out, findEndTabular + 1, nchar(out) ) )
  structure(out,
            format = "latex",
            class = "knitr_kable")
}