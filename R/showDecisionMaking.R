 showDecisionMaking <- function(populationText = expression( atop(bold(POPULATION)~"with",
                                                                  bold(assumed)~parameter)),
                                expectationText = expression(atop(bold(Expectation)~"of", 
                                                                  statistics) ),
                                oneSampleText = expression( atop(One~possible,
                                                                 bold(SAMPLE)) ),
                                oneStatisticText =  expression( atop(One~possible,
                                                                     bold(observed)~statistic)),
                                Decision = "Neither"){ # "Neither", "Reject" or "Accept"
   
   DMcolours <- viridis::viridis(5,
                                 alpha = 0.2)
   
   PopulationColour <- rgb(216, 204, 220, 
                         maxColorValue = 256)
   SampleColour <- rgb(217, 220, 231, 
                           maxColorValue = 256)
   CompareColour <- rgb(215, 232, 232, 
                       maxColorValue = 256)
   SupportColour <- rgb(227, 243, 225, 
                        maxColorValue = 256)
   ContradictColour <- rgb(254, 250, 215, 
                        maxColorValue = 256)
   
   
   pos <- array( dim = c(7, 2) )
   
   edgesX <- c(0.05, 0.35, 0.60, 0.75, 0.95)
   edgesY <- c(0.05, 0.50, 0.95)
   deltaY <- 0.09
   deltaX <- 0.03
   
   pos[1, ] <- c( mean( edgesX[1:2]),
                  mean( edgesY[2:3])) # POPULATION
   pos[2, ] <- c( mean( edgesX[2:3]), # EXPECTATION
                  mean( edgesY[2:3]))
   pos[3, ] <- c( mean( edgesX[1:2]), # OBSERVATIONS
                  mean( edgesY[1:2]))
   pos[4, ] <- c( mean( edgesX[2:3]), # OBSERVED
                  mean( edgesY[1:2]))
   pos[5, ] <- c( edgesX[4],          # COMPARE
                  edgesY[2])
   pos[6, ] <- c( mean( edgesX[4:5] - deltaX), # SUPPORTS
                  mean( edgesY[2:3]) + deltaY)
   pos[7, ] <- c( mean( edgesX[4:5]) - deltaX, # CONTRADICTS
                  mean( edgesY[1:2]) - deltaY)
   
   
   
   openplotmat(mar = c(0.25, 0.25, 0.25, 0.25))
   
   # 'Background' squares delineating the steps
   polygon( x = edgesX[ c(1, 1, 2, 2)],
            y = edgesY[ c(2, 3, 3, 2)],
            border = "grey",
            col = NA)
   polygon( x = edgesX[ c(2, 2, 3, 3)],
            y = edgesY[ c(2, 3, 3, 2)],
            border = "grey",
            col = NA)
   polygon( x = edgesX[ c(1, 1, 3, 3)],
            y = edgesY[ c(1, 2, 2, 1)],
            border = "grey",
            col = NA)
   polygon( x = edgesX[ c(3, 3, 5, 5)],
            y = edgesY[ c(1, 3, 3, 1)],
            border = "grey",
            col = NA)
   
   
   straightarrow(from = pos[1, ], 
                 to = pos[2, ], 
                 arr.pos = 0.53, # Then cover with box
                 lwd = 2,
                 lty = 1)
   straightarrow(from = pos[1, ], 
                 to = pos[3, ], 
                 lcol = grey(0.8),
                 arr.pos = 0.6, # Then cover with box
                 lwd = 2,
                 lty = 1)
   straightarrow(from = pos[3, ], 
                 to = pos[4, ], 
                 arr.pos = 0.5, # Then cover with box
                 lwd = 2,
                 lty = 1)
  # Both ways here
   straightarrow(from = pos[2, ], 
                 to = pos[4, ], 
                 #arr.type = "none",
                 arr.pos= 0.75,
                 lwd = 2,
                 lty = 1)
   straightarrow(from = pos[4, ], 
                 to = pos[2, ], 
                 #arr.type = "none",
                 arr.pos = 0.75,
                 lwd = 2,
                 lty = 1)
   points(x = pos[2, 1], 
          y = 0.5,
          pch = 19)

   straightarrow(from = c( pos[2, 1], edgesY[2]), 
                 to = c( pos[5, 1], edgesY[2]),
                 arr.pos = 0.35, # Then cover with box
                 lwd = 2,
                 lty = 1)
   straightarrow(from = pos[5, ],  
                 to = pos[6, ], ### SUPPORTS
                 arr.pos = 0.5, # Then cover with box
                 lwd = 2,
                 lcol = ifelse( Decision == "Reject", 
                                "grey", 
                                "black"),
                 lty = 1)
   straightarrow(from = pos[5, ],  
                 to = pos[7, ], ### CONTRADICTS
                 lcol = ifelse( Decision == "Accept", 
                                "grey", 
                                "black"),
                 arr.pos = 0.5, # Then cover with box
                 lwd = 2,
                 lty = 1) 
   
   
   textrect( pos[1, ],
             radx = 0.12,
             rady = 0.15,
             shadow.size = 0,
             lcol = PopulationColour,
             box.col = PopulationColour,
             lab = populationText,
             col = grey(0)) # CHECKMARK
   # text( x = pos[1, 1],
   #       y = pos[1, 2] + 0.07,
   #       pos = 3,
   #       labels = "POPULATION")
   textrect( pos[2, ],
             radx = 0.11,
             rady = 0.1,
             shadow.size = 0,
             lcol = PopulationColour,
             box.col = PopulationColour,
             lab = expectationText,
             col = grey(0)) # CHECKMARK
   textrect( pos[3, ],
             radx = 0.08,
             rady = 0.09,
             shadow.size = 0,
             lcol = SampleColour,
             box.col = SampleColour,
             lab = oneSampleText,
             col = grey(0)) # CHECKMARK
   textrect( pos[4, ],
             radx = 0.11,
             rady = 0.1,
             shadow.size = 0,
             lcol = SampleColour,
             box.col = SampleColour,
             lab = oneStatisticText,
             col = grey(0)) # CHECKMARK
   
   textrect( pos[5, ],
             radx = 0.11,
             rady = 0.09,
             shadow.size = 0,
             lcol = CompareColour,
             box.col = CompareColour,
             lab = expression( atop(bold(Compare)*":",
                                    "Consistency?") ),
             col = grey(0)) # CHECKMARK
   textrect( pos[6, ],
             radx = 0.11,
             rady = 0.1,
             shadow.size = 0,
             lcol = SupportColour,
             box.col = SupportColour,
             lab = expression( atop(bold(Yes):~Supports,
                                    assumption) ),
             col = ifelse( Decision == "Reject", 
                           grey(0.75), 
                           "black")) # CHECKMARK
   textrect( pos[7, ],
             radx = 0.11,
             rady = 0.1,
             shadow.size = 0,
             lcol = ContradictColour,
             box.col = ContradictColour,
             lab = expression( atop(bold(No):~Contradicts,
                                    assumption) ),
             col = ifelse( Decision == "Accept", 
                           grey(0.75), 
                           "black")) # CHECKMARK
   
   # STEPS
   text(x = pos[1, 1],
        y = 0.965,
        cex = 0.90,
        labels = "1. Make an asssumption")
   text(x = pos[2, 1],
        y = 0.965,
        cex = 0.90,
        labels = "2. Describe what is expected")
   text(x = pos[3, 1],
        y = 0.02,
        cex = 0.90,
        labels = "3. Observe sample statistic")
   text(x = pos[5, 1],
        y = 0.02,
        cex = 0.90,
        labels = "4. Make decision")
   
 }
 
# showDecisionMaking()