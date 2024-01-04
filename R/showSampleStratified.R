showSampleStratified <- function(sizeHorizontal = 21,
                                 sizeVertical = 21,
                                 sampleSize = 40,
                                 proportionA = 2/3, # proportion females/younger in the POPULATION
                                 sampleA = 1/2, # proportion females/younger in the SAMPLE
                                 static = TRUE, 
                                 plotDark = "blue",
                                 main = "",
                                 seed = 91827391){ 
  
  set.seed(seed)
  
  populationSize <- sizeHorizontal * sizeVertical
  population <- 1:(populationSize)

  # Identify younger:
  younger <- sample(1:populationSize,
                    populationSize * (1 - proportionA) )
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

  
  # Separate into the two strata
  numA <- proportionA * sizeHorizontal
  proportionB <- 1 - proportionA
  numB <- proportionB * sizeHorizontal
  
  sampleA <- round(sampleSize * sampleA)
  sampleB <- sampleSize - sampleA
  
  selectedA <- sample(1:(numA * sizeVertical), 
                      sampleA)
  selectedB <- sample(1:(numB * sizeVertical), 
                      sampleB)
  
  separation <- sizeHorizontal * proportionA + 0.95 # LEFT: Females/younger: RIGHT: Males/older
  populationSex <- rep("F", 
                       length = populationSize)
  
  populationSizeFemales <- round(populationSize * proportionA)
  populationSizeMales   <- populationSize - populationSizeFemales
  
  
  plotPopulation <- function(){
    
    plot( x = c(1, sizeHorizontal + 1), # The + 1 is to allow for the separation line 
          y = c(1, sizeVertical), 
          type = "n",
          main = main,
          axes = FALSE,
          xlab = "",
          ylab = "")
    
    abline(v = separation, 
           col = grey(0.7), 
           lwd = 2) # LEFT: Females/younger: RIGHT: Males/older
    mtext( paste("Total younger: ", populationSizeFemales, sep = ""), 
           side = 3, 
           cex = 0.9,
           at = separation / 2)
    mtext(paste("Select", sampleA,"younger"),   
          side = 1, 
          cex = 0.9,
          at = separation / 2)
    
    mtext( paste("Total older: ",  populationSizeMales, sep = ""), 
           side = 3, 
           cex = 0.9,
           at = separation + (sizeHorizontal - separation) / 2)
    
    mtext(paste("Select", sampleB, "older"),   
          side = 1, 
          cex = 0.9,
          at = separation + (sizeHorizontal - separation) / 2) + 0.05
    
    points( expand.grid(1:numA, 
                        1:sizeVertical),
            pch = 6)
    EGmale <- expand.grid(1:numB, 
                          1:sizeVertical)
    EGmale$Var1 <- EGmale$Var1 + separation
    points( x = EGmale$Var1, 
            y = EGmale$Var2,
            pch = 1)
  }
  
  
  
  ##############################################################
  
  if (static) { # If TRUE: Then no animation (i.e, pdf)}
    startLoop <- 1 # For the html, animated
    endLoop <- 1
    
    startLoopF <- 1
    endLoopF <- 1
    
    startLoopM <- 1
    endLoopM <- 1
    
    plotPopulation()
    
    ### Plot the selected **Females/younger**
    sample.pchF <- rep(6, 
                       length = numA * sizeVertical)
    sample.pchF[selectedA] <- 25
    
    sample.colF <- rep("black", 
                       length = numA * sizeVertical)
    sample.colF[selectedA] <- plotDark
    
    sample.bgF <- rep("white",
                     length = numA * sizeVertical)
    sample.bgF[selectedA] <- plotDark
      
    sample.cexF <- rep(1, 
                       length = numA * sizeVertical)
    sample.cexF[selectedA] <- 1.3
    
    points( expand.grid(1:numA, 
                        1:sizeVertical), 
            pch = sample.pchF, 
            col = sample.colF,
            bg  = sample.bgF,
            cex = sample.cexF)
    
    sampleSizeYounger <- sum( sample.pchF == 25)
    
    
    ### Plot the selected **Males/older**
    sample.pchM <- rep(1, 
                       length = numB * sizeVertical)
    sample.pchM[selectedB] <- 19
    
    sample.colM <- rep("black", 
                       length = numB * sizeVertical)
    sample.colM[selectedB] <- plotDark
    
    sample.bgM <- rep("white",
                      length = numA * sizeVertical)
    sample.bgM[selectedA] <- plotDark
    
    sample.cexM <- rep(1, 
                       length = numB * sizeVertical)
    sample.cexM[selectedB] <- 1.3
    
    EGmale <- expand.grid(1:numB, 
                          1:sizeVertical)
    EGmale$Var1 <- EGmale$Var1 + separation
    points( EGmale$Var1, EGmale$Var2, 
            pch = sample.pchM, 
            col = sample.colM,
            bg  = sample.bgM,
            cex = sample.cexM)
    
    sampleSizeOlder <- sum( sample.pchM == 19)
    
    
  } else {  # NOT STATIC #############################################################
    startLoop <- 1
    endLoop <- sampleSize
    
    startLoopF <- 1
    endLoopF <- sampleA
    
    startLoopM <- sampleA + 1
    endLoopM <- sampleSize
    
    
    plotPopulation()
    
    for (i in selectedA){  
      locatei <- which(selectedA == i)
      plotThese <- selectedA[1 : locatei]
      
      plotPopulation()
      
      ### Plot the selected **Females/younger**
      sample.pchF <- rep(6, 
                         length = numA * sizeVertical)
      sample.colF <- rep("black", 
                         length = numA * sizeVertical)
      sample.bgF <- rep("white",
                        length = numA * sizeVertical)
      sample.cexF <- rep(1, 
                         length = numA * sizeVertical)
      
      sample.pchF[ plotThese ] <- 25
      sample.colF[ plotThese ] <- plotDark
      sample.bgF[  plotThese ] <- plotDark
      sample.cexF[ plotThese ] <- 1.3
      
      points( expand.grid(1:numA, 
                          1:sizeVertical), 
              pch = sample.pchF, 
              col = sample.colF,
              bg  = sample.bgF,
              cex = sample.cexF)
    
      sampleSizeYounger <- sum( sample.pchF == 25)
      
    }
    
    ### Plot the selected **Males/older**
    
    for ( j in selectedB ) {
      ### Need to plot *all* the females first, before looping through the males
      plotPopulation()
      points( expand.grid(1:numA, 
                          1:sizeVertical), 
              pch = sample.pchF, 
              col = sample.colF,
              bg  = sample.bgF,
              cex = sample.cexF)

      # Now loop the males
      locatei <- which(selectedB == j )
      plotThese <- selectedB[1 : locatei]
      
      sample.pch <- rep(1, 
                        length = numB * sizeVertical)
      sample.col <- rep("black", 
                        length = numB * sizeVertical)
      sample.bg <- rep("white", 
                        length = numB * sizeVertical)
      sample.cex <- rep(1, 
                        length = numB * sizeVertical)
      
      sample.pch[ plotThese] <- 19
      sample.col[ plotThese] <- plotDark
      sample.bg[  plotThese] <- plotDark
      sample.cex[ plotThese] <- 1.3
      
      EGmale <- expand.grid(1:numB, 
                            1:sizeVertical)
      EGmale$Var1 <- EGmale$Var1 + separation
      points( x = EGmale$Var1, 
              y = EGmale$Var2, 
              pch = sample.pch, 
              col = sample.col,
              bg  = sample.bg,
              cex = sample.cex)
     
      sampleSizeOlder <- sum( sample.pch == 19)
      
    }
    
  }
  
  invisible( list( sampleSizeOlder = sampleSizeOlder,
                   sampleSizeYounger = sampleSizeYounger) )
  
}