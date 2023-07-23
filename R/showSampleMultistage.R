showSampleMultistage <- function(sizeHorizontal = 21,
                                 sizeVertical = 21,
                                 sampleSize = 40,
                                 numberTutorials = 20,
                                 sampleA = 1/2, # proportion females in the SAMPLE
                                 static = TRUE, 
                                 plotDark = "blue",
                                 main = "Multistage sampling",
                                 seed = 9182391){ 
  
  set.seed(seed)
  
  populationSize <- sizeHorizontal * sizeVertical
  
  numTutorials <- 20
  numStudentsInTutorials <- array( NA, 
                                   dim = numTutorials) 
  
  for (i in (1:(numTutorials - 1))){
    numStudentsInTutorials[i] <- sample(19:25, 1)
  }
  numStudentsInTutorials[ numTutorials] <- populationSize - sum( numStudentsInTutorials, na.rm = TRUE)
  maxTutorial <- max(numStudentsInTutorials)
  
  selectedTutorials <- sample(1: numTutorials, 10)
  
  numStudentsSelectedEachTutorial <- 4
  
  plotBackground <- function() {
    plot( x = c(1, maxTutorial), 
          y = c(1, numTutorials),
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
    # Now plot everyone: 
    for (j in 1:numberTutorials){
      points(1:numStudentsInTutorials[j], rep(j, numStudentsInTutorials[j]),
             pch = 1,
             col = grey(0.3),
             cex = 1,
             lwd = 1)
    }
  }
  
  ###########################################################################
  if (static){
    plotBackground()

    for (i in (1:numTutorials)){
      # Grey empty circle by default
      sample.pch <- rep(1, (numStudentsInTutorials[i]))
      sample.col <- rep(grey(0.3), (numStudentsInTutorials[i]))
      sample.cex <- rep(1, (numStudentsInTutorials[i]))
      sample.lwd <- rep(1, (numStudentsInTutorials[i]))

      # Filled circles for chosen classes
      if ( i %in% selectedTutorials){
        sample.pch <- rep(19, numStudentsInTutorials[i])
        sample.col <- rep(grey(0.6), numStudentsInTutorials[i])
        sample.cex <- rep(1, (numStudentsInTutorials[i]))
        sample.lwd <- rep(1, (numStudentsInTutorials[i]))
      }
      # Filled squares for chosen students
      if ( i %in% selectedTutorials){
        selectedStudents <- sample(1 : numStudentsInTutorials[i], 
                                   numStudentsSelectedEachTutorial)
        sample.pch[selectedStudents] <- 15
        sample.col[selectedStudents] <- plotDark
        sample.cex[selectedStudents] <- 1.2
        sample.lwd[selectedStudents] <- 2
      }
      points(x = 1:numStudentsInTutorials[i], 
             y = rep(i, numStudentsInTutorials[i]),
             pch = sample.pch,
             col = sample.col,
             cex = sample.cex,
             lwd = sample.lwd)
    }
    title(xlab = paste("Selected classes:", paste( sort(selectedTutorials), collapse = ", ")))
  } else { #################################### NOT STATIC (static = FALSE)
    # Step 1
    plotBackground()
    sample.pch <- rep(1, (numStudentsInTutorials[i]))
    sample.col <- rep(grey(0.3), (numStudentsInTutorials[i]))
    sample.cex <- rep(1, (numStudentsInTutorials[i]))
    sample.lwd <- rep(1, (numStudentsInTutorials[i]))
    
    # Step 2: Students in chosen classes    
    plotBackground()
    for (i in (1:numTutorials)){
      sample.pch <- rep(1, (numStudentsInTutorials[i]))
      sample.col <- rep(grey(0.3), (numStudentsInTutorials[i]))
      sample.cex <- rep(1, (numStudentsInTutorials[i]))
      sample.lwd <- rep(1, (numStudentsInTutorials[i]))

      if (i %in% selectedTutorials) {
        sample.pch <- rep(19, (numStudentsInTutorials[i]) )
        sample.col <- rep(grey(0.6), (numStudentsInTutorials[i]) )
        sample.cex <- rep(1, (numStudentsInTutorials[i]) )
        sample.lwd <- rep(2, (numStudentsInTutorials[i]))
      }
      points(x = 1:numStudentsInTutorials[i], 
             y = rep(i, numStudentsInTutorials[i]),
             pch = sample.pch,
             col = sample.col,
             cex = sample.cex,
             lwd = sample.lwd)
    }
    title(xlab = paste("Selected classes:", paste( sort(selectedTutorials), collapse = ", ")))

    # Step 3: Selected students in chosen classes (so initially repeat Step 2)      
    plotBackground()
    for (i in (1:numTutorials)){
      if (i %in% selectedTutorials){

        selectedStudents <- sample(1 : numStudentsInTutorials[i], 
                                   numStudentsSelectedEachTutorial)

        sample.pch3 <- sample.pch
        sample.col3 <- sample.col
        sample.cex3 <- sample.cex
        sample.lwd3 <- sample.lwd
        
        sample.pch3[selectedStudents] <- 15
        sample.col3[selectedStudents] <- plotDark
        sample.cex3[selectedStudents] <- 1.2
        sample.lwd3[selectedStudents] <- 2
        
        points(1:numStudentsInTutorials[i], rep(i, numStudentsInTutorials[i]),
               pch = sample.pch3,
               col = sample.col3,
               cex = sample.cex3,
               lwd = sample.lwd3)
      }    
      
    }
    title(xlab = paste("Selected some students in classes:", paste( sort(selectedTutorials), collapse = ", ")))
  }
}




