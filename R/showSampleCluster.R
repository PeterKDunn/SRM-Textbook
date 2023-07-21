showSampleCluster <- function(sizeHorizontal = 21,
                              sizeVertical = 21,
                              sampleSize = 40,
                              numberTutorials = 20,
                              sampleA = 1/2, # proportion females in the SAMPLE
                              static = TRUE, # DOESN'T DO ANYTHING YET!
                              plotDark = "blue",
                              main = "Cluster sampling"){ 

  populationSize <- sizeHorizontal * sizeVertical
  
  numStudentsInTutorials <- array( NA, dim = numberTutorials) 
  
  for (i in (1:(numberTutorials - 1))){
    numStudentsInTutorials[i] <- sample(19:25, 1)
  }
  numStudentsInTutorials[ numberTutorials] <- populationSize - sum( numStudentsInTutorials, na.rm = TRUE)
  maxTutorial <- max(numStudentsInTutorials)
  

  selectedTutorials <- sample(1: numberTutorials, 2)

  plotBackground <- function(){
	  plot( x = c(1, maxTutorial), 
			y = c(1, numberTutorials),
			type = "n",
			main = main,
			axes = FALSE,
			xlab = "",
			ylab = "")
	  axis(side = 2, 
		   at = (1:numberTutorials)[-selectedTutorials], # Only labels the NON-SELECTED tutorials 
		   labels = paste("Tut.", (1:numberTutorials)[-selectedTutorials]), 
		   las = 1)
	  axis(side = 2, 
		   at = selectedTutorials, # Only labels SELECTED tutorials
		   labels = paste("Tut.", selectedTutorials), 
		   las = 1,
		   font = 2) # BOLD text
	  # Now plot everyone: 
	  for (j in 1:numberTutorials){
		  points(1:numStudentsInTutorials[j], rep(j, numStudentsInTutorials[j]),
				 pch = 1,
				 col = grey(0.2),
				 cex = 1,
				 lwd = 1)
	 }
  }
  
  
  if (static){ 
      plotBackground()
	  for (i in (1:numberTutorials)){
		sample.pch <- ifelse( i %in% selectedTutorials, 15, 1)
		sample.col <- ifelse( i %in% selectedTutorials, plotDark, grey(0.2))
		sample.cex <- ifelse( i %in% selectedTutorials, 1.3, 1)
		sample.lwd <- ifelse( i %in% selectedTutorials, 2, 1)
	
		points(1:numStudentsInTutorials[i], rep(i, numStudentsInTutorials[i]),
			   pch = sample.pch,
			   col = sample.col,
			   cex = sample.cex,
			   lwd = sample.lwd)
	  }
	  title(xlab = paste("Selected classes:", paste( sort(selectedTutorials), collapse = ", ")))
	} else { #NOT static
      plotBackground()
      # Seem to need to force the packground to print... ?
      points(0.1, 0.1,  
             cex = 0.1, 
             col="white")
      
      plotBackground()
      title(xlab = paste("Selected classes:", paste( sort(selectedTutorials), collapse = ", ")))

      plotBackground()
	  for (i in (1:numberTutorials)){
		sample.pch <- ifelse( i %in% selectedTutorials, 15, 1)
		sample.col <- ifelse( i %in% selectedTutorials, plotDark, grey(0.2))
		sample.cex <- ifelse( i %in% selectedTutorials, 1.3, 1)
		sample.lwd <- ifelse( i %in% selectedTutorials, 2, 1)
	
		points(1:numStudentsInTutorials[i], rep(i, numStudentsInTutorials[i]),
			   pch = sample.pch,
			   col = sample.col,
			   cex = sample.cex,
			   lwd = sample.lwd)
	  }
      title(xlab = paste("Select all students in classes:", paste( sort(selectedTutorials), collapse = ", ")))

	}
}