showSampleSRS <- function(sizeHorizontal = 21,
                          sizeVertical = 21,
                          sampleSize = 40,
                          static = TRUE,
                          plotDark = "blue"){ 

  populationSize <- sizeHorizontal * sizeVertical
  population <- 1:(populationSize)

  selected <- sample(1:populationSize, sampleSize)
  
  if (static) { # If TRUE: Then no animation (i.e, pdf)}
    startLoop <- sampleSize
  } else {
    startLoop <- 1 # For the html, animated
  }

  for (i in startLoop : sampleSize){
    plot( c(1, sizeHorizontal), 
          c(1, sizeVertical),
          type = "n",
          main = "Simple random sampling",
          axes = FALSE,
          ylab = "",
          xlab =  paste("Sample size:", sampleSize))
    
    # Plot the "populations
    sample.pch <- rep(1, length = populationSize)
    sample.pch[selected[1:i]] <- 15
    
    sample.col <- rep(grey(0.3), 
                      length = populationSize)
    sample.col[selected[1:i]] <- plotDark
    
    sample.cex <- rep(1, length = populationSize)
    sample.cex[selected[1:i]] <- 1.5
    
    points( expand.grid(1:sizeHorizontal, 1:sizeVertical), 
            pch = sample.pch, 
            col = sample.col,
            cex = sample.cex)
  }
  
  
}