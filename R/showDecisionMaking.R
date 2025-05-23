 showDecisionMaking <- function(populationText = expression( atop(bold(POPULATION)~"with",
                                                                  bold(assumed)~parameter~value) ),
                                expectationText = expression(atop(bold(Expected)~values~"of", 
                                                                  all~possible~statistics) ),
                                oneSampleText = expression( atop(One~possible,
                                                                 bold(SAMPLE)) ),
                                oneStatisticText = expression( atop(One~possible,
                                                                     bold(observed)~statistic)),
                                compareText = expression(atop(bold(Compare)~expectation~with,
                                                                 observation*":"~Consistency*"?") ),
                                contradictText = expression(atop(bold(No)*":"~Contradicts,
                                                                 assumption)),
                                supportText = expression(atop(bold(Yes)*":"~Supports,
                                                              assumption)), 
                                Decision = "Neither", # "Neither", "Reject" or "Accept"
                                showQuestionMark = FALSE) {
   
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
   

    PopulationColour <- ChanceColour
    SampleColour <- GroupColour
    CompareColour <- DesignColour
    SupportColour <- ContradictColour <- BlockColour
    
    DecisionColour <- ResponseColour
   
   pos <- array( dim = c(7, 2) )
   
   edgesX <- c(0.01, 0.325, 0.60, 0.75, 0.99)
   edgesY <- c(0.06, 0.50, 0.94)
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
   
   
   
#   openplotmat(mar = c(0.3, 0.25, 0.3, 0.25))
#   openplotmat(mar = c(0, 0, 0, 0), 
#               oma = c(0, 0, 0, 0))
   par( mar = c(0, 0, 0, 0),
        oma = c(0, 0, 0, 0))
   plot(x = 0,
        y = 0,
        type = "n",
        xlab = "",
        ylab = "",
        ylim = c(0, 1),
        xlim = c(0.025, 0.975),
        axes = FALSE
        )
   
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
   
   # Arrows
   straightarrow(from = pos[1, ], 
                 to = pos[2, ], 
                 arr.pos = 0.55, # Then cover with box
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
                 lty = ifelse( Decision == "Reject",
                               2,
                               1) )
   straightarrow(from = pos[5, ],  
                 to = pos[7, ], ### CONTRADICTS
                 lcol = ifelse( Decision == "Accept", 
                                "grey", 
                                "black"),
                 arr.pos = 0.5, # Then cover with box
                 lwd = 2,
                 lty = ifelse( Decision == "Accept",
                               2, 
                               1) ) 
   
   
   textrect( pos[1, ],
             radx = 0.13,
             rady = 0.15,
             shadow.size = 0,
             lcol = PopulationColour,
             box.col = PopulationColour,
             lab = populationText,
             col = grey(0)) # CHECKMARK
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
             rady = 0.1,
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
             radx = 0.13,
             rady = 0.09,
             shadow.size = 0,
             lcol = CompareColour,
             box.col = CompareColour,
             lab = compareText,
             col = grey(0)) # CHECKMARK
   textrect( pos[6, ],
             radx = 0.11,
             rady = 0.1,
             shadow.size = 0,
             lcol = SupportColour,
             box.col = ifelse (Decision == "Accept",
                               DecisionColour,
                               "white"), 
             lab = supportText,
             col = ifelse( Decision == "Reject", 
                           grey(0.3), 
                           "black")) # CHECKMARK
   textrect( pos[7, ],
             radx = 0.11,
             rady = 0.1,
             shadow.size = 0,
             lcol = ContradictColour,
             box.col = ifelse (Decision == "Reject",
                               DecisionColour,
                               "white"), #ContradictColour),
             lab = contradictText,
             col = ifelse( Decision == "Accept", 
                           grey(1), 
                           "black")) # CHECKMARK
   
   # STEPS
   text(x = pos[1, 1],
        y = 0.965,
        cex = 1,
        labels = "Step 1: make an assumption")
   text(x = pos[2, 1],
        y = 0.965,
        cex = 1,
        labels = "Step 2: describe what is expected")
   text(x = mean( pos[1:2, 1]),
        y = 0.02,
        cex = 1,
        labels = "Step 3: evaluate sample statistic")
   text(x = pos[5, 1],
        y = 0.02,
        cex = 1,
        labels = "Step 4: make decision")
   
   
   ## Show question mark
   if (showQuestionMark) {
     text(x = 0.915, 
          y = 0.5, 
          label="?",
          col = "grey",
          cex = 8)
   }
   
 }
 
# showDecisionMaking()