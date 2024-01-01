showSampleSystematic <- function(sizeHorizontal = 21,
                                 sizeVertical = 21,
                                 sampleSize = 40,
                                 static = TRUE,
                                 start = NA,
                                 plotDark = "blue",
                                 seed = 91827391){ 
  set.seed(seed)
  
  populationSize <- sizeHorizontal * sizeVertical
  population <- 1:(populationSize)
  
  jump <- floor(sizeHorizontal * sizeVertical / sampleSize)
  
  # Start value may be given (`start`), but start somewhere at random, unless given
  if ( is.na(start)) start <- sample(1:jump, size = 1) # Select a starting place

  selected <- seq(start, sizeHorizontal * sizeVertical, # Start at the value `start`
                  by = jump)

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
    
    # Some labels    
    mtext( paste("Total number of students: ", populationSize, sep = ""), 
           side = 3, 
           cex = 0.8,
           at = sizeHorizontal / 2)
    ordinal <- "th"
    if (jump == 2) ordinal <- "nd"
    if (jump == 3) ordinal <- "rd"
    
    mtext(paste0("Select ", sampleSize, " students, selecting every ", start, ordinal, " student"),   
          side = 1, 
          cex = 0.8,
          at = sizeHorizontal / 2)

    # Add points/students    
    points( expand.grid(1:sizeHorizontal, 1:sizeVertical), 
            pch = sample.pch, 
            col = sample.col,
            cex = sample.cex)
  }
}