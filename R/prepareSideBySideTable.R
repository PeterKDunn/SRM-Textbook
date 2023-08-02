prepareSideBySideTable <- function(twoTables, 
                                   numberOfTables = 2,
                                   gap = "\\quad\\quad") { # The gap between the two side-by-side tables
  
  # Takes two tables that are joined using  kables
  # and adds a space between them, and centres them, 
  # which I could not get to work any other way.
  # The output should NOT need to be  print()-ed.
  
  # CENTRE TABLES
  # A hack: Add \centering, but need to make space for it first
  
  out <- paste( substr(twoTables, 1, 13), # This is just \\begin{table}
                "\\centering", # New text
                substr(twoTables, 15, nchar(twoTables)) )

  
  if (numberOfTables == 2) {
    # ADD SPACE BETWEEN TABLES
    findEndTabular <- unlist(gregexpr('end{tabular}',   # Find the location of  end{tabular}... 
                                      out,             # ... in  out ... (e.g., character 35 is where this string starts)
                                      fixed = TRUE))    # ... taking the curly brackets literally
    findEndTabular <- findEndTabular[1] + 11 # Need to move to the *end* of the \end{tabular} string to add the spacing
    out <- paste( substr(out, 1, findEndTabular),
                  gap,
                  substr(out, findEndTabular + 1, nchar(out) ) )
    tb <- structure(out,
              format = "latex",
              class = "knitr_kable")
  }
  
  if (numberOfTables == 3){
    # ADD SPACE BETWEEN TABLES
    findEndTabular <- unlist(gregexpr('end{tabular}',   # Find the stringf  tabular... 
                                      out,             # ... in  out ...
                                      fixed = TRUE))    # ... taking the curly brackets literally
    findEndTabular <- findEndTabular + 11 # Need to move to the *end* of the \end{tabular} string to add the spacing
    
    for (i in (length(findEndTabular) - 1):1 ){
      # If we go backwards, the extra lengt added by splicing in  gap  isn't a problem
      out <- paste( substr(out, 1, findEndTabular[i]),
                    gap,
                    substr(out, findEndTabular[i] + 1, nchar(out) ) )
    }
    tb <- structure(out,
              format = "latex",
              class = "knitr_kable")
  }
  tb
}