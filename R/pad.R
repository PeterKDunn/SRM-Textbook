pad2 <- function(x, targetLength = 2, where = "front", surroundMaths = FALSE){
  
  currentDim <- dim(x) # NULL if scalar
  
  if ( !is.null(currentDim) ) x <- c(x)
  
  xLen <- length(x)
  out <- array( dim = xLen)
  
  for (i in 1:xLen){
    currentLength <- nchar( as.character(x[i]))
    
    if ( currentLength < targetLength) {
      if (where == "front"){
        out[i] <- paste( paste(rep("\\phantom{0}", targetLength - currentLength), collapse = ""), 
                         x[i],
                         collapse = "")
      } else {
        out <- paste(x[i], 
                     paste(rep("\\phantom{0}", targetLength - currentLength), collapse=""),
                     collapse = "")
      }
    } else {
      out[i] <- x[i]
    }
    
    if (surroundMaths) out[i] <- paste("$", out[i], "$", collapse = "") 
  }
  
  if ( !is.null(currentDim) ) dim(out) <- currentDim
  
  out
}


############################################################################


pad <- function(x, digits = 2, targetLength = 4, where = "front", surroundMaths = FALSE, textAlign = "left", big.mark = ""){
  
  # digits is the number of DECIMAL digits
  # targetLength  is the total length of the field (including negative signs and decimal points)
  # where  is how the numbers are aligned
  # big.mark is the format() input of same name. To call it, need to backslash *four* times: pad(..., big.mark = "\\\\,") 
  
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
    
    xHasRowNames <- FALSE
    if (!is.null(rownames(x))) {
      xHasRowNames <- TRUE
      rowNamesToRestore <- rownames(x)
    }

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
  #cat("XYZ\n")
  #cat(currentCols,"\n")
  if ( length(targetLength) == 1) targetLength <- rep( targetLength, 
                                                       times = currentCols)
  #cat("ABC\n")
  
  # If digits given once, make length appropriate for use by columns
  if ( length(digits) == 1) digits <- rep( digits, currentCols)
#cat("digits:", digits,"\n")
#cat("currentCols:", currentCols,"\n")

  if ( !is.null(currentDim) ) x <- c(x)
  
  xLen <- length(x)
  out <- array( dim = xLen)
  
  
  thisRow <- 0
  thisCol <- 1
  # Take each element at a time
  for (i in 1:xLen){
    
    thisRow <- thisRow + 1
    if( thisRow == (currentRows + 1)){ # Then move to next column, and start again at Row 1
      thisCol <- thisCol + 1
      thisRow <- 1
    }
    #cat("\n---\ni = ", i,":", x[i], "\n")
    #cat("This row, col=", thisRow, thisCol, "\n")
    
    
    # Check if element can be converted to numeric, or not; if not, leave it be.
    elementIsNumeric <- varhandle::check.numeric( x[i])
    # This return  TRUE  if the cell is NA. So check this separately
    if ( is.na(x[i]) ) elementIsNumeric <- FALSE
    
    #locateNumeric[ is.na( x[i])] <- FALSE 
    
    #cat("digits:", digits, "\n")
    if (elementIsNumeric) { 
      #cat("NUMERIC: i = ",i," and x[i] = ", x[i],"\n")
      x[i] <- as.numeric( x[i] )
      
      #cat("digits = ", digits[thisCol], "width = ", targetLength[thisCol], "\n")
      xi <- format( round( as.numeric(x[i]), 
                           digits[thisCol]),
                    #digits = digits,
                    nsmall = digits[thisCol],
                    justify = "right",
                    big.mark = big.mark,
                    width = targetLength[thisCol])
       #cat(xi, "\n")
      
      xi <- gsub(pattern = " ", 
                 replacement = "\\\\phantom{0}",
                 xi)
      
      #cat(xi, "\n")
      
      out[i] <- xi
      
      currentLength <- nchar( as.character(x[i]))
      
      
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
      if (surroundMaths) out[i] <- paste0( "$", out[i], "$", 
                                           collapse = "") 
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