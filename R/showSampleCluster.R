showSampleCluster <- function(populationSize = 21 * 21,
                              sampleSize = 40,
                              numberTutorials = 20,
                              static = TRUE,
                              proportionA = 2/3,
                              plotDark = plotSolid,
                              main = "Cluster sampling",
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
                    populationSize * (proportionA) )
  
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
  sample.bg  <- rep("white", length = populationSize)
  
  
  selectedTutorials <- sample(1: numberTutorials, 2)
  
  plotBackground <- function(showSelectedClasses = TRUE){
    plot( x = c(1, maxTutorial), 
          y = c(1, numberTutorials),
          type = "n",
          main = main,
          axes = FALSE,
          xlab = "",
          ylab = "")
    axis(side = 2, 
         at = (1:numberTutorials)[-selectedTutorials], # Only labels the NON-SELECTED tutorials 
         labels = paste("Gp.", (1:numberTutorials)[-selectedTutorials]), 
         las = 1)
    axis(side = 2, 
         at = selectedTutorials, # Only labels SELECTED tutorials
         labels = paste("Gp.", selectedTutorials), 
         las = 1,
         font = 2) # BOLD text
    
    # Grey box around chosen classes
    if (showSelectedClasses){
    for (i in (1:length(selectedTutorials))){
      j <- selectedTutorials[i]
      polygon(x = c(0.25, 0.25, 
                    maxTutorial + 0.25, maxTutorial + 0.25),
              y = c(j - 0.5, j + 0.5, 
                    j + 0.5, j - 0.5),
              border = NA, # No borders
              col = grey(0.8))
    }
    }
    
    # Now plot everyone: 
    cumulativeStudents <- 0
    for (j in 1:numberTutorials){
      
      points(x = 1:numStudentsInTutorials[j], 
             y = rep(j, numStudentsInTutorials[j]),
             pch = sample.pch[(cumulativeStudents + 1) : (cumulativeStudents + numStudentsInTutorials[j])],
             col = "black",
             cex = 1,
             lwd = 1)
      cumulativeStudents <- cumulativeStudents + numStudentsInTutorials[j]
    }
  }
  
  ############################################
  
  if (static){ 
    
    plotBackground() # Plots all students. Now overplot with selected students
    
    sampleSizeOlder <- 0
    sampleSizeYounger <- 0
    
    for (i in (1:numberTutorials)){  ### Plot selected students
      
      if ( i %in% selectedTutorials){
        
        selection <- (sum(numStudentsInTutorials[1:(i - 1)]) + 1) : sum(numStudentsInTutorials[1:i])
        
        this.pch <- sample.pch[selection]
        this.pch[this.pch == 1] <- 19
        this.pch[this.pch == 6] <- 25
        
        sampleSizeOlder <- sampleSizeOlder + sum( this.pch == 19)
        sampleSizeYounger <- sampleSizeYounger + sum( this.pch == 25)
        
        this.col <- sample.col[selection]
        this.col[this.col == "black"] <- plotDark
        
        this.cex <- sample.cex[selection]
        this.cex[this.cex == 1] <- 1.2
        
        this.bg <- sample.bg[selection]
        this.bg[this.bg == "white"] <- plotDark
        
        points(x = 1:numStudentsInTutorials[i], 
               y = rep(i, numStudentsInTutorials[i]),
               pch = this.pch,
               col = this.col,
               cex = this.cex,
               bg  = this.bg)
      }
    }
    mtext(paste("Selected classes:", paste( sort(selectedTutorials), collapse = ", ")),   
          side = 1, 
          cex = 0.9,
          at = (1 + maxTutorial) / 2 )
    
  } else { #NOT static
    
      ##### Step 1: Plot background
      plotBackground(showSelectedClasses = FALSE)
      
      mtext(paste("Select all students in classes:", paste( sort(selectedTutorials), collapse = ", ")),   
            side = 1, 
            cex = 0.9,
            at = (1 + maxTutorial) / 2 )

      ##### Step 2: Plot background
      plotBackground()
      
      mtext(paste("Select all students in classes:", paste( sort(selectedTutorials), collapse = ", ")),   
            side = 1, 
            cex = 0.9,
            at = (1 + maxTutorial) / 2 )
      
      ##### Step 3: Select first tutorial
      plotBackground()
      
      sampleSizeOlder <- 0
      sampleSizeYounger <- 0
      
      j <- 1
      thisTutorialSelected <- selectedTutorials[j]
      selection <- (sum(numStudentsInTutorials[1:(thisTutorialSelected - 1)]) + 1) : sum(numStudentsInTutorials[1:thisTutorialSelected])
      
      this.pch <- sample.pch[selection]
      this.pch[this.pch == 1] <- 19
      this.pch[this.pch == 6] <- 25
      
      sampleSizeOlder <- sampleSizeOlder + sum( this.pch == 19)
      sampleSizeYounger <- sampleSizeYounger + sum( this.pch == 25)
      
      this.col <- sample.col[selection]
      this.col[this.col == "black"] <- plotDark
      
      this.cex <- sample.cex[selection]
      this.cex[this.cex == 1] <- 1.75
      
      this.bg <- sample.bg[selection]
      this.bg[this.bg == "white"] <- plotDark
      
      points(x = 1:numStudentsInTutorials[thisTutorialSelected], 
             y = rep(selectedTutorials[j], 
                     numStudentsInTutorials[thisTutorialSelected]),
             pch = this.pch,
             col = this.col,
             cex = this.cex,
             bg  = this.bg)
    
    mtext(paste("Select all students in classes:", paste( sort(selectedTutorials), collapse = ", ")),   
          side = 1, 
          cex = 0.9,
          at = (1 + maxTutorial) / 2 )
    
    
    ##### Step 4: Select first AND second tutorial
    plotBackground()
    
    sampleSizeOlder <- 0
    sampleSizeYounger <- 0
    
    for (j in 1:2){
      thisTutorialSelected <- selectedTutorials[j]
      selection <- (sum(numStudentsInTutorials[1:(thisTutorialSelected - 1)]) + 1) : sum(numStudentsInTutorials[1:thisTutorialSelected])
      
      this.pch <- sample.pch[selection]
      this.pch[this.pch == 1] <- 19
      this.pch[this.pch == 6] <- 25
      
      sampleSizeOlder <- sampleSizeOlder + sum( this.pch == 19)
      sampleSizeYounger <- sampleSizeYounger + sum( this.pch == 25)
      
      this.col <- sample.col[selection]
      this.col[this.col == "black"] <- plotDark
      
      this.cex <- sample.cex[selection]
      this.cex[this.cex == 1] <- 1.75
      
      this.bg <- sample.bg[selection]
      this.bg[this.bg == "white"] <- plotDark
      
      points(x = 1:numStudentsInTutorials[thisTutorialSelected], 
             y = rep(selectedTutorials[j], 
                     numStudentsInTutorials[thisTutorialSelected]),
             pch = this.pch,
             col = this.col,
             cex = this.cex,
             bg  = this.bg)
    }
    mtext(paste("Select all students in classes:", paste( sort(selectedTutorials), collapse = ", ")),   
          side = 1, 
          cex = 0.9,
          at = (1 + maxTutorial) / 2 )
    
}


invisible( list(sampleSizeOlder = sampleSizeOlder, 
                sampleSizeYounger = sampleSizeYounger))
}