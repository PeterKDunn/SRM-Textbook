pad <- function(x, 
                decDigits = 2, 
                targetLength = 4, 
                surroundMaths = TRUE,
                textAlign = "left", 
                big.mark = "",
                verbose = FALSE){
  
  # decDigits is the number of DECIMAL digits
  # targetLength  is the total length of the field (including negative signs and decimal points)
  # big.mark is the format() input of same name. To call it, need to backslash *four* times (!): pad(..., big.mark = "\\\\,") 
  #
  # In what follows, we work with columns.
  #
  # decDigits  and targetLength  may be entered as
  #   * one digits: Fill out an array of the same size as  x  with this digit.
  #   * one digits for each column: Fill out an array the same size as  x  with this digit in each column.
  #   * one digit for each element, same size as input, giving the value for each cell.
  
  
  ### SET UP AND PRELIMINARIES

  
  ### ENSURE AN ARRAY (e.g., not data frame); CONVERT IF NEEDED
  
  if (is.vector(x)) x <- matrix( x, 
                                 nrow = 1,
                                 ncol = length(x))
  
  if (is.array(x)) {
    if ( length(dim(x) ) == 1) x <- matrix( x, 
                                            nrow = 1,
                                            ncol = length(x))
    
  }
  
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
    
    # Matrix size
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
  # x NOW CONVERTED TO AN ARRAY
  

  ### SORT OUT INPUTS: maybe entered as one-per-matrix-element entry, or by col, or once only
  
  # decDigits  and targetLength  may be entered as
  #   * one digits: Fill out an array with this digit.
  #   * one digits for each column: Fill out an array with this digit.
  #   * an array, same size as input, giving the vaklue for each cell.
  
  numRows <- dim(x)[1]
  numCols <- dim(x)[2]
  if ( length(decDigits) == 1 ) {
    decDigits <- matrix( decDigits, 
                         nrow = numRows,
                         ncol = numCols )
  } else {
    decDigits <- matrix( decDigits,
                         nrow = numRows,
                         ncol = numCols,
                         byrow = TRUE)
  }
  if ( length(targetLength) == 1 ) {
    targetLength <- matrix( targetLength, 
                            nrow = numRows,
                            ncol = numCols )
  } else {
    targetLength <- matrix( targetLength,
                            nrow = numRows,
                            ncol = numCols,
                            byrow = TRUE)
  }
  
  if ( verbose ) cat("----------------------------------------------------------------\n")
  if ( verbose ) print(as.matrix(x))
  if ( verbose ) print(decDigits)
  if ( verbose ) print(targetLength)
  if ( verbose ) cat("----------------------------------------------------------------\n")
  
#  if ( !is.null(currentDim) ) x <- c(x)
  
  
  # FINDING WHICH ENTRIES TO RETURN UNTOUCHED
  xNumeric <- matrix( as.numeric(x),
                      nrow = numRows,
                      ncol = numCols)
  # These are probably text; we just remove them, save them, restore after doing the necessary stuff to the numbers
  whichLeaveAlone <- is.na(xNumeric)
  if (verbose) print(whichLeaveAlone)

  # FINDING WHICH ENTRIES ARE NEGATIVE NUMBERS
  whichNegative <- xNumeric < 0
  if (verbose) print(whichNegative)
  xNumeric <- abs(xNumeric) # Restore negative signs later

  # Now start changing xNew
  xNew <- xNumeric
  if ( verbose ) print(xNew) 
  
  
  ### Round numbers as indicated
  xNew <- formatMatrix( round( xNumeric, 
                               decDigits),
                        nsmall = decDigits,
                        justify = "right",
                        big.mark = big.mark,
                        width = targetLength)
  if ( verbose ) cat("////////////////////////////////////////////////////////////////\n")
  if (verbose) print(xNew)
  
  ### Fix up when negative signs appear
  # Need to do this *before* the  \phantom-s  are added, so that the  -   is attached to the number as a negative sign
  if (verbose) cat("Need to fix negative signs?", any(xNew < 0, na.rm=TRUE), "\n")
  xNew <- padForNegative(xNew,
                         whichNegative,
                         verbose = verbose)
  if ( verbose ) cat("****************************************************************\n")
  if (verbose) print(xNew)

  
  ### Pad with phantoms as necessary
  xNew <- addPhantoms(xNew)

  
  if ( verbose ) cat("----------------------------------------------------------------\n")
  if ( verbose ) print(xNew)
  
  ### Add the $...$ signs to the start and end
  xNew <- paste0("$", 
                 xNew, 
                 "$")
  xNew <- matrix(xNew, # Need to reset as matrix 
                 nrow = numRows,
                 ncol = numCols)
  if ( verbose ) cat("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n")
  if ( verbose ) print(xNew)
  
  # Replace the elements that were to be left alone
  xNew[whichLeaveAlone ] <- x[whichLeaveAlone]
   
  if ( verbose ) cat("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n")
  if ( verbose ) print(xNew)
  
  #Restore col, row names
  rownames(xNew) <- rownames(x)
  colnames(xNew) <- colnames(x)
  
  
  xNew
  
}

################################################################################################################################################
### HELPER FUNCTIONS ###########################################################################################################################
################################################################################################################################################

formatMatrix <- function(mat, 
                         nsmall,
                         justify,
                         big.mark,
                         width) {

  # Check if the dimensions match those of the matrix
  if (!is.numeric(mat) || !is.numeric(nsmall) || !all(dim(mat) == dim(nsmall))) {
    stop("Input 'mat' and 'nsmall' must be numeric and of the same dimensions.")
  }
  if (!is.numeric(mat) || !is.numeric(width) || !all(dim(mat) == dim(width))) {
    stop("Input 'mat' and 'width' must be numeric and of the same dimensions.")
  }

  # Initialize a matrix to store formatted values
  formattedMat <- matrix(NA, 
                         nrow = nrow(mat), 
                         ncol = ncol(mat), 
                         dimnames = dimnames(mat))
  
  # Loop through each element of the matrix
  for (i in 1:nrow(mat)) {
    for (j in 1:ncol(mat)) {
      formattedMat[i, j] <- format(mat[i, j], 
                                   nsmall = nsmall[i, j],
                                   justfy = justify,
                                   big.mark = big.mark,
                                   width = width[i, j] )
    }
  }
  
  return(formattedMat)
}


addPhantoms <- function(mat){
  # Replaces spaces with phantoms. Even if this happens to other cells, it's OK; we'll be replacing them with the leave-alone stiff later anyway

  # Check if the input is a character matrix
  if (!is.matrix(mat) || !is.character(mat)) {
    stop("Input must be a character matrix.")
  }
    
  # Create a new matrix to store the modified values
  modifiedMat <- matrix(NA, 
                        nrow = nrow(mat), 
                        ncol = ncol(mat), 
                        dimnames = dimnames(mat))
    
  # Loop through each element of the matrix and replace spaces
  for (i in 1:nrow(mat)) {
    for (j in 1:ncol(mat)) {
      modifiedMat[i, j] <- gsub(" ", 
                                 "\\\\phantom{0}", 
                                 mat[i, j])
    }
  }
    
  return(modifiedMat)
 
}

padForNegative <- function(mat, whichNegative, verbose) {
  # mat currently contains all non-negative info; the negative signs were removed.
  # Now, add them back as \lap{-} so they do not impact alignment.
  
  # We need care. 
  # After rounding, an entry like  -7.12  may end up like " 7.12" after being rounded and made the correct length.
  # So we cannot just add  \phantom{-} to the front using paste0; we'd get  "\\phantom{-} 7.12", and the negative signs is not treated as such.
  
  # Thus, we need to *insert* it after any spaces.

  # Check if the input is a character matrix
  if (!is.matrix(mat) || !is.character(mat)) {
    stop("Input must be a character matrix.")
  }
  
  # Create a copy of the matrix to store modified values
  modifiedMat <- mat

  
  # Capture leading spaces using a regex
  leading_spaces <- sub("^(\\s*).*", 
                        "\\1", 
                        mat)
  
  # Remove leading spaces for further processing
  no_space_text <- trimws(mat)
  
  # Use ifelse to insert "\llap{-}" where logical_matrix is TRUE
  modifiedMat <- ifelse(whichNegative, 
                         paste0(leading_spaces, 
                                "\\llap{$-{}$}", 
                                no_space_text),  # If TRUE, insert negative with leading spaces
                         mat)                    # If FALSE, keep the original
  
  if (verbose) cat("has_negative is:\n")

  
  return(modifiedMat)
}

