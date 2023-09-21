showStudyDesignBlocking <- function(studyType, # One of "TrueExp", "QuasiExp", "Obs"
                                    addIndividuals = FALSE, # show the allocation of individuals?
                                    addGroupNames = c("Group 1", "Group 2"), # e.g. addGroupNames = c("Group 1", "Group 2", "Group 3")
                                    addCNames = c("Himalaya", "Refined"), # e.g., addCNames = c("Placebo", "10mg", "30mg") 
                                    addResearcherControl = TRUE,
                                    addRandomAllocationText = FALSE, 
                                    addRandomSamplingText = FALSE, 
                                    addInternalValidityText = FALSE, 
                                    addExternalValidityText = FALSE, 
                                    addCompareText = TRUE,
                                    addBlocking = FALSE, # If  TRUE  then two block are shown 
                                    addSampling = FALSE) {# Show  "POP -> SAMPLE") 

  
### Makes a study design diagram, with blocking.
### Only has two blocks, each with 2 treatments/groups
  
  ### CANVAS
  par( mar = c(0.5, 0.5, 0.5, 0.5))

  # Recommend no POPULATION box---too wide!
  shape::emptyplot(ylim = c(-1.1, 1.1), # No change
                   xlim = c(0.2, 1),
                   asp = NULL) # ELSE  asp=1 or requested

#axis(side=1)
#axis(side=2)

  # NAMES
  if ( studyType == "Obs") {
    addCNames <- c("Condition 1", "Condition 2")
  }


  ### SETUP
  pos <- array(NA, dim = c(11, 2))
  # pos[1:3, ] refer to the Groups; see below
  # pos[4:6, ] refer to the Treatments; see below
  
  
  ### SET OPTIONS
  # For Block 2, make  y  coordinates negative
  pos[1, ] <- c(0.60, 0.75)     # Group 1
  pos[2, ] <- c(0.60, 0.35)     # Group 2
  pos[3, ] <- c(NA, NA)         # No Group 3
  
  pos[4, ] <- c(0.85, 0.75)     # Treatment 1
  pos[5, ] <- c(0.85, 0.35)     # Treatment 2
  pos[6, ] <- c(NA, NA)         # No Group 3 to treat
    
  pos[7, ] <- c(0.60, 0.05)     # Compare
  pos[8, ] <- c(0.33, 0 )     # Individuals/Sample
  pos[9, ] <- c(0.10, 0 )     # Population
  
  pos[10, ] <- c( pos[8, 1], 
                  mean(pos[1:2],2)) # BLOCK 1
  pos[11, ] <- c( pos[8, 1], 
                  -c( mean(pos[1:2, 2]) ) ) # BLOCK 2
  

  
  ### COMPARISON ARROWS
  # Need "thick" arrow
  # First, draw the arrow shafts:
  diagram::textrect(mid = c( pos[1, 1],
                             mean( pos[1:3, 2], na.rm = TRUE ) ),
                    radx = 0.02,
                    rady = 0.335,
                    shadow.size = 0,
                    lab = "",
                    box.col = grey(0.8),
                    lcol = grey(0.8))
  diagram::textrect(mid = c( pos[1, 1],
                             -mean( pos[1:3, 2], na.rm = TRUE ) ),
                    radx = 0.02,
                    rady = 0.335,
                    shadow.size = 0,
                    lab = "",
                    box.col = grey(0.8),
                    lcol = grey(0.8))
  
  # Second, draw the arrow head
  diagram::textmulti(mid = c( pos[1, 1], 0.90),
                     radx = 0.09,
                     rady = 0.07,
                     nr = 3, # THAT IS, A TRIANGLE
                     angle = 90, # ROTATION DEGREES
                     shadow.size = 0,
                     lab = "",
                     box.col = grey(0.8),
                     lcol = grey(0.8))
  diagram::textmulti(mid = c( pos[1, 1], -0.90),
                     radx = 0.09,
                     rady = 0.07,
                     nr = 3, # THAT IS, A TRIANGLE
                     angle = 270, # ROTATION DEGREES
                     shadow.size = 0,
                     lab = "",
                     box.col = grey(0.8),
                     lcol = grey(0.8))
  
  
  # Third, add "Comparison" text
  
  
  
  ### ARROWS next, so boxes overplot
  # Arrows from "Individuals" to the Blocks
  diagram::straightarrow(from = pos[8, ], # Individuals to Block i
                         to = pos[10, ], 
                         lcol = ifelse(studyType == "TrueExp", "black", "grey"),
                         lty = ifelse(studyType == "TrueExp", 1, 2), 
                         lwd = 2)
  diagram::straightarrow(from = pos[8, ], # Individuals to Block i
                         to = pos[11, ], 
                         lcol = ifelse(studyType == "TrueExp", "black", "grey"),
                         lty = ifelse(studyType == "TrueExp", 1, 2),  
                         lwd = 2)
  
  
  
  # Arrows from "Blocks" to the groups
  if (addIndividuals) {   
    diagram::straightarrow(from = pos[10, ], # Individuals to Block i
                           to = pos[1, ], 
                           lcol = ifelse(studyType == "TrueExp", "black", "grey"),
                           lty = ifelse(studyType == "TrueExp", 1, 2), 
                           lwd = 2)
    diagram::straightarrow(from = pos[10, ], # Individuals to Block i
                           to = pos[2, ], 
                           lcol = ifelse(studyType == "TrueExp", "black", "grey"),
                           lty = ifelse(studyType == "TrueExp", 1, 2),  
                           lwd = 2)
    
    diagram::straightarrow(from = pos[11, ], # Individuals to Group i
                           to = c( pos[1, 1], -pos[1, 2]), 
                           lcol = ifelse(studyType == "TrueExp", "black", "grey"),
                           lty = ifelse(studyType == "TrueExp", 1, 2), 
                           lwd = 2)
    diagram::straightarrow(from = pos[11, ], # Individuals to Group i
                           to = c( pos[2, 1], -pos[2, 2]),
                           lcol = ifelse(studyType == "TrueExp", "black", "grey"),
                           lty = ifelse(studyType == "TrueExp", 1, 2),  
                           lwd = 2)
  }
  
  # Arrows from groups to treatments
  if ( studyType == "Obs" ) { # For "Obs", arrows are grey and dashed
    diagram::straightarrow(from = pos[4, ], # Group 1 to Treatment 1
                           to = pos[1, ], 
                           lcol = "grey",
                           lty = 2)
    diagram::straightarrow(from = pos[5, ],  # Group 2 to Treatment 2
                           to = pos[2, ], 
                           lcol = "grey",
                           lty = 2)
    
    diagram::straightarrow(from = c(pos[4, 1], -pos[4, 2]), # Group 1 to Treatment 1
                           to = c( pos[1, 1], -pos[1, 2]),
                           lcol = "grey",
                           lty = 2)
    diagram::straightarrow(from = c( pos[5, 1], -pos[5, 2]),  # Group 2 to Treatment 2
                           to = c( pos[2, 1], -pos[2, 2]), 
                           lcol = "grey",
                           lty = 2)
  } else { # studyType is  "QuasiExp" or "TrueExp"
    diagram::straightarrow(from = pos[4, ], # Group 1 to Treatment 1
                           to = pos[1, ], 
                           lcol = ifelse(studyType == "Obs", "grey", "black"),
                           lty = ifelse(studyType == "Obs", 2, 1))
    diagram::straightarrow(from = pos[5, ],  # Group 2 to Treatment 2
                           to = pos[2, ], 
                           lcol = ifelse(studyType == "Obs", "grey", "black"),
                           lty = ifelse(studyType == "Obs", 2, 1))
    
    diagram::straightarrow(from = c(pos[4, 1], -pos[4, 2]), # Group 1 to Treatment 1
                           to = c( pos[1, 1], -pos[1, 2]), 
                           lcol = ifelse(studyType == "Obs", "grey", "black"),
                           lty = ifelse(studyType == "Obs", 2, 1))
    diagram::straightarrow(from = c(pos[5, 1], -pos[5, 2]),  # Group 2 to Treatment 2
                           to = c( pos[2, 1], -pos[2, 2]), 
                           lcol = ifelse(studyType == "Obs", "grey", "black"),
                           lty = ifelse(studyType == "Obs", 2, 1))
    
  }
  
  # Arrows from Population to Sample
  if (addSampling) {
    diagram::straightarrow(from = pos[9, ], # POP to SAMPLE
                           to = pos[8, ], 
                           lcol = "black",
                           lty = 1)
  }
  
  
  ### ADD the BLOCK boxes
  diagram::textrect( pos[10, ],
                     lab = "Block I:\nUnder 30",
                     radx = 0.075,
                     rady = 0.14,
                     shadow.size = 0,
                     lcol = BlockColour,
                     box.col = BlockColour)
  diagram::textrect( pos[11, ], 
                     lab = "Block II:\nAged 30+", 
                     radx = 0.075,
                     rady = 0.14,
                     shadow.size = 0,
                     lcol = BlockColour,
                     box.col = BlockColour)
  
  
  
  
  # ADD GROUPS
  numGroups <- length(addGroupNames)
  # Only works for two at the moment!!
  
  diagram::textrect( pos[1, ], 
                     lab = addGroupNames[1],
                     radx = 0.075,
                     rady = 0.07,
                     shadow.size = 0,
                     lcol = GroupColour,
                     box.col = GroupColour)
  diagram::textrect( pos[2, ], 
                     lab = addGroupNames[2], 
                     radx = 0.075,
                     rady = 0.07,
                     shadow.size = 0,
                     lcol = GroupColour,
                     box.col = GroupColour)

  diagram::textrect( c( pos[1, 1], -pos[1, 2]), 
                     lab = addGroupNames[2],
                     radx = 0.075,
                     rady = 0.07,
                     shadow.size = 0,
                     lcol = GroupColour,
                     box.col = GroupColour)
  diagram::textrect( c( pos[2, 1], -pos[2, 2]), 
                     lab = addGroupNames[1], 
                     radx = 0.075,
                     rady = 0.07,
                     shadow.size = 0,
                     lcol = GroupColour,
                     box.col = GroupColour)
  
  # ADD INDIVIDUALS
  if (addIndividuals) {
    diagram::textrect( pos[8, ], 
                       lab = "Individuals", 
                       radx = 0.075,
                       rady = 0.07,
                       shadow.size = 0,
                       lcol = IndividualColour,
                       box.col = IndividualColour)
    
  }
  
  # ADD POPULATION
  if (addSampling) {
    diagram::textrect( pos[9, ], 
                       lab = "Population", 
                       radx = 0.075,
                       rady = 0.07,
                       shadow.size = 0,
                       lcol = IndividualColour,
                       box.col = IndividualColour )
  }
  
  
  
  
  # ADD TREATMENTS/CONDITIONS
  numC <- length(addCNames)
  if (numC != numGroups) error("Need as many conditions/treatments as groups!")
  diagram::textrect( pos[4, ], 
                     box.col = ExplanatoryColour,
                     lcol = ExplanatoryColour,
                     shadow.size = 0,
                     radx = 0.08,
                     rady = 0.07,
                     lab = addCNames[1])
  diagram::textrect( pos[5, ], 
                     box.col = ExplanatoryColour,
                     lcol = ExplanatoryColour,
                     shadow.size = 0,
                     radx = 0.08,
                     rady = 0.07,
                     lab = addCNames[2])
  
  diagram::textrect( c(pos[4, 1], -pos[4, 2]), 
                     box.col = ExplanatoryColour,
                     lcol = ExplanatoryColour,
                     shadow.size = 0,
                     radx = 0.08,
                     rady = 0.07,
                     lab = addCNames[2])
  diagram::textrect( c( pos[5, 1], -pos[5, 2]), 
                     box.col = ExplanatoryColour,
                     lcol = ExplanatoryColour,
                     shadow.size = 0,
                     radx = 0.08,
                     rady = 0.07,
                     lab = addCNames[1])
  
  

  # "Always" need to compare...
  if (addCompareText) {
    text( x = pos[1, 1], 
          y = 1.05,
          cex = 1.05,
          font = 2, # BOLD
          label = "Compare")
    text( x = pos[1, 1], 
          y = -1.05,
          cex = 1.05,
          font = 2, # BOLD
          label = "Compare")
  }
  
  # Add headings
  #  text( x = pos[1, 1], 
  #        y = 0.95,
  #        cex = 1.05,
  #        font = 2, # BOLD
  #        label = "Groups")
  #  text( x = pos[3, 1], 
  #        y = 0.95,
  #        cex = 1.05,
  #        font = 2, # BOLD
  #        label = ifelse(studyType == "Obs", "Conditions", "Treatments"))
  
  
  # # Add the "Controlled by researchers" text
  # if (studyType == "Obs") {
  #   
  #   # Decided to print nothing in this case
  #   
  # } else { # TrueExp and QuasiExp
  #   if ( !addInternalValidityText) {
  #     text( x = mean( c(left, right) ), 
  #           y = 0.925, # Mean of the top and bottom of the "Controlled by researchers" box
  #           cex = 1.05,
  #           font = 2, # BOLD
  #           label = "Controlled by researchers")
  #   }
  # }
  
  
  ### ADD RANDOM ALLOCATION TEXT
  if (addRandomAllocationText){
    diagram::textrect( c( mean( pos[ c(1, 4), 1] ), 
                          mean( pos[ c(1, 2, 3), 2], na.rm = TRUE ) ),
                       radx = 0.001,
                       rady  = 0.001,
                       lcol = "white",
                       box.col = "white",
                       shadow.size = 0,
                       cex = 1.4,
                       lab = "Random allocation",
                       col = "grey",
                       srt = 90)
    
    
    diagram::textrect( c( mean( pos[ c(1, 8), 1] ), 
                          mean( pos[ c(1, 2, 3), 2], na.rm = TRUE ) ),
                       radx = 0.001,
                       rady  = 0.001,
                       lcol = "white",
                       box.col = "white",
                       shadow.size = 0,
                       cex = 1.4,
                       lab = "Random allocation",
                       col = "grey",
                       srt = 90)
  }
  
  
  ### ADD RANDOM SAMPLING TEXT
  if (addRandomSamplingText){
    diagram::textrect( c( mean( pos[ c(8, 9), 1] ), 
                          mean( pos[ c(1, 2, 3), 2], na.rm = TRUE ) ),
                       radx = 0.001,
                       rady  = 0.001,
                       lcol = "white",
                       box.col = "white",
                       shadow.size = 0,
                       cex = 1.4,
                       lab = "Random sampling",
                       col = "grey",
                       srt = 90)
  }
  
  ### ADD COOKIE IMAGES
  plotfunctions::plot_image(img = "Pics/iconmonstr-candy-5-240.png", # HIMALAYA
                            type = "png",
                            keep.ratio = TRUE,
                            xrange = c( pos[4, 1] + 0.11 - 0.0175,
                                        pos[4, 1] + 0.11 + 0.0175),
                            yrange = c( pos[4, 2] - 0.08,
                                        pos[4, 2] + 0.08),
                            bty = "n", # Removes box from around the plot 
                            add = TRUE)
  
  plotfunctions::plot_image(img = "Pics/iconmonstr-candy-8-240.png", # REFINED
                            type = "png",
                            keep.ratio = TRUE,
                            xrange = c( pos[5, 1] + 0.11 - 0.0175,
                                        pos[5, 1] + 0.11 + 0.0175),
                            yrange = c( pos[5, 2] - 0.08,
                                        pos[5, 2] + 0.08),
                            bty = "n", # Removes box from around the plot 
                            add = TRUE)
  

  
  plotfunctions::plot_image(img = "Pics/iconmonstr-candy-5-240.png", # HIMALAYA
                            type = "png",
                            keep.ratio = TRUE,
                            xrange = c( pos[5, 1] + 0.11 - 0.0175,
                                        pos[5, 1] + 0.11 + 0.0175),
                            yrange = c( -pos[5, 2] - 0.08,
                                        -pos[5, 2] + 0.08),
                            bty = "n", # Removes box from around the plot 
                            add = TRUE)
  
  plotfunctions::plot_image(img = "Pics/iconmonstr-candy-8-240.png", # REFINED
                            type = "png",
                            keep.ratio = TRUE,
                            xrange = c( pos[4, 1] + 0.11 - 0.0175,
                                        pos[4, 1] + 0.11 + 0.0175),
                            yrange = c( -pos[4, 2] - 0.08,
                                        -pos[4, 2] + 0.08),
                            bty = "n", # Removes box from around the plot 
                            add = TRUE)
  
  
  ### ADD PEOPLE IMAGES
  
  plotfunctions::plot_image(img = "Pics/iconmonstr-generation-4-240.png", # GIRL
                              type = "png",
                              keep.ratio = TRUE,
                              xrange = c( pos[10, 1] - 0.04 - 0.0175,
                                          pos[10, 1] - 0.04 + 0.0175),
                              yrange = c( pos[10, 2] + 0.25 - 0.08,
                                          pos[10, 2] + 0.25 + 0.08),
                              bty = "n", # Removes box from around the plot 
                              add = TRUE)
    
    plotfunctions::plot_image(img = "Pics/iconmonstr-generation-7-240.png", # BOY
                              type = "png",
                              keep.ratio = TRUE,
                              xrange = c( pos[10, 1] + 0.04 - 0.0175,
                                          pos[10, 1] + 0.04 + 0.0175),
                              yrange = c( pos[10, 2] + 0.25 - 0.08,
                                          pos[10, 2] + 0.25 + 0.08),
                              bty = "n", # Removes box from around the plot 
                              add = TRUE)

    plotfunctions::plot_image(img = "Pics/iconmonstr-generation-16-240.png", # LADY
                              type = "png",
                              keep.ratio = TRUE,
                              xrange = c( pos[11, 1] - 0.04 - 0.0175,
                                          pos[11, 1] - 0.04 + 0.0175),
                              yrange = c( pos[11, 2] - 0.25 - 0.08,
                                          pos[11, 2] - 0.25 + 0.08),
                              bty = "n", # Removes box from around the plot 
                              add = TRUE)
    
    plotfunctions::plot_image(img = "Pics/iconmonstr-generation-15-240.png", # MAN
                              type = "png",
                              keep.ratio = TRUE,
                              xrange = c( pos[11, 1] + 0.04 - 0.0175,
                                          pos[11, 1] + 0.04 + 0.0175),
                              yrange = c( pos[11, 2] - 0.25 - 0.08,
                                          pos[11, 2] - 0.25 + 0.08),
                              bty = "n", # Removes box from around the plot 
                              add = TRUE)
    
  
  if ( addInternalValidityText ) {
    polygon( x = c(0.425, 0.425, 1.00, 1.00),
             y = c(0.00, 1.00, 1.00, 0.00),
             lwd = 2,
             border = "grey")
    text( x = 0.725,
          y =  0.05,
          labels = "Internal validity")  }
  
  if (addExternalValidityText) {
    polygon( x = c(0.00, 0.00, 0.425, 0.425),
             y = c(0.00, 1.00, 1.00, 0.00),
             lwd = 2,
             border = "grey")
    text( x = 0.225,
          y =  0.05,
          labels = "External validity")
    
    
  }
  
  ### SPLIT the blocks
  lines( x = c(pos[8, 1] + 0.15, 100),
         y = c(0, 0),
         lwd = 2,
         lty = 2,
         col = "grey")
}


