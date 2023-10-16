surroundMaths <- function(x, rows = NA, cols = NA, decDigits = 1){
  # Takes the "table" in x, surrounds specified rows/cols with $...$
  
  #if ( !is.na(rows) & !is.na(cols) ) paste("Only rows or cols, one at a time\n")
  tempTable <- x
  
  
  if ( !is.na(rows[1]) ) { 
    if ( length(decDigits) < length(rows)) decDigits <- rep(decDigits, length(rows))
    
      for (i in (1 : length(rows))){
        tempTable[ rows[i], ] <- paste0("$", 
                                      format( round(x[rows[i], ], digits = decDigits[i]),
                                              nsmall = decDigits[i]),
                                      "$")
      
    }
  }
  
  if ( !is.na(cols[1]) ) {
    if ( length(decDigits) < length(cols)) decDigits <- rep(decDigits, length(cols))
    
    for (i in (1 : length(cols))){
      tempTable[, cols[i]] <- paste0("$", 
                                     format( round(x[, cols[i]], digits = decDigits[i]), 
                                           nsmall = decDigits[i]),
                                     "$")
      
    }
  }
  
  tempTable
}
