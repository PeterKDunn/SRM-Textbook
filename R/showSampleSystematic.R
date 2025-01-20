showSampleSystematic <- function(sizeHorizontal = 21,
                                 sizeVertical = 21,
                                 sampleSize = 40,
                                 static = TRUE,
                                 proportionA = 2/3, # proportion females/younger in the POPULATION
                                 start = NA,
                                 plotDark = plotSolid,
                                 seed = 91827391){ 
  set.seed(seed)
  
  populationSize <- sizeHorizontal * sizeVertical
  population <- 1:(populationSize)
  
  # Identify younger:
  younger <- sample(1:populationSize,
                    populationSize * ( proportionA) )
  # Identify chosen:
  selected <- sample(1:populationSize, 
                     sampleSize)
  
  # Older:    pch = 1, selected: pch = 19
  # Younger:  pch = 6; selected: pch = 25 
  # Defaults are for NOT selected, older
  sample.pch <- rep(1, length = populationSize) # Older
  sample.pch[younger] <- 6                      # Younger
  
  sample.bg  <- rep("white", length = populationSize)
  sample.col <- rep("black", length = populationSize)
  sample.cex <- rep(1, length = populationSize)

  
  
  jump <- floor(sizeHorizontal * sizeVertical / sampleSize)
  
  # Start value may be given (`start`), but start somewhere at random, unless given
  if ( is.na(start)) start <- sample(1:jump, 
                                     size = 1) # Select a starting place

  selected <- seq(start, sizeHorizontal * sizeVertical, # Start at the value `start`
                  by = jump)

  if (static) { # If TRUE: Then no animation (i.e, pdf)}
    startLoop <- sampleSize
  } else {
    startLoop <- 1 # For the html, animated
  }
  
  for (i in (startLoop : sampleSize)){
    sampleSizeOlder <- 0
    sampleSizeYounger <- 0
    
    plot( x = c(1, sizeHorizontal), 
          y = c( ifelse( static, 1, 0), # Makes room for progress bar at the bottom
                 sizeVertical),
          type = "n",
          main = "Systematic sampling",
          axes = FALSE,
          xlab = "",
          ylab = "")
    
    # Plot the "populations
    sample.pch[ selected[1:i]] <- ifelse( sample.pch[selected[1:i]] == 1,
                                          19,
                                          sample.pch[selected[1:i]])
    sample.pch[ selected[1:i]] <- ifelse( sample.pch[selected[1:i]] == 6,
                                          25,
                                          sample.pch[selected[1:i]])
    
    sampleSizeOlder   <- sampleSizeOlder   + sum( sample.pch[selected[1:i]] == 19)
    sampleSizeYounger <- sampleSizeYounger + sum( sample.pch[selected[1:i]] == 25)
    
    sample.col <- rep("black", 
                      length = populationSize)
    sample.col[selected[1:i]] <- plotDark
    
    sample.bg <- rep("white", 
                      length = populationSize)
    sample.bg[selected[1:i]] <- plotDark

    sample.cex <- rep(1, length = populationSize)
    sample.cex[selected[1:i]] <- 1.75
    
    # Some labels    
    mtext( paste("Total number of students: ", populationSize, sep = ""), 
           side = 3, 
           cex = 0.9,
           at = sizeHorizontal / 2)
#    ordinal <- "th"
#    if (jump == 2) ordinal <- "nd"
#    if (jump == 3) ordinal <- "rd"
#    
    mtext(paste("Select every ", jump,"th person, but start at random  place", sep = ""),   
          side = 1, 
          cex = 0.9,
          at = sizeHorizontal / 2)

    # Add points/students    
    points( expand.grid(1:sizeHorizontal, 1:sizeVertical), 
            pch = sample.pch, 
            col = sample.col,
            bg  = sample.bg,
            cex = sample.cex)
    
    # Indicate the initial, randomly-chosen starting selection
    points(x = start,
           y = 1,
           lwd = 2,
           cex = 2.2,
           pch = 0)
    # Add progress bar for HTML animation
    if (!static){
      showProgressBar(i/sampleSize * 100, 
                      barColour = plotSolid, #black", 
                      boxColour = NA, # No box outline
                      lwd = 1, 
                      xPlacement = c(1, sizeHorizontal), 
                      yPlacement = c(-0.5, 0.5) )
    }
  }
  
  invisible( list( sampleSizeOlder = sampleSizeOlder,
                   sampleSizeYounger = sampleSizeYounger) )
  
}