showSampleMultistage <- function(populationSize = 21 * 21,
                                 sampleSize = 40,
                                 numberTutorials = 20,
                                 proportionA = 2/3, # proportion females in the SAMPLE
                                 static = TRUE, 
                                 plotDark = plotSolid,
                                 main = "Multi-stage sampling",
                                 seed = 9182391){ 
  
  set.seed(seed)
  
  # Students numbers in each of the tutorials (rows):
  numStudentsInTutorials <- array( NA, 
                                   dim = numberTutorials) 
  for (i in (1:(numberTutorials - 1))){
    numStudentsInTutorials[i] <- sample(19:25, 1)
  }
  numStudentsInTutorials[ numberTutorials] <- populationSize - sum( numStudentsInTutorials, na.rm = TRUE)
  maxTutorial <- max(numStudentsInTutorials)
  
  
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
  
  sample.col <- rep("black", length = populationSize)
  sample.cex <- rep(1, length = populationSize)
  sample.bg  <- rep("white", length = populationSize)
  
  
  
  # Stage 1: Select some tutorials
  selectedTutorials <- sort( sample(1: numberTutorials, 10) )
  
  # Stage 2: Select the students within these chosen tutorials
  numStudentsSelectedEachTutorial <- 4
  
  
  # PLOT
  plotBackground <- function(showSelectedClasses = TRUE) {
    plot( x = c(1, maxTutorial), 
          y = c(1, numberTutorials),
          type = "n",
          main = main,
          axes = FALSE,
          xlab = "",
          ylab = "")
    axis(side = 2, 
         at = (1:numberTutorials)[-selectedTutorials], # Only labels the NON-SELECTED tutorials 
         labels = paste("Gp.", (1:numberTutorials)[-selectedTutorials]), # Only labels the NON-SELECTED tutorials, 
         las = 1)
    axis(side = 2, 
         at = selectedTutorials, 
         labels = paste("Gp.", selectedTutorials), 
         las = 1, 
         font = 2) # BOLD text
    
    # Grey box around chosen classes
    if( showSelectedClasses ) {
      for (i in (1:length(selectedTutorials))){
        j <- selectedTutorials[i]
        polygon(x = c(0.25, 0.25, 
                      maxTutorial + 0.5, maxTutorial + 0.5),
                y = c(j - 0.5, j + 0.5, 
                      j + 0.5, j - 0.5),
                border = NA, # No borders
                col = grey(0.9))
      }
    }
    # Now plot everyone:
    
    for (j in 1:numberTutorials){
      
      minLinear <- ifelse(j == 1, 1, sum( numStudentsInTutorials[1 : (j - 1)]) + 1)
      maxLinear <- sum( numStudentsInTutorials[1:j]) 
      
      points(x = 1:numStudentsInTutorials[j], 
             y = rep(j, numStudentsInTutorials[j]),
             pch = sample.pch[minLinear : maxLinear ],
             col = "black",
             cex = 1,
             lwd = 1)
    }
  }
  
  ###
  
  this.pch <- sample.pch
  this.col <- sample.col
  this.cex <- sample.cex
  this.bg <-  sample.bg
  
  sampleSizeOlder <- 0
  sampleSizeYounger <- 0
  
  for (i in (1:numberTutorials)){
    
    if (i %in% selectedTutorials){
      selectedStudents <- sort( sample(1:numStudentsInTutorials[i], 
                                       numStudentsSelectedEachTutorial) )
      
      if (i == 1 ){
        selection <- (1 : sum(numStudentsInTutorials[1:i]) )
        minSelect <- 1
      } else {
        selection <- (sum(numStudentsInTutorials[1:(i - 1)]) + 1) : sum(numStudentsInTutorials[1:i])
        minSelect <- sum( numStudentsInTutorials[1:(i - 1)])
      }
      linearSelect <- minSelect + selectedStudents
      
      this.pch[ linearSelect[ sample.pch[ linearSelect ] == 1] ] <- 19
      this.pch[ linearSelect[ sample.pch[ linearSelect ] == 6] ] <- 25
      
      this.col[ linearSelect[ sample.col[ linearSelect ] == "black"] ] <- plotDark
      this.cex[ linearSelect[ sample.cex[ linearSelect ] == 1] ]    <- ifelse(static, 1.2, 1.75)
      this.bg[  linearSelect[ sample.bg[  linearSelect ] == "white"] ] <- plotDark
    }
  }
  
  #########################################################################################
  if (static){
    plotBackground()
    
    for (i in (1:numberTutorials)){
      
      if (i %in% selectedTutorials) {

        if (i == 1 ){
          selection <- (1 : sum(numStudentsInTutorials[1:i]) )
        } else {
          selection <- (sum(numStudentsInTutorials[1:(i - 1)]) + 1) : sum(numStudentsInTutorials[1:i])
        }

        points(x = 1:numStudentsInTutorials[i], 
               y = rep(i, numStudentsInTutorials[i]),
               pch = this.pch[selection],
               col = this.col[selection],
               cex = this.cex[selection],
               bg  = this.bg[selection])
        
        sampleSizeOlder   <- sampleSizeOlder + sum( this.pch[selection] == 19)
        sampleSizeYounger <- sampleSizeYounger + sum( this.pch[selection] == 25)
        
      }
      
    }
    mtext(paste("Selected classes:", paste( sort(selectedTutorials), collapse = ", ")),
          side = 1,
          cex = 0.9,
          at = (1 + maxTutorial) / 2 )
  } else { # NOT STATIC (static = FALSE) ######################################################
    # Step 1
    plotBackground(showSelectedClasses = FALSE)
    mtext( "The whole group",
           side = 1,
           cex = 0.9,
           at = (1 + maxTutorial) / 2 )
    
    # Step 2: Select classes
    plotBackground()
    mtext(paste("Selected classes:", paste( sort(selectedTutorials), collapse = ", ")),   
          side = 1, 
          cex = 0.9,
          at = (1 + maxTutorial) / 2 )
    
    
    # Step 3: Selected students in chosen classes (so initially repeat Step 2)      
    plotBackground()
    for (i in (1:numberTutorials)){
      if (i %in% selectedTutorials){
        
        selectedStudents <- sample(1 : numStudentsInTutorials[i], 
                                   numStudentsSelectedEachTutorial) # The students select in this tutorial (fro 1 : class size)
        
        if (i == 1 ){
          selection <- (1 : sum(numStudentsInTutorials[1:i]) )
        } else {
          selection <- (sum(numStudentsInTutorials[1:(i - 1)]) + 1) : sum(numStudentsInTutorials[1:i])
        }
        
        points(1:numStudentsInTutorials[i], rep(i, numStudentsInTutorials[i]),
               pch = this.pch[selection],
               col = this.col[selection],
               cex = this.cex[selection],
               bg  = this.bg[ selection])
        
        sampleSizeOlder   <- sampleSizeOlder + sum( this.pch[selection] == 19)
        sampleSizeYounger <- sampleSizeYounger + sum( this.pch[selection] == 25)
      }    
      
    }
    mtext(paste("Selected 4 students in classes:", paste( sort(selectedTutorials), collapse = ", ")),   
          side = 1, 
          cex = 0.9,
          at = (1 + maxTutorial) / 2 )
  }
  
  invisible( list( sampleSizeOlder = sampleSizeOlder,
                   sampleSizeYounger = sampleSizeYounger) )
}

