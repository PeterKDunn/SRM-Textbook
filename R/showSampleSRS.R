showSampleSRS <- function(sizeHorizontal = 21,
                          sizeVertical = 21,
                          sampleSize = 40,
                          static = TRUE,
                          proportionA = 2/3, # proportion females/younger in the POPULATION
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
  

  ##############################################################
  
  if (static) { # If TRUE: Then no animation (i.e, pdf)}
    startLoop <- sampleSize
  } else {
    startLoop <- 1 # For the html, animated
  }

  for (i in startLoop : sampleSize){
    plot( x = c( 1, sizeHorizontal), 
          y = c( ifelse( static, 1, 0), # Makes room for progress bar at the bottom
                 sizeVertical),
          type = "n",
          main = "Simple random sampling",
          axes = FALSE,
          xpd = NA,
          ylab = "",
          xlab = "")
    

    # Some labels    
    mtext( paste("Total number of students: ", populationSize, sep = ""), 
           side = 3, 
           cex = 0.9,
           at = sizeHorizontal / 2)

    mtext(paste("Select", sampleSize, "students at random"),   
          side = 1, 
          cex = 0.9,
          at = sizeHorizontal / 2)
    
    # Add points/students
    sample.pch[ selected[1:i]] <- ifelse( sample.pch[selected[1:i]] == 1,
                                          19,
                                          sample.pch[selected[1:i]])
    sample.pch[ selected[1:i]] <- ifelse( sample.pch[selected[1:i]] == 6,
                                          25,
                                          sample.pch[selected[1:i]])
    
    sampleSizeOlder   <-  sum( sample.pch == 19)
    sampleSizeYounger <- sum( sample.pch == 25)
    
    sample.cex[ selected[1:i]] <- ifelse(static, 1.25, 1.75) # Does not impact size in printed text
    sample.bg[  selected[1:i]] <- plotDark
    sample.col[ selected[1:i]] <- plotDark
    
    points( expand.grid(1:sizeHorizontal, 1:sizeVertical), 
            pch = sample.pch, 
            bg  = sample.bg,
            col = sample.col,
            cex = sample.cex)
    
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