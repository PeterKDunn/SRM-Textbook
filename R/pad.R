pad <- function(x, 
                decDigits = 2, 
                targetLength = 4, 
                #where = "front", 
                surroundMaths = FALSE,
                textAlign = "left", 
                big.mark = "",
                verbose = FALSE){
  
  # decDigits is the number of DECIMAL digits
  # targetLength  is the total length of the field (including negative signs and decimal points)
  # where  is how the numbers are aligned
  # big.mark is the format() input of same name. To call it, need to backslash *four* times: pad(..., big.mark = "\\\\,") 
  
  # decDigits  and targetLength  may be entered as
  #   * one digits: Fill out a vector with this digit.
  #   * one digits for each column: Fill out a vector with this digit.
  #   * one digit for each element, given across rows, same size as input, giving the value for each cell.
  
  
  
  ### SET UP AND PRELIMINARIES
  numRows <- 1
  numCols <- 1
  xHasRowNames <- FALSE
  xHasColNames <- FALSE
  
  
  ### ENSURE AN ARRAY (e.g., not data frame); CONVERT IF NEEDED
  
  if (is.data.frame(x)) { # CONVERT to an array for our purposes
    if ( verbose) cat("* Data frame given\n")
    if ( verbose) cat("* Converting data.frame to array\n")
    
    # Store row and col names if present
    
    if (!is.null(rownames(x))) {
      if ( verbose) cat("  * Storing row names\n")
      xHasRowNames <- TRUE
      rowNamesToRestore <- rownames(x)
    }
    
    # Determine if col names exists, and save to be able to restore them
    xHasColNames <- FALSE
    if (!is.null(colnames(x))) {
      if ( verbose) cat("  * Storing column names\n")
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
    if ( verbose) cat("  * Storing row, col names\n")
    if (xHasRowNames){
      if ( verbose) cat("  * Storing row names:", rowNamesToRestore, "\n")
      rownames(x) <- rowNamesToRestore 
    }
    if (xHasColNames) {
      if ( verbose) cat("  * Storing col names:", colNamesToRestore, "\n")
      colnames(x) <- colNamesToRestore
    }
    
  } else {
    if ( verbose) cat("* Data frame NOT given\n")
  }
  
  
  
  # ARRAY DETAILS
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
  
  locateNA <- which( is.na(x) )
  
  
  ### SORT OUT INPUTS: maybe entered as one-per-matrix-element entry, or by col, or once only
  
  # decDigits  and targetLength  may be entered as
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
  
  
  
  # If decDigits given once, make length appropriate for use by columns
  if ( verbose) cat("* Lengthening decDigits if necessary\n")
  if ( verbose) cat("  * Current length:", length(decDigits), "\n")
  if ( length(decDigits) != currentRows * currentCols) {
    if ( length(decDigits) == 1) {
      decDigits <- rep( decDigits, 
                        times = currentRows * currentCols)
    } else { # One digit per col
      decDigits <- rep(decDigits, each = currentRows) 
    }
  } else {
    tmp <- matrix( nrow = currentRows, 
                   ncol = currentCols, 
                   data = decDigits,
                   byrow = TRUE)
    decDigits <- c( tmp ) # Since we operate BY COLS in what follows
  }
  decDigits <- c( decDigits)
  if ( verbose ) cat("  * Finished length:", length(decDigits), "\n")
  if ( verbose ) cat("  * decDigits:", decDigits, "\n")
  if ( verbose ) cat("  * targetLengths:", targetLength, "\n")
  if ( verbose ) cat("  * (Their lengths:", length(decDigits), length(targetLength), ")\n")
  if ( verbose ) cat("----------------------------------------------------------------\n")
  
  if ( !is.null(currentDim) ) x <- c(x)
  
  
  
  ### EXTRACT NUMBERS, PRE-TEXT AND POST-TEXT
  if ( verbose ) cat("* Splitting input into numbers, pre-text and post-text\n")
  
  # Define function to do so:
  extractParts <- function(arr) { # arr  is a one-dimensional array
    numbers <- gsub("[^0-9.-]", "", 
                    arr)
    numbers[numbers == ""] <- NA  # Replace empty strings with NA
    numbers <- as.numeric(numbers) # Convert to numeric
    
    
    # Text before the numbers: Capture everything before the first number
    textBefore <- gsub("([^-0-9]*)[0-9.-].*", 
                       "\\1", 
                       arr)
    # Replace NA with empty strings
    textBefore[ is.na(textBefore) ] <- " "
    # If the text contains numbers (e.g., "More than $5^\\circ$C"), this will screw things up. 
    # Not sure how to even flag that case, so perhaps we ENFORE A RULE that it should be contained in \text: "\\text{More than $5^\\circ$C"}
    # So find these cases
    if (verbose) message("*** REMEMBER: If cells contain $...$ as pary of text, wrap the element with  \text{...}!! ***")
    textInBefore <- grepl("\\\\text", 
                         textBefore) # TRUE or FALSE for each element

    
    # Text after the numbers: Capture everything after the last number
    textAfter <- gsub(".*[0-9.-]+([^0-9]*)$", 
                      "\\1", 
                      arr)
    textAfter[ is.na(textAfter) ] <- " "  # Replace NA with empty strings
    
    # If the entry is *just* text, the same text appears in both pre- and -post... so fix this by removing from POST
    # This is where  numbers  is NA (i.e., no numbers)
    if (verbose) cat("Before:", textBefore, "\n")
    whichNA <- which(is.na(numbers))
    if( length( whichNA > 0) ){
      if (verbose) cat("   * whichNA:", whichNA, "\n")
      for (j in 1:length(whichNA)){
        if ( verbose ) cat("  * Adjusting for repeated pre/post due to text only entry:", j, "\n")
        if (textBefore[ whichNA[j] ] == textAfter[ whichNA[j] ] ) textAfter[ whichNA[j] ] <- ""
      }
    }
    # Return a list with the three components
    list(numbers = numbers,
         textBefore = textBefore,
         textInBefore = textInBefore,
         textAfter  = textAfter, 
         isNumberNA = sapply(numbers, 
                             "is.na")) # Returns  TRUE  if the cell is empty (i.e., don't add phantoms and co, as there are no numbers)
  }
  

  
  # Use it to extract  
  out <- extractParts(x)
  numbersArray <- out$numbers
  numbersArrayAdjusted <- as.character(out$numbers)
  preNumberText <- out$textBefore
  postNumberText <- out$textAfter
  isNumberNA <- out$isNumberNA
  textInBefore <- out$textInBefore
  
#  print(array( preNumberText,  dim = currentDim ))
#  print(array( numbersArray,  dim = currentDim ))
#  print(array( postNumberText,  dim = currentDim ))
  
  
  if ( verbose ) cat("----------------------------------------------------------------\n")
  
  
  ### NOW TO THE PADDING AND ROUNDING ETC (i.e., the guts)
  
  xLen <- length(x) # The number of elements to work with 
  out <- array( dim = xLen)
  
  # Keep tabs on which row and column we are working on:  
  thisRow <- 0 # Rows move fastest
  thisCol <- 1 # Cols move slowest
  
  # Take each element one at a time
  if ( verbose) cat("* Dealing element-by-element *down* the columns:\n")
  for (i in 1:xLen){ # For each element, going down the columns
    if ( verbose) cat("\n---------------------------------------------------------- \n")
    if ( verbose) cat("  * Element:", i, " which is ", numbersArray[i] , "\n")
    if ( verbose) cat("    * targetLength:", targetLength[i], "\n")
    if ( verbose) cat("    * decDigits:", decDigits[i], "\n")
    
    if( !is.na(as.numeric(numbersArray[i]) ) ) { # If NA, skip all this, and keep as NA: Prob means that array element is all text
      
      # Update the row and column currently being worked on
      thisRow <- thisRow + 1
      if( thisRow == (currentRows + 1)){ # Then move to next column, and start again at Row 1
        thisCol <- thisCol + 1
        thisRow <- 1
      }
      if ( verbose) cat("  * Matrix entry: row/col:", thisRow, thisCol, "\n")
      
      
      # FIRST check if we need to add $ in the pre- and post-text
      if ( surroundMaths){
        # See if "$" appears in the pre-string
        containsDollarPre  <- grepl("\\$", preNumberText[i])
        # See if "$" appears in the post-string
        containsDollarPost <- grepl("\\$", postNumberText[i])
        
        # Now:
        # 1. If in both, we're fine.
        # 2. If in neither, add $ to both.
        # 3. If is ONLY the pre... assume it is something like $1.50... amd leave it be.
        # So Case 2 is the only one that needs attention
        #
        # If  textInBefore  is TRUE, leave it alone!
        
        if( !textInBefore[i] ){
          if ( (!containsDollarPre) & (!containsDollarPre) ){
            # Add "$"
            if (verbose) cat("  * Adding $...$\n")
            preNumberText[i]  <- paste0( preNumberText[i], "$")
            postNumberText[i] <- paste0( "$", postNumberText[i])
          }
          
          
          # Extract the first character of post- string
          charAfterNumber <- ifelse(!is.na(postNumberText[i]),
                                    substr(postNumberText[i], 1, 1), 
                                    NA)
          if ( !is.na(charAfterNumber)){
            if ( charAfterNumber != "$"){
              postNumberText[i] <- paste0( postNumberText[i], "$")
            }
          }
        }
      }
      
      
      # PHANTOM{-}
      # Determine if a negative sign needs to be \phantomed-ed in this COLUMN
      addNegativeSignForThisCol <- FALSE
      
      thisColTmp <- numbersArray[((thisCol - 1) * currentRows + 1) : (thisCol * currentRows)]
      
      # - Now check: Any negative numbers in here?
      anyNegNumbers <- any( as.numeric(thisColTmp) < 0, 
                            na.rm = TRUE) 
      if ( verbose) cat("  * Determining if negative sign needed for this COLUMN:", anyNegNumbers, "\n")
      
      
      countNegativeSignAdded <- 0
      if ( anyNegNumbers ) {
        if ( verbose) cat("  * YES; negative numbers in this column\n")
        if ( verbose) message("  * Work with ", numbersArray[i])
        # Then add a phantom{-} where positive numbers are present (neg numbers don't need it)
        if( !is.na(numbersArray[i])){
          if ( verbose)  message("  * Not NA")
          if ( numbersArray[i] > 0 ) {
            if ( verbose) message("  * Minus number")
            if ( !isNumberNA[i] ){ # Only if numbers appear in this cell
              if ( verbose)  message("  * Adjusting")
              preNumberText[i] <- paste0(preNumberText[i],
                                         "\\phantom{-}")
              countNegativeSignAdded <- 1
            }
          }
        }
      }
      
      
      # FRONTPADDING AND BACKPADDING
      # Now, may have this situation: 2.1, 13.4 and 2.334.
      # So [1] needs one dp showing, but *space* for 3 dp:
      #   2.1 
      #  13.4
      #   2.334
      #
      # The padding needed at the right we call backPadding
      # The padding needed at the left  we call frontPadding
      
      if ( !isNumberNA[i]) { 
        
        maxColumnDecDigits <- max( decDigits[((thisCol - 1) * currentRows + 1) : (thisCol * currentRows)] )
        backPadding <- maxColumnDecDigits - decDigits[i]
        if (verbose) cat("* backPadding calculation done:", backPadding, "\n")
        
        #message( round(numbersArray[i]) )
        numExistingdecDigitsBeforeDecimal <- nchar(as.character(floor( as.numeric(numbersArray[i]))))
        frontPadding <- (targetLength[i] - maxColumnDecDigits ) - numExistingdecDigitsBeforeDecimal - countNegativeSignAdded
        #frontPadding <- targetLength - backPadding 
        if (verbose) message("targetLength: ", targetLength[i])
        if (verbose) message("maxColumnDecDigits: ", maxColumnDecDigits)
        if (verbose) message("numExistingdecDigitsBeforeDecimal: ", numExistingdecDigitsBeforeDecimal)
        if (verbose) message("frontPadding: ", frontPadding)
        
        # NOW:  -1 for the decimal point IF THE NUMBERS HAVE A DECIMAL POINT!
        if ( maxColumnDecDigits > 0 ) frontPadding <- frontPadding - 1
        
        if (verbose) cat("* frontPadding calculation done: ", frontPadding, "\n")
        if ( verbose ) cat("  * Numeric value to align:", x[i], "\n")
        if ( verbose ) cat("    * decDigits:", decDigits[i], "\n")
        if ( verbose ) cat("    * targetLength:", targetLength[i], "\n")
        if ( verbose ) cat(" backPadding: ", backPadding, "\n")
        if ( verbose ) cat("     targetLength - backPadding:", targetLength[i] - backPadding, "\n")
        
        numbersArray[i] <- format( round( as.numeric(numbersArray[i]), 
                                          decDigits[i]),
                                   nsmall = decDigits[i],
                                   justify = "right",
                                   big.mark = big.mark,
                                   width = targetLength[i] - backPadding)
        if ( verbose) cat("  * First update: '", numbersArray[i], "'\n",
                          sep = "")
        
        # Now add phantom{0} to front as needed
        if ( frontPadding > 0 ) preNumberText[i] <- paste0( preNumberText[i], 
                                                            strrep("\\phantom{0}", frontPadding) )
        if ( verbose) cat("  * Second update: '", preNumberText[i], "'\n",
                          sep = "")
        
        
        if ( backPadding > 0 ) postNumberText[i] <- paste0( postNumberText[i], 
                                                            strrep("\\phantom{0}", backPadding) )
        if ( verbose) cat("  * Third update: '", postNumberText[i], "'\n",
                          sep = "")
        
        
        currentLength <- nchar( as.character(x[i]))
        # out[i] <- xi
        
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
    } else {
      if (verbose) cat("  * Element is NA, so SKIPPING any processing\n")
      
      # Update the row and column currently being worked on
      thisRow <- thisRow + 1
      if( thisRow == (currentRows + 1)){ # Then move to next column, and start again at Row 1
        thisCol <- thisCol + 1
        thisRow <- 1
      }
    }
  } 
  
  ### NOW REJOIN PRE, NUMBERS, POST
  # To paste, any NA gets added as "NA".
  # So first replace NA by a zero-length string
  numbersArray[ is.na(numbersArray)] <- ""
  out <- paste0( array( preNumberText,  dim = currentDim ),
                 array( numbersArray,   dim = currentDim ),
                 array( postNumberText, dim = currentDim ))
  if (verbose) print(array( preNumberText,  dim = currentDim ))
  if (verbose) print(array( numbersArray,  dim = currentDim ))
  if (verbose) print(array( postNumberText,  dim = currentDim ))
  
  ### NOW RESTORE TO ORIGINAL SHAPE, WITH NAMES
  if ( xAnArray ) {
    if ( verbose) cat("* Restoring shape:\n")
    if ( verbose) cat("  * Current shape:", dim(out), "\n")
    
    out[locateNA] <- NA
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