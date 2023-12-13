pad <- function(x, digits = 2, targetLength = 4, where = "front", surroundMaths = FALSE, textAlign = "left", big.mark = ""){
  
  # digits is the number of DECIMAL digits
  # targetLength  is the total length of the field (including negative signs and decimal points)
  # where  is how the numbers are aligned
  # big.mark is the format() input of same name. To call it, need to backslash *four* times: pad(..., big.mark = "\\\\,") 
  
  numRows <- 1
  if (is.data.frame(x)) { # CONVERT to an array for out purposes
    #cat("Convert data.frame to array\n")
    numCols <- dim(x)[2]
    numRows <- dim(x)[1]
    
    xTemp <- array( dim = c(numRows, numCols) )
    for (i in 1:numCols){
      xTemp[, i] <- x[[i]]
    }
    x <- xTemp
  }
  
  if ( is.array(x) ) {
    #cat("IS ARRAY\n")
    currentDim <- dim(x) # NULL if scalar. Use to restore dimension.
    currentCols <- currentDim[2]
    currentRows <- currentDim[1]
    xAnArray <- TRUE
    
    # Determine if row names exists, and save to be able to restore them
    xHasRowNames <- FALSE
    if (!is.null(rownames(x))) {
      xHasRowNames <- TRUE
      rowNamesToRestore <- rownames(x)
    }

    # Determine if col names exists, and save to be able to restore them
    xHasColNames <- FALSE
    if (!is.null(colnames(x))) {
      xHasColNames <- TRUE
      colNamesToRestore <- colnames(x)
    }
  
  } else {
    # Probably a single number... or a vector
    if (is.vector(x)) {
      currentDim <- length(x)
      currentCols <- 1
      currentRows <- length(x)
      xAnArray <- FALSE      
    } else{
      currentDim <- NA
      currentCols <- 1
      currentRows <- 1
      xAnArray <- FALSE
    }
  }  
  # If targetLength given once, make length appropriate for use by columns
  if ( length(targetLength) == 1) targetLength <- rep( targetLength, 
                                                       times = currentCols)

  # If digits given once, make length appropriate for use by columns
  if ( length(digits) == 1) digits <- rep( digits, 
                                           times = currentCols)

  if ( !is.null(currentDim) ) x <- c(x)
  
  xLen <- length(x)
  out <- array( dim = xLen)
  
  # Keep tabs on which row and column we are working on:  
  thisRow <- 0
  thisCol <- 1
  
  # Take each element one at a time
  for (i in 1:xLen){
    
    # Update the row and column currently being worked on
    thisRow <- thisRow + 1
    if( thisRow == (currentRows + 1)){ # Then move to next column, and start again at Row 1
      thisCol <- thisCol + 1
      thisRow <- 1
    }
    
    # Determine if a negative sign needs to be \phantomed-ed in this COLUMN
    addNegativeSignForThisCol <- FALSE
    #cat("thisCol, numRows", thisCol, numRows, "\n")
    if ( any(x[((thisCol - 1) * numRows + 1) : (thisCol * numRows)] < 0, na.rm = TRUE) ) {
      addNegativeSignForThisCol <- TRUE
    }
    
    

    # Check if element can be converted to numeric, or not; if not, leave it be.
    elementIsNumeric <- varhandle::check.numeric( x[i])
    # This return  TRUE  if the cell is NA. So check this separately
    if ( is.na(x[i]) ) elementIsNumeric <- FALSE
    
    if (elementIsNumeric) { 
      x[i] <- as.numeric( x[i] )
      
      
      #cat("digits = ", digits[thisCol], "width = ", targetLength[thisCol], "\n")
      xi <- format( round( as.numeric(x[i]), 
                           digits[thisCol]),
                    #digits = digits,
                    nsmall = digits[thisCol],
                    justify = "right",
                    big.mark = big.mark,
                    width = targetLength[thisCol])

      xi <- gsub(pattern = " ", 
                 replacement = "\\\\phantom{0}", 
                 xi)
      
      
      
      # if ( currentLength < targetLength) {
      #   if (where == "front"){
      #     out[i] <- paste0( paste(rep("\\phantom{0}", targetLength - currentLength), collapse = ""), 
      #                       xi,
      #                       collapse = "")
      #   } else {
      #     out <- paste0(xi, 
      #                   paste(rep("\\phantom{0}", targetLength - currentLength), collapse=""),
      #                   collapse = "")
      #   }
      # } else {
      #   out[i] <- xi
      # }
      # 
      if (surroundMaths) xi <- paste0( "$", xi, "$", 
                                           collapse = "") 
      
      #cat(xi, "\n")
      
      currentLength <- nchar( as.character(x[i]))
      # Replace first phantom with \phantom{-} if needed
      if (addNegativeSignForThisCol) {
        #cat("xi (a):", xi, ":\n")
        #cat("   Need to add - sign\n")
        if (x[i] >= 0 ) { # If the number is -ive, we do not need a \phantom{-},  
          #cat("   Adding phantom{-}\n")
          xi <- sub(pattern = "\\\\phantom\\{0\\}", # 'sub' replace only first instance
                    replacement = "\\\\phantom\\{-\\}",
                    xi)
        } else {
          # Need a fix, or we have \phantom{0} - 1.23, and the - is interpreted as a minus sign and spacing is screwed up
          #cat("   NOT adding phantom{-}\n\n")
          xi <- sub(pattern  = "\\$\\\\phantom\\{0\\}", # 'sub' replace only first instance
                    replacement = "\\\\phantom\\{0\\}\\$",
                    xi)
          #cat("xi (b):", xi, ":\n")
          
        }
      }
      
      out[i] <- xi
      
    } else { # So these cannot be converted to numeric; likely are text
      #cat("Non numeric\n")
      if (is.na(x[i]) ) {
        out[i] <-  NA
      } else { # TEXT
        
        xLength <- nchar( x[i] )
        
        if (xLength < targetLength[thisCol]){
          
          if (textAlign == "left"){ 
            
            out[i] <- paste0( x[i], 
                              "$",
                              paste0( rep("\\phantom{0}",
                                          times = targetLength[thisCol] - xLength),
                                      collapse = ""),
                              "$")
          } else { # right align
            out[i] <- paste0( "$",
                              paste0( rep("\\phantom{0}",
                                          times = targetLength[thisCol] - xLength),
                                      "$",
                                      x[i],
                                      collapse = "")
            )
            
          }
        } else {
           out[i] <- x[i]
        }
        
      }
    }
  } 
  if ( xAnArray ) {
    dim(out) <- currentDim
    if (xHasRowNames) rownames(out) <- rowNamesToRestore 
    if (xHasColNames) colnames(out) <- colNamesToRestore 
  }
  
  out
}