surroundMaths <- function(x, all = FALSE, rows = NA, cols = NA, decDigits = 1){
  # Takes the "table" in x, surrounds specified rows/cols with $...$
  
  #if ( !is.na(rows) & !is.na(cols) ) paste("Only rows or cols, one at a time\n")
  tempTable <- x
  
  if (all) {
    #    rows <- 1 : dim(x)[1]
    cols <- 1 : dim(x)[2]
  }
  
  if ( !is.na(rows[1]) ) { # That is, rows are specified for surrounding by $...$
    if ( length(decDigits) < length(rows)) decDigits <- rep(decDigits, length(rows))
    
    for (i in (1 : length(rows))){
      
      locateNA <- is.na( tempTable[ rows[i], ])
      # Now temporarily make these 0, so the  round()  can be applied
      if ( any( locateNA) ) tempTable[ rows[i], locateNA] <- 0
      
      # Now locate other problematic entries      
      locateOtherNonNumeric <- is.na(as.numeric( tempTable[ rows[i],]))
      
      # Now temporarily make these 0, so the  round()  can be applied
      if ( any( locateOtherNonNumeric) ) tempTable[ rows[i], locateOtherNonNumeric] <- 0
      tempTable[ rows[i], ] <- paste0("$", 
                                      format( round( as.numeric(x[rows[i], ]), 
                                                     digits = decDigits[i]),
                                              nsmall = decDigits[i]),
                                      "$")
      # Now replace the NA with NA again
      if ( any( locateNA) ) tempTable[ rows[i], locateNA] <- NA
      if ( any( locateOtherNonNumeric) ) tempTable[ rows[i], locateOtherNonNumeric] <- NA
      
    }
  }
  
  
  if ( !is.na(cols[1]) ) {
    
    if ( length(decDigits) < length(cols)) decDigits <- rep(decDigits, length(cols))
    
    for (i in (1 : length(cols))){
      locateNA <- is.na( tempTable[ , cols[i] ])
      # Now temporarily make these 0, so the  round()  can be applied
      if ( any( locateNA) ) tempTable[ locateNA, cols[i]] <- rep(0, sum(locateNA) )
      
      # Now locate other problematic entries      
      locateOtherNonNumeric <- is.na(as.numeric( tempTable[ , cols[i]]))
      
      # Now temporarily make these 0, so the  round()  can be applied
      if ( any( locateOtherNonNumeric) ) tempTable[ locateOtherNonNumeric, cols[i]] <- 0
      
      tempTable[, cols[i]] <- paste0("$", 
                                     format( round( as.numeric(x[, cols[i]]), 
                                                    digits = decDigits[i]), 
                                             nsmall = decDigits[i]),
                                     "$")
      # Now replace the NA with NA again
      if ( any( locateNA) ) tempTable[ locateNA, cols[i]] <- NA
      if ( any( locateOtherNonNumeric) ) tempTable[ locateOtherNonNumeric, cols[i]] <- NA
      
    }
  }
  
  tempTable
}
