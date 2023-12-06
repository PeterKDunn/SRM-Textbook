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


############################################################################


pad2 <- function(x, digits = 2, targetLength = 4, where = "front", surroundMaths = FALSE){
  
  currentDim <- dim(x) # NULL if scalar
  
  if ( !is.null(currentDim) ) x <- c(x)
  
  xLen <- length(x)
  out <- array( dim = xLen)
  
  for (i in 1:xLen){
#cat("\n---\n", x[i], "\n")
        xi <- format( round( as.numeric(x[i]), digits),
                  #digits = digits,
                  nsmall = digits,
                  justify = "right",
                  width = targetLength)
 # cat(xi, "\n")

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
  }
  
  if ( !is.null(currentDim) ) dim(out) <- currentDim
  
  out
}