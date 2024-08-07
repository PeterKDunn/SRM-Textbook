surroundMaths <- function(x, 
                          bycols = TRUE, 
                          byrows = FALSE, 
                          decDigits = 0, 
                          ignore = array( FALSE, dim = dim(x))){
  ### Takes the  array  in x, surrounds numeric elements with $...$
  ### The whole table is converted
  ### if  bycols = TRUE  decDigits  is applied by col.
  ### if  byrows = TRUE  decDigits  is applied by row.
  ### if neither  bycols  or  byrow  is give, decDigits is applied by like  bycol.
  ### decDigits should be a vector of the appropriate size (num of rows or cols), or a single number, to specify the number of decimal digits to round to.
  ###   If decDigits is NA, then whatever is provided is used as-is. 
  ### ignore  is a logic array, the same size a x, of cells to ignore, and return as initially given in x 
  
  
  if ( byrows ) bycols <- FALSE
  if ( bycols ) byrows <- FALSE
  
  library("varhandle") # Provides check.numeric()
  
  # If x is a vector, turn into an array
  if ( is.vector(x)){
    dim(x) <- c(length(x), 1)
  }
  
  tempTable <- x
  tempTable[ignore] <- NA # These will be replaced later
  
  dimx <- dim(x)
  numCols <- dimx[2]
  numRows <- dimx[1]

  if ( is.na(byrows) & is.na(bycols) ) {
    bycols <- TRUE
    byrows <- FALSE
  }
  
  doRounding <- TRUE # The default, when decDigits given
  if (any(is.na(decDigits))) doRounding <- FALSE
    
  # Need to proceed one col (or row) at a time, to apply decDigits!
  
  if ( bycols ){
    if ( doRounding ){ 
      if (length(decDigits) == 1) decDigits <- rep(decDigits, numCols)
    }
    
    # Do one col at a time
    for (i in 1:numCols){
      locateNumeric <- varhandle::check.numeric( tempTable[, i]) # TRUE where array contains numbers
      # This return  TRUE  if the cell is NA. So check this separately
      locateNumeric[ is.na(tempTable[, i])] <- FALSE 
      
      if ( !doRounding){
        tempTable[locateNumeric, i] <- paste0("$",
                                              as.numeric(tempTable[locateNumeric, i]), 
                                              "$")    
        
      } else { # decDigits is given
        tempTable[locateNumeric, i] <- paste0("$",
                                              format( round( as.numeric(tempTable[locateNumeric, i]), 
                                                             digits = decDigits[i]), 
                                                      nsmall = decDigits[i]),
                                              "$")    }
    }
  } else {
    if ( doRounding){ 
      if (length(decDigits) == 1) decDigits <- rep(decDigits, numRows)
    }
    # Do one row at a time
    for (i in 1:numRows){
      locateNumeric <- varhandle::check.numeric( tempTable[i, ]) # TRUE where array contains numbers
      # This return  TRUE  if the cell is NA. So check this separately
      locateNumeric[ is.na(tempTable[i, ])] <- FALSE 
      
      if (!doRounding){
        tempTable[i, locateNumeric] <- paste0("$",
                                              as.numeric(tempTable[i, locateNumeric]), 
                                              "$")
        
      } else { # decDigits is given
        
        tempTable[i, locateNumeric] <- paste0("$",
                                              format( round( as.numeric(tempTable[i, locateNumeric]), 
                                                             digits = decDigits[i]), 
                                                      nsmall = decDigits[i]),
                                              "$")
      }
    }
  }

  tempTable[ignore] <- x[ignore] # Restore the  ignore  elements
  tempTable
}
