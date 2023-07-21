showSampleStratified <- function(sizeHorizontal = 21,
                                 sizeVertical = 21,
                                 sampleSize = 40,
                                 proportionA = 2/3, # proportion females in the POPULATION
                                 sampleA = 1/2, # proportion females in the SAMPLE
                                 static = TRUE, # DOESN'T DO ANYTHING YET!
                                 plotDark = "blue",
                                 main = ""){ 
  
  
  populationSize <- sizeHorizontal * sizeVertical
  population <- 1:(populationSize)
  
  numA <- proportionA * sizeHorizontal
  proportionB <- 1 - proportionA
  numB <- proportionB * sizeHorizontal
  
  sampleA <- round(sampleSize * sampleA)
  sampleB <- sampleSize - sampleA
  
  selectedA <- sample(1:(numA * sizeVertical), 
                            sampleA)
  selectedB   <- sample(1:(numB * sizeVertical), 
                            sampleB)
  
  separation <- sizeHorizontal * proportionA + 0.5 # LEFT: Females: RIGHT: Males
  populationSex <- rep("F", 
                       length = populationSize)
  populationSex <- populationSex[]
  
  populationSizeFemales <- round(populationSize * proportionA)
  populationSizeMales   <- populationSize - populationSizeFemales
  
  selected <- sample(1 : populationSize, 
                     sampleSize)
  

  EGmale <- expand.grid(1:numB, 
                        1:sizeVertical)
  EGmale$Var1 <- EGmale$Var1 + separation



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
          at = separation + (sizeHorizontal - separation) / 2)
    
    points( expand.grid(1:numA, 
                        1:sizeVertical))
    EGmale <- expand.grid(1:numB, 
                          1:sizeVertical)
    EGmale$Var1 <- EGmale$Var1 + separation
    points( EGmale$Var1, EGmale$Var2)
  }

  
  if (static) { # If TRUE: Then no animation (i.e, pdf)}
    startLoopF <- sampleA
  } else {
    startLoopF <- 1 # For the html, animated
  }
  
  ### Plot the selected **Females**
  for (i in (startLoopF:sampleA)){
    
    if (!static){
      plotPopulation() # For each iteration, need to start with basic backgroud plot anew each time
    }
    
    # Plot the selected **Females**
    sample.pchF <- rep(1, 
                       length = numA * sizeVertical)
    sample.pchF[selectedA[1:i]] <- 15
    
    sample.colF <- rep(grey(0.3), 
                       length = numA*sizeVertical)
    sample.colF[selectedA[1:i]] <- plotDark
    
    sample.cexF <- rep(1, 
                       length = numA*sizeVertical)
    sample.cexF[selectedA[1:i]] <- 1.3
    
    points( expand.grid(1:numA, 
                        1:sizeVertical), 
            pch = sample.pchF, 
            col = sample.colF,
            cex = sample.cexF)
  }
  

  if (static) { # If TRUE: Then no animation (i.e, pdf)}
    startLoopM <- sampleB
  } else {
    startLoopM <- 1 # For the html, animated
  }

  ### Plot the selected **Males**
  for (i in (startLoopM:sampleB)){
    
    plotPopulation() # For each iteration, need to start with basic backgroud plot anew each time

    points( expand.grid(1:numA, 
                        1:sizeVertical))
    EGmale <- expand.grid(1:numB, 
                          1:sizeVertical)
    EGmale$Var1 <- EGmale$Var1 + separation
    points( EGmale$Var1, 
            EGmale$Var2)
    
    # Plot the selected **Females**
    sample.pchF <- rep(1, length = numA*sizeVertical)
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
    
    # Plot the selected **Males**
    sample.pchM <- rep(1, 
                       length = numB * sizeVertical)
    sample.pchM[selectedB[1:i]] <- 15
    
    sample.colM <- rep(grey(0.3), 
                       length = numB * sizeVertical)
    sample.colM[selectedB[1:i]] <- plotDark
    
    sample.cexM <- rep(1, 
                       length = numB * sizeVertical)
    sample.cexM[selectedB[1:i]] <- 1.4
    
    EGmale <- expand.grid(1:numB, 
                          1:sizeVertical)
    EGmale$Var1 <- EGmale$Var1 + separation
    points( EGmale$Var1, EGmale$Var2, 
            pch = sample.pchM, 
            col = sample.colM,
            cex = sample.cexM)
  }
}