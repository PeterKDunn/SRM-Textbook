showSampleStratified <- function(sizeHorizontal = 21,
                                 sizeVertical = 21,
                                 sampleSize = 40,
                                 proportionA = 2/3, # proportion females in the POPULATION
                                 sampleA = 1/2, # proportion females in the SAMPLE
                                 static = TRUE, 
                                 plotDark = "blue",
                                 main = "",
                                 seed = 91827391){ 
  
  set.seed(seed)
  
  populationSize <- sizeHorizontal * sizeVertical
  population <- 1:(populationSize)
  
  numA <- proportionA * sizeHorizontal
  proportionB <- 1 - proportionA
  numB <- proportionB * sizeHorizontal
  
  sampleA <- round(sampleSize * sampleA)
  sampleB <- sampleSize - sampleA
  
  selectedA <- sample(1:(numA * sizeVertical), 
                      sampleA)
  selectedB <- sample(1:(numB * sizeVertical), 
                      sampleB)
  
  separation <- sizeHorizontal * proportionA + 0.5 # LEFT: Females: RIGHT: Males
  populationSex <- rep("F", 
                       length = populationSize)
  
  populationSizeFemales <- round(populationSize * proportionA)
  populationSizeMales   <- populationSize - populationSizeFemales
  
  
  plotPopulation <- function(){
    
    plot( x = c(1, sizeHorizontal), 
          y = c(1, sizeVertical),
          type = "n",
          main = main,
          axes = FALSE,
          xlab = "",
          ylab = "")
    
    abline(v = separation, 
           col = grey(0.3), 
           lwd = 2) # LEFT: Females: RIGHT: Males
    mtext( paste("Total females: ", populationSizeFemales, sep = ""), 
           side = 3, 
           cex = 0.9,
           at = separation / 2)
    mtext(paste("Select", sampleA,"females"),   
          side = 1, 
          cex = 0.9,
          at = separation / 2)
    
    abline(v = separation, 
           col = grey(0.3), 
           lwd = 2) # LEFT: Females: RIGHT: Males
    mtext( paste("Total males: ",  populationSizeMales, sep = ""), 
           side = 3, 
           cex = 0.9,
           at = separation + (sizeHorizontal - separation) / 2)
    
    mtext(paste("Select", sampleB, "males"),   
          side = 1, 
          cex = 0.9,
          at = separation + (sizeHorizontal - separation) / 2) + 0.05
    
    points( expand.grid(1:numA, 
                        1:sizeVertical))
    EGmale <- expand.grid(1:numB, 
                          1:sizeVertical)
    EGmale$Var1 <- EGmale$Var1 + separation
    points( EGmale$Var1, EGmale$Var2)
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
    
    ### Plot the selected **Females**
    sample.pchF <- rep(1, 
                       length = numA * sizeVertical)
    sample.pchF[selectedA] <- 15
    
    sample.colF <- rep(grey(0.3), 
                       length = numA*sizeVertical)
    sample.colF[selectedA] <- plotDark
    
    sample.cexF <- rep(1, 
                       length = numA*sizeVertical)
    sample.cexF[selectedA] <- 1.3
    
    points( expand.grid(1:numA, 
                        1:sizeVertical), 
            pch = sample.pchF, 
            col = sample.colF,
            cex = sample.cexF)
    
    
    ### Plot the selected **Males**
    sample.pchM <- rep(1, 
                       length = numB * sizeVertical)
    sample.pchM[selectedB] <- 15
    
    sample.colM <- rep(grey(0.3), 
                       length = numB * sizeVertical)
    sample.colM[selectedB] <- plotDark
    
    sample.cexM <- rep(1, 
                       length = numB * sizeVertical)
    sample.cexM[selectedB] <- 1.3
    
    EGmale <- expand.grid(1:numB, 
                          1:sizeVertical)
    EGmale$Var1 <- EGmale$Var1 + separation
    points( EGmale$Var1, EGmale$Var2, 
            pch = sample.pchM, 
            col = sample.colM,
            cex = sample.cexM)
    
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
      
      ### Plot the selected **Females**
      sample.pchF <- rep(1, 
                         length = numA * sizeVertical)
      sample.colF <- rep(grey(0.3), 
                         length = numA * sizeVertical)
      sample.cexF <- rep(1, 
                         length = numA * sizeVertical)
      
      sample.pchF[ plotThese ] <- 15
      sample.colF[ plotThese ] <- plotDark
      sample.cexF[ plotThese ] <- 1.3
      
      points( expand.grid(1:numA, 
                          1:sizeVertical), 
              pch = sample.pchF, 
              col = sample.colF,
              cex = sample.cexF)
    }
    
    ### Plot the selected **Males**
    
    for ( j in selectedB ) {
      ### Need to plot *all* the females first, before looping through the males
      plotPopulation()
      points( expand.grid(1:numA, 
                          1:sizeVertical), 
              pch = sample.pchF, 
              col = sample.colF,
              cex = sample.cexF)
      
      # Now loop the males
      locatei <- which(selectedB == j )
      plotThese <- selectedB[1 : locatei]
      
      sample.pch <- rep(1, 
                        length = numB * sizeVertical)
      sample.col <- rep(grey(0.3), 
                        length = numB * sizeVertical)
      sample.cex <- rep(1, 
                        length = numB * sizeVertical)
      
      sample.pch[ plotThese] <- 15
      sample.col[ plotThese] <- plotDark
      sample.cex[ plotThese] <- 1.3
      
      EGmale <- expand.grid(1:numB, 
                            1:sizeVertical)
      EGmale$Var1 <- EGmale$Var1 + separation
      points( x = EGmale$Var1, 
              y = EGmale$Var2, 
              pch = sample.pch, 
              col = sample.col,
              cex = sample.cex)
    }
  }
}