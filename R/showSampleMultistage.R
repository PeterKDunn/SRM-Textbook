showSampleMultistage <- function(sizeHorizontal = 21,
                                 sizeVertical = 21,
                                 sampleSize = 40,
                                 numberTutorials = 20,
                                 sampleA = 1/2, # proportion females in the SAMPLE
                                 static = TRUE, # DOESN'T DO ANYTHING YET!
                                 plotDark = "blue",
                                 main = "Multistage sampling"){   
  populationSize <- sizeHorizontal * sizeVertical
  
  numTutorials <- 20
  numStudentsInTutorials <- array( NA, dim = numTutorials) 
  
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
		   labels = paste("Tut.", (1:numberTutorials)[-selectedTutorials]), # Only labels the NON-SELECTED tutorials, 
		   las = 1)
	  axis(side = 2, 
		   at = selectedTutorials, 
		   labels = paste("Tut.", selectedTutorials), 
		   las = 1, 
		   font = 2) # BOLD text
	  # Now plot everyone: 
	  for (j in 1:numberTutorials){
		  points(1:numStudentsInTutorials[j], rep(j, numStudentsInTutorials[j]),
				 pch = 1,
				 col = grey(0.7),
				 cex = 1,
				 lwd = 1)
	 }
  }
  
  
  if (static){
      plotBackground()
	  set.seed(192863)
	  for (i in (1:numTutorials)){
		sample.pch <- rep(1, (numStudentsInTutorials[i]))
		sample.col <- rep("grey", (numStudentsInTutorials[i]))
		sample.cex <- rep(1, (numStudentsInTutorials[i]))
		sample.lwd <- rep(1, (numStudentsInTutorials[i]))
	
	
		
		if ( i %in% selectedTutorials){
		  
		  sample.col <- rep("black", (numStudentsInTutorials[i]))
		  selectedStudents <- sample(1 : numStudentsInTutorials[i], numStudentsSelectedEachTutorial)
		  
		  sample.pch[selectedStudents] <- 15
		  sample.col[selectedStudents] <- plotDark
		  sample.cex[selectedStudents] <- 1.75
		  sample.lwd[selectedStudents] <- 2
	  
		}
	
		points(1:numStudentsInTutorials[i], rep(i, numStudentsInTutorials[i]),
			   pch = sample.pch,
			   col = sample.col,
			   cex = sample.cex,
			   lwd = sample.lwd)
	  }
	  title(xlab = paste("Selected classes:", paste( sort(selectedTutorials), collapse = ", ")))
  } else { # NOT STATIC
      # Step 1
      plotBackground()
      # Seem to need to force the packground to print... ?
      points(0.1, 0.1,  
             cex = 0.1, 
             col="white")

 	  # Step 2      
      plotBackground()
	  for (i in (1:numTutorials)){
		sample.pch <- ifelse( i %in% selectedTutorials, 0, 1)
		sample.col <- ifelse( i %in% selectedTutorials, plotDark, grey(0.2))
		sample.cex <- rep(1, (numStudentsInTutorials[i]))
		sample.lwd <- rep(1, (numStudentsInTutorials[i]))
	
		points(1:numStudentsInTutorials[i], rep(i, numStudentsInTutorials[i]),
			   pch = sample.pch,
			   col = sample.col,
			   cex = sample.cex,
			   lwd = sample.lwd)
	    }
        title(xlab = paste("Selected classes:", paste( sort(selectedTutorials), collapse = ", ")))


 	  # Step 3: So repeat Step 2      
      plotBackground()
	  set.seed(192863)
	  for (i in (1:numTutorials)){
	
		sample.pch <- ifelse( i %in% selectedTutorials, 0, 1)
		sample.col <- ifelse( i %in% selectedTutorials, plotDark, grey(0.2))
		sample.cex <- rep(1, (numStudentsInTutorials[i]))
		sample.lwd <- rep(1, (numStudentsInTutorials[i]))
	
		points(1:numStudentsInTutorials[i], rep(i, numStudentsInTutorials[i]),
			   pch = sample.pch,
			   col = sample.col,
			   cex = sample.cex,
			   lwd = sample.lwd)

		sample.pch <- rep(1, (numStudentsInTutorials[i]))
		sample.col <- rep(grey(0.7), (numStudentsInTutorials[i]))
		sample.cex <- rep(1, (numStudentsInTutorials[i]))
		sample.lwd <- rep(1, (numStudentsInTutorials[i]))
		
		
		if ( i %in% selectedTutorials){
		  
		  sample.col <- rep("black", (numStudentsInTutorials[i]))
		  selectedStudents <- sample(1 : numStudentsInTutorials[i], 
		                             numStudentsSelectedEachTutorial)
		  
		  sample.pch[selectedStudents] <- 15
		  sample.col[selectedStudents] <- plotDark
		  sample.cex[selectedStudents] <- 1.75
		  sample.lwd[selectedStudents] <- 2
	
		  points(1:numStudentsInTutorials[i], rep(i, numStudentsInTutorials[i]),
		  	     pch = sample.pch,
		  	     col = sample.col,
			     cex = sample.cex,
			     lwd = sample.lwd)
	   }    
	  
	 }
        title(xlab = paste("Selected some students in classes:", paste( sort(selectedTutorials), collapse = ", ")))
  }
}




