showSampleSystematic <- function(sizeHorizontal = 21,
                                 sizeVertical = 21,
                                 sampleSize = 40,
                                 static = TRUE,
                                 plotDark = "blue",
                                 seed = 91827391){ 
  set.seed(seed)
  
  populationSize <- sizeHorizontal * sizeVertical
  population <- 1:(populationSize)
  
  jump <- floor(sizeHorizontal * sizeVertical / sampleSize)
  
  selected <- seq(1, sizeHorizontal * sizeVertical, 
                  by = jump)
  # But also start somewhere at random:
  selected <- selected + sample(1 : jump, 1)

  if (static) { # If TRUE: Then no animation (i.e, pdf)}
    startLoop <- sampleSize
  } else {
    startLoop <- 1 # For the html, animated
  }
  
  for (i in (startLoop : sampleSize)){
    plot( x = c(1, sizeHorizontal), 
          y = c(1, sizeVertical),
          type = "n",
          main = "Systematic sampling",
          axes = FALSE,
          xlab = paste("Select every ", jump,"th person, but start at random", sep = ""),
          ylab = "")
    
    # Plot the "populations
    sample.pch <- rep(1, length = populationSize)
    sample.pch[selected[1:i]] <- 15
    
    sample.col <- rep(grey(0.3), 
                      length = populationSize)
    sample.col[selected[1:i]] <- plotDark
    
    sample.cex <- rep(1, length = populationSize)
    sample.cex[selected[1:i]] <- 1.3
    
    points( expand.grid(1:sizeHorizontal, 1:sizeVertical), 
            pch = sample.pch, 
            col = sample.col,
            cex = sample.cex)
  }
}