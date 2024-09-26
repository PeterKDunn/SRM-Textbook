pad <- function(x, 
                digits = 2, 
                targetLength = 4, 
                #where = "front", 
                surroundMaths = FALSE,
                textAlign = "left", 
                big.mark = "",
                verbose = FALSE){
  
  # digits is the number of DECIMAL digits
  # targetLength  is the total length of the field (including negative signs and decimal points)
  # where  is how the numbers are aligned
  # big.mark is the format() input of same name. To call it, need to backslash *four* times: pad(..., big.mark = "\\\\,") 
  
  # digits  and targetLength  may be entered as
  #   * one digits: Fill out a vector with this digit.
  #   * one digits for each column: Fill out a vector with this digit.
  #   * one digit for each element, given across rows, same size as input, giving the value for each cell.
  
  
  
  numRows <- 1
  numCols <- 1
  xHasRowNames <- FALSE
  xHasColNames <- FALSE
  
  if (is.data.frame(x)) { # CONVERT to an array for our purposes
    if ( verbose) cat("* Data frame given\n")
    if ( verbose) cat("* Converting data.frame to array\n")

    # Store row and col names if present
    
    if (!is.null(rownames(x))) {
      if ( verbose) cat("  * Restoring row names\n")
      xHasRowNames <- TRUE
      rowNamesToRestore <- rownames(x)
    }
    
    # Determine if col names exists, and save to be able to restore them
    xHasColNames <- FALSE
    if (!is.null(colnames(x))) {
      if ( verbose) cat("  * Restoring column names\n")
      xHasColNames <- TRUE
      colNamesToRestore <- colnames(x)
    }
    

    numCols <- dim(x)[2]
    numRows <- dim(x)[1]
    

    xTemp <- array( dim = c(numRows, numCols) )
    for (i in 1:numCols){
      xTemp[, i] <- x[[i]]
    }
    x <- xTemp
    
    # Restore
    if ( verbose) cat("  * Restoring row, col names\n")
    if (xHasRowNames){
      if ( verbose) cat("  * Restoring row names:", rowNamesToRestore, "\n")
      rownames(x) <- rowNamesToRestore 
    }
    if (xHasColNames) {
      if ( verbose) cat("  * Restoring col names:", colNamesToRestore, "\n")
      colnames(x) <- colNamesToRestore
    }

  } else {
    if ( verbose) cat("* Data frame NOT given\n")
  }
  
  if ( is.array(x) ) {
    if ( verbose ) cat("* NOW working with an array\n ")
    if ( verbose ) cat("* Computing array size: ")
    currentDim <- dim(x) # NULL if scalar. Use to restore dimension.
    if ( verbose ) cat("initially: ", currentDim)
    if (length(currentDim) == 1) {
      x <- array( x, dim = c(1,  dim(x)))
      currentDim <- dim(x)
    }  
    currentCols <- currentDim[2]
    currentRows <- currentDim[1]
    xAnArray <- TRUE
    if ( verbose ) cat("; adjusted (if necessary):", currentDim, "\n")
    
    # Determine if row names exists, and save to be able to restore them
    xHasRowNames <- FALSE
    if (!is.null(rownames(x))) {
      if ( verbose) cat("* Storing row names\n")
      xHasRowNames <- TRUE
      rowNamesToRestore <- rownames(x)
    }

    # Determine if col names exists, and save to be able to restore them
    xHasColNames <- FALSE
    if (!is.null(colnames(x))) {
      if ( verbose) cat("* Storing column names\n")
      xHasColNames <- TRUE
      colNamesToRestore <- colnames(x)
    }
  
  } else {
    # Probably a single number... or a vector
    if (is.vector(x)) {
      if ( verbose) cat("* Computing vector size")
      currentDim <- length(x)
      currentCols <- 1
      currentRows <- length(x)
      xAnArray <- FALSE
      if ( verbose) cat(currentRows, "\n")
    } else{
      if ( verbose) cat("* Identifying scalar\n")
      currentDim <- NA
      currentCols <- 1
      currentRows <- 1
      xAnArray <- FALSE
    }
  }  

  # digits  and targetLength  may be entered as
  #   * one digits: Fill out an array with this digit.
  #   * one digits for each column: Fill out an array with this digit.
  #   * an array, same size as input, giving the vaklue for each cell.
  

  # If  targetLength  given once, make length appropriate for use by columns
  if ( verbose) cat("* numRows and numCols:", currentRows, currentCols, "\n")
  

  if ( verbose) cat("* Lengthening targetLength if necessary\n")
  if ( verbose) cat("  * Current length:", length(targetLength), "\n")
  if ( length(targetLength) != currentRows * currentCols) {
    if ( length(targetLength) == 1) {
      targetLength <- rep( targetLength, 
                           times = currentRows * currentCols)
    } else { # One digit per col
      targetLength <- rep(targetLength, each = currentRows) 
    }
  } else {
    tmp <- matrix( nrow = currentRows, 
                   ncol = currentCols, 
                   data = targetLength,
                   byrow = TRUE)
    targetLength <- c( tmp ) # Since we operate BY COLS in what follows
    
  }
  targetLength <- c(targetLength)
  if ( verbose) cat("  * Finished length:", length(targetLength), "\n")
  
  

  # If digits given once, make length appropriate for use by columns
  if ( verbose) cat("* Lengthening digits if necessary\n")
  if ( verbose) cat("  * Current length:", length(digits), "\n")
  if ( length(digits) != currentRows * currentCols) {
    if ( length(digits) == 1) {
      digits <- rep( digits, 
                     times = currentRows * currentCols)
    } else { # One digit per col
      if (verbose) print(digits)
      digits <- rep(digits, each = currentRows) 
      if (verbose) print(digits)
    }
  } else {
    tmp <- matrix( nrow = currentRows, 
                   ncol = currentCols, 
                   data = digits,
                   byrow = TRUE)
    digits <- c( tmp ) # Since we operate BY COLS in what follows
  }
  digits <- c( digits)
  if ( verbose) cat("  * Finished length:", length(digits), "\n")
  if ( verbose) cat("  * digits:", digits, "\n")
  if ( verbose) cat("  * targetLengths:", targetLength, "\n")
  if ( verbose) cat("  * (Their lengths:", length(digits), length(targetLength), ")\n")
  if (verbose) cat("----------------------------------------------------------------\n")
  
  
  if ( !is.null(currentDim) ) x <- c(x)
  
  
  
  ### NOW TO THE PADDING AND ROUNDING ETC
  
  xLen <- length(x) # The number of elements to work with 
  out <- array( dim = xLen)
  
  # Keep tabs on which row and column we are working on:  
  thisRow <- 0 # Rows move fastest
  thisCol <- 1 # Cols move slowest
  
  # Take each element one at a time
  if ( verbose) cat("* Dealing element-by-element:\n")
  for (i in 1:xLen){
    if ( verbose) cat("\n ---------------- \n  * Element:", i, "\n")
    if ( verbose) cat("    * targetLength:", targetLength[i], "\n")
    if ( verbose) cat("    * digits:", digits[i], "\n")
    
    # Update the row and column currently being worked on
    thisRow <- thisRow + 1
    if( thisRow == (currentRows + 1)){ # Then move to next column, and start again at Row 1
      thisCol <- thisCol + 1
      thisRow <- 1
    }
    if ( verbose) cat("  * row/col:", thisRow, thisCol, "\n")

    # Determine if a negative sign needs to be \phantomed-ed in this COLUMN
    addNegativeSignForThisCol <- FALSE

    # - First, strip any text before checking
    cleanNumbers <- function(arr) {
      # Remove all non-numeric characters, including periods and negative signs
      result <- gsub("[^0-9.-]", "", arr)
      
      # Convert empty strings to NA
      result[result == ""] <- NA
      
      # Convert to numeric, with NA for non-numeric elements
      as.numeric(result)
    }
    
    
    thisColTmp <- cleanNumbers( x[((thisCol - 1) * currentRows + 1) : (thisCol * currentRows)] )

    # - Now check: Any negative numbers in here?
    anyNegNumbers <- any( thisColTmp < 0, na.rm = TRUE) 

if ( anyNegNumbers ) {
      addNegativeSignForThisCol <- TRUE
    }
    if ( verbose) cat("  * Determining if negative sign needed for this COLUMN:", addNegativeSignForThisCol, "\n")
    if ( verbose) cat("  * Checking elements", 
                      (thisCol - 1) * currentRows + 1, 
                      "to", 
                      thisCol * currentRows, 
                      "\n")
    

    # Check if element can be converted to numeric, or not; if not, leave it be.
    elementIsNumeric <- varhandle::check.numeric( x[i])
    # This return  TRUE  if the cell is NA. So check this separately
    if ( is.na(x[i]) ) elementIsNumeric <- FALSE
    if ( verbose) cat("  * Determining if element numeric:", elementIsNumeric, "\n")
    
    if (elementIsNumeric) { 
      x[i] <- as.numeric( x[i] )
      
      
      # Now, may have this situation: 2.1, 13.4 and 2.334.
      # So [1] needs one dp showing, but *space* for 3 dp:
      #   2.1 
      #  13.4
      #   2.334
      #
      # The padding needed at the right we call backPadding
      
      maxColumnDigits <- max( digits[((thisCol - 1) * currentRows + 1) : (thisCol * currentRows)] )
      backPadding <-  maxColumnDigits - digits[i]
      if ( verbose ) cat("  * Numeric value to align:", x[i], "\n")
      if ( verbose ) cat("    * digits:", digits[i], "\n")
      if ( verbose ) cat("    * targetLength:", targetLength[i], "\n")
      if ( verbose ) cat(" backPadding: ", backPadding, "\n")
cat(">>> ", maxColumnDigits , digits[i], backPadding,"<<<\n")      
      
      #cat("digits = ", digits[thisCol], "width = ", targetLength[thisCol], "\n")
      if (verbose ) cat("     targetLength - backPadding:", targetLength[i] - backPadding, "\n")
      xi <- format( round( as.numeric(x[i]), 
                           digits[i]),
                    #digits = digits,
                    nsmall = digits[i],
                    justify = "right",
                    big.mark = big.mark,
                    width = targetLength[i] - backPadding)
      if ( verbose) cat("  * First update: '", xi, "'\n",
                        sep = "")
      
      xi <- gsub(pattern = " ", 
                 replacement = "\\\\phantom{0}", 
                 xi)
      if ( verbose) cat("  * Second update: '", xi, "'\n",
                        sep = "")
      
      
      if ( backPadding > 0 ) xi <- paste0( xi, 
                                        strrep("\\phantom{0}", backPadding) )
      if ( verbose) cat("  * Third update: '", xi, "'\n",
                        sep = "")
      
      # # if ( currentLength < targetLength) {
     #    if (where == "front"){
     #      out[i] <- paste0( paste(rep("\\phantom{0}", targetLength - length(digits)), collapse = ""),
     #                        xi,
     #                        collapse = "")
     #    } else {
     #      out <- paste0(xi,
     #                    paste(rep("\\phantom{0}", targetLength - length(digits)), collapse=""),
     #                    collapse = "")
     #    }
     #  #} else {
     #  #  out[i] <- xi
     #  #}

      if (surroundMaths) xi <- paste0( "$", xi, "$", 
                                           collapse = "") 
      
      if ( verbose) cat("  * Fourth update: '", xi, "'\n",
                        sep = "")
      
      currentLength <- nchar( as.character(x[i]))
      # Replace first phantom with \phantom{-} if needed
      if (addNegativeSignForThisCol) {
        if ( verbose) cat("  * Dealing with negatives:", xi, "\n")
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
        if ( verbose) cat("  * Fourth update:", xi, "\n")
        
      }
      
      out[i] <- xi
      
    } else { # So these cannot be converted to numeric; likely are text
      #cat("Non numeric\n")
      if (is.na(x[i]) ) {
        out[i] <-  NA
        if ( verbose) cat("  * Element is NA: no padding\n")
        
      } else { # TEXT
        if ( verbose) cat("  * Element is text\n")
        
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
                                      collapse = ""),
                              "$",
                              x[i],
                              collapse = "")
            
          }
        } else {
           out[i] <- x[i]
        }
        
      }
    }
  } 
  
  ### NOW RESTORE TO ORIGINAL SHAPE, WITH NAMES
  if ( xAnArray ) {
    if ( verbose) cat("* Restoring shape:\n")
    if ( verbose) cat("  * Current shape:", dim(out), "\n")
    
    dim(out) <- currentDim

    if ( verbose) cat("  * Final shape:", dim(out), "\n")

    if ( verbose) cat("* Restoring col, row names if necessary:\n")
    if ( verbose) cat("  * xHasRowNames:", xHasRowNames, "\n")
    if ( verbose) cat("  * xHasColNames:", xHasColNames, "\n")
    
    if (xHasRowNames) {
      if ( verbose) cat("  * Row names: ", rowNamesToRestore, "\n")
      rownames(out) <- rowNamesToRestore
      if ( verbose) cat("  * Row names length: ", length(currentCols), "\n")
    }
    if (xHasColNames) {
      if ( verbose) cat("  * Col names: ", colNamesToRestore, "\n")
      colnames(out) <- colNamesToRestore
      if ( verbose) cat("  * Col names length: ", length(currentRows), "\n")
    }
  }
  
  out
}