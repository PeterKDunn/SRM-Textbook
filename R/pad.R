pad <- function(x, targetLength = 2, where = "front", surroundMaths = FALSE){
  
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