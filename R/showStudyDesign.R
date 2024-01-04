showStudyDesign <- function(studyType, # One of "TrueExp", "QuasiExp", "Obs"
                            addIndividuals = FALSE, # show the allocation of individuals?
                            addGroupNames = c("Group 1", "Group 2"), # e.g. addGroupNames = c("Group 1", "Group 2", "Group 3")
                            addCNames = c("Treatment 1", "Treatment 2"), # e.g., addCNames = c("Placebo", "10mg", "30mg") 
                            addImages = FALSE,
                            imageList = NULL,
                            addResearcherControl = TRUE,
                            addRandomAllocationText = FALSE, 
                            addRandomSamplingText = FALSE, 
                            addInternalValidityText = FALSE, 
                            addExternalValidityText = FALSE, 
                            addCompareText = TRUE,
                            addByResearchers = TRUE,
                            addBlocking = FALSE, # If  TRUE  then two block are shown 
                            addSampling = FALSE, # Show  "POP -> SAMPLE"
                            addThirdParty = FALSE) { # This allows for showing blinding of researchers 
  
  ### Makes a study design diagram, withOUT blocking.
  ### Works for two groups/treatments; most things should work with three
  
  
  ### CANVAS
  par( mar = c(0.5, 0.5, 0.5, 0.5))
  useDefaultCanvas <- TRUE
  xLimLo <- 0
  xLimHi <- 1
  
  # WATCH THE ORDER HERE!
  if ( addThirdParty ) {
    # Recommend no POPULATION box---too wide!
    useDefaultCanvas <- FALSE
    xLimHi <- 1.5
  } 
  if ( addIndividuals ) {
    useDefaultCanvas <- FALSE
    xLimLo <- 0.2
  }
  if ( addSampling ) {
    useDefaultCanvas <- FALSE
    xLimLo <- 0.0
    xLimHi <- 1.0
  }
  
  if (useDefaultCanvas) { 
    diagram::openplotmat()
  } else {
    shape::emptyplot(ylim = c(0, 1), # No change
                     xlim = c(xLimLo, xLimHi),
                     asp = NULL) # ELSE  asp=1 or requested
    
  }
  
  ### AT PRESENT ONLY FOR ONE BLOCK...:
  
  
  # NAMES
  if ( studyType == "Obs") {
    if (addCNames[1] == "Treatment 1") {
      addCNames <- c("Condition 1", "Condition 2")
    }
  }
  if ( addThirdParty ) {
    addResearcherControl <- FALSE # We add other things instead, 
    # and besides... it is the same for quasi- and true experiments, so it doesn't matter which we show
    
    addBlindedTreatmentNames <- addCNames
    addCNames <- c('"A"', '"B"')
  }
  ### SETUP
  pos <- array(NA, dim = c(14, 2))
  # pos[1:3, ] refer to the Groups; see below
  # pos[4:6, ] refer to the Treatments; see below
  
  
  ### SET OPTIONS 
  numberOfcomparisons <- length(addGroupNames)
  if ( numberOfcomparisons == 2){ # Two groups being compared
    pos[1, ] <- c(0.60, 0.75)     # Group 1
    pos[2, ] <- c(0.60, 0.35)     # Group 2
    pos[3, ] <- c(NA, NA)         # No Group 3
    
    pos[4, ] <- c(0.85, 0.75)     # Treatment 1
    pos[5, ] <- c(0.85, 0.35)     # Treatment 2
    pos[6, ] <- c(NA, NA)         # No Group 3 to treat
    
  } else { # Three groups being compared
    pos[1, ] <- c(0.60, 0.75)     # Group 1
    pos[2, ] <- c(0.60, 0.55)     # Group 2
    pos[3, ] <- c(0.60, 0.35)     # Group 3
    
    pos[4, ] <- c(0.85, 0.75)     # Treatment 1
    pos[5, ] <- c(0.85, 0.55)     # Treatment 2
    pos[6, ] <- c(0.85, 0.35)     # Treatment 3
  }
  pos[7, ] <- c(0.60, 0.05)     # Compare
  pos[8, ] <- c(0.33, mean( pos[1:3, 2], 
                            na.rm = TRUE ) )     # Individuals/Sample
  pos[9, ] <- c(0.10, mean( pos[1:2, 2], 
                            na.rm = TRUE ) )     # Population
  
  ### BACKGROUND, designating what researchers control
  # We do the calculations whether the research-control info is needed or not, 
  # as sometimes  left  and  right  etc are used later
  if (studyType == "TrueExp" & addByResearchers) text(x = mean( c(pos[8, 1], pos[1, 1] ) ),
                                                      y = 0.5,
                                                      labels = "By researchers",
                                                      col = "grey",
                                                      srt = 90,
                                                      cex = 1.65)
  if (studyType != "Obs" & addByResearchers) text(x = mean( c(pos[1, 1], pos[4, 1]) ),
                                                  y = 0.5,
                                                  labels = "By researchers",
                                                  col = "grey",
                                                  srt = 90,
                                                  cex = 1.65)
  
  if (studyType == "TrueExp") {
    top <- 0.99
    left <- pos[8, 1]
    right <- 1
    bottom <- 0.15
  }
  if (studyType == "QuasiExp") {
    top <- 1
    left <- 0.50
    right <- 1
    bottom <- 0.15
  }
  if (studyType == "Obs") {
    #    top <- 0.2
    #    left <- 0.50
    #    right <- 0.7
    #    bottom <- 0.25
  }
  # if (addResearcherControl){
  #   
  #   if ( studyType != "Obs") { 
  #     polygon( x = c(left, right, right, left),
  #              y = c(top,  top, bottom, bottom),
  #              border = NA,
  #              col = viridis::viridis(10, alpha = 0.10)[1])
  #   }  
  # }
  
  ### COMPARISON ARROW
  # Need "thick" arrow
  # First, draw the arrow shaft:
  diagram::textrect(mid = colMeans( pos[1:3, ], na.rm = TRUE),
                    radx = 0.02,
                    rady = 0.335,
                    shadow.size = 0,
                    lab = "",
                    box.col = grey(0.8),
                    lcol = grey(0.8))
  # Second, draw the arrow head
  diagram::textmulti(mid = c(pos[1, 1], 0.17),
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
  # Arrows from "Individuals" to the groups
  if (addIndividuals) {   
    diagram::bentarrow(from = pos[8, ], # Individuals to Group 1
                       to = pos[1, ], 
                       path = "V",
                       arr.pos = 0.3,
                       lcol = ifelse(studyType == "TrueExp", "black", "grey"),
                       lty = ifelse(studyType == "TrueExp", 1, 2), 
                       arr.type = ifelse(studyType == "TrueExp", "curved", "none"),
                       lwd = 2)
    
    diagram::bentarrow(from = pos[8, ], # Individuals to Group 2
                       to = pos[2, ], 
                       path = "V",
                       arr.pos = 0.3,
                       lcol = ifelse(studyType == "TrueExp", "black", "grey"),
                       lty = ifelse(studyType == "TrueExp", 1, 2),  
                       arr.type = ifelse(studyType == "TrueExp", "curved", "none"),
                       lwd = 2)
    if (length(addGroupNames) == 3) {
      diagram::bentarrow(from = pos[8, ], # Individuals to Group 3
                         to = pos[3, ], 
                         path = "V",
                         arr.pos = 0.3,
                         lcol = ifelse(studyType == "TrueExp", "black", "grey"),
                         lty = ifelse(studyType == "TrueExp", 1, 2),  
                         arr.type = ifelse(studyType == "TrueExp", "curved", "none"),
                         lwd = 2)
    }
  }
  
  # Arrows from groups to treatments
  if ( studyType == "Obs" ) { # For "Obs", arrows are double arrows, are grey and dashed
    diagram::straightarrow(to = pos[4, ], # Group 1 to Treatment 1
                           from = pos[1, ], 
                           lcol = "grey",
                           lwd = 2,
                           segment = c(0.60, 0.70), # To get just the arrow
                           arr.pos = 0.65,
                           lty = 2)
    diagram::straightarrow(from = pos[4, ], # Group 1 to Treatment 1
                           to = pos[1, ], 
                           lcol = "grey",
                           lwd = 2,
                           arr.pos = 0.65,
                           lty = 2)
    
    diagram::straightarrow(to = pos[5, ],  # Group 2 to Treatment 2
                           from = pos[2, ], 
                           arr.col = "grey",
                           lwd = 2,
                           lcol = "grey", # Two sets of dashed lines often pverlap; make first white
                           segment = c(0.60, 0.70), # To get just the arrow
                           arr.pos = 0.65,
                           lty = 2)
    diagram::straightarrow(from = pos[5, ],  # Group 2 to Treatment 2
                           to = pos[2, ], 
                           lcol = "grey",
                           lwd = 2,
                           arr.pos = 0.65,
                           lty = 2)
    
    if (length(addGroupNames) == 3) {
      diagram::straightarrow(to = pos[6, ],  # Group 3 to Treatment 3
                             from = pos[3, ], 
                             arr.col = "grey",
                             arr.pos = 0.65,
                             lwd = 2,
                             segment = c(0.60, 0.70), # To get just the arrow
                             lty = 2)
      diagram::straightarrow(from = pos[6, ],  # Group 3 to Treatment 3
                             to = pos[3, ], 
                             lcol = "grey",
                             lwd = 2,
                             arr.pos = 0.65,
                             lty = 2)
    }
  } else { # studyType is  "QuasiExp" or "TrueExp"
    diagram::straightarrow(from = pos[4, ], # Group 1 to Treatment 1
                           to = pos[1, ],
                           arr.pos = 0.6,
                           lwd = 2,
                           lcol = ifelse(studyType == "Obs", "grey", "black"),
                           lty = ifelse(studyType == "Obs", 2, 1))
    diagram::straightarrow(from = pos[5, ],  # Group 2 to Treatment 2
                           to = pos[2, ], 
                           arr.pos = 0.6,
                           lwd = 2,
                           lcol = ifelse(studyType == "Obs", "grey", "black"),
                           lty = ifelse(studyType == "Obs", 2, 1))
    if (length(addGroupNames) == 3) {
      diagram::straightarrow(from = pos[6, ],  # Group 3 to Treatment 3
                             to = pos[3, ], 
                             arr.pos = 0.6,
                             lwd = 2,
                             lcol = ifelse(studyType == "Obs", "grey", "black"),
                             lty = ifelse(studyType == "Obs", 2, 1))
    }
  }
  
  # Arrows from Population to Sample
  if (addSampling) {
    diagram::straightarrow(from = pos[9, ], # POP to SAMPLE
                           to = pos[8, ], 
                           lcol = "black",
                           lwd = 2,
                           lty = 1)
  }
  
  
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
  if (length(addGroupNames) == 3) {
    diagram::textrect( pos[3, ], 
                       lab = addGroupNames[3], 
                       radx = 0.075,
                       rady = 0.07,
                       shadow.size = 0,
                       lcol = GroupColour,
                       box.col = GroupColour)
  }
  
  
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
                       box.col = IndividualColour)
  }
  
  
  
  
  # ADD TREATMENTS/CONDITIONS
  numC <- length(addCNames)
  if (numC != numGroups) error("Need as many conditions/treatments as groups!")
  
  # Only works for two at the moment!!
  if ( !addThirdParty ) {
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
    if (length(addGroupNames) == 3) {
      diagram::textrect( pos[6, ], 
                         box.col = ExplanatoryColour,
                         lcol = ExplanatoryColour,
                         shadow.size = 0,
                         radx = 0.08,
                         rady = 0.07,
                         lab = addCNames[3])
    }
    
  } else {
    BlindTreatmentx <- array( NA, 
                              dim = c(2, 2))
    BlindTreatmentx[1, ] <- c(1.4, pos[4, 2])
    BlindTreatmentx[2, ] <- c(1.4, pos[5, 2])
    
    diagram::straightarrow(from = BlindTreatmentx[1, ], # Treatment 1 to A
                           to = pos[5, ], 
                           segment = c(0, 0.350),
                           arr.pos = 0.50, # Position arrow at end of line
                           lcol = "grey",
                           lty = 1)
    
    diagram::straightarrow(from = BlindTreatmentx[2, ], # Treatment 1 to A
                           to = pos[4, ], 
                           segment = c(0, 0.350),
                           arr.pos = 0.30, # Position arrow at end of line
                           lcol = "grey",
                           lty = 1)
    
    # ADD the question-mark allocation arrows: To blinded treatments
    diagram::straightarrow(from = BlindTreatmentx[1, ], # Treatment 1 to A
                           to = pos[5, ],
                           segment = c(0.65, 1.00),
                           arr.pos = 0.75, # Position arrow at end of line
                           lcol = "grey",
                           lty = 2)
    
    diagram::straightarrow(from = BlindTreatmentx[2, ], # Treatment 1 to A
                           to = pos[4, ],
                           segment = c(0.65, 1.00),
                           arr.pos = 0.75, # Position arrow at end of line
                           lcol = "grey",
                           lty = 2)
    
    
    # ADD the next boxes
    diagram::textrect( BlindTreatmentx[1, ],
                       box.col = ExplanatoryColour,
                       lcol = ExplanatoryColour,
                       shadow.size = 0,
                       radx = 0.08,
                       rady = 0.07,
                       lab = addBlindedTreatmentNames[1])
    diagram::textrect( BlindTreatmentx[2, ],
                       box.col = ExplanatoryColour,
                       lcol = ExplanatoryColour,
                       shadow.size = 0,
                       radx = 0.08,
                       rady = 0.07,
                       lab = addBlindedTreatmentNames[2])
    
  }
  
  
  # "Always" need to compare...
  if (addCompareText) {
    text( x = pos[7, 1], 
          y = 0.05,
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
  
  
  
  # ADD IMAGES
  if ( addImages ) {
    plotfunctions::plot_image(img = imageList[1],
                              type = "png",
                              keep.ratio = TRUE,
                              xrange = c( 0.945, 0.995),
                              yrange = c( pos[4, 2] - 0.05,
                                          pos[4, 2] + 0.05),
                              bty = "n", # Removes box from around the plot 
                              add = TRUE)
    
    plotfunctions::plot_image(img = imageList[2],
                              type = "png",
                              keep.ratio = TRUE,
                              xrange = c( 0.945, 0.995),
                              yrange = c( pos[5, 2] - 0.05,
                                          pos[5, 2] + 0.05),
                              bty = "n", # Removes box from around the plot 
                              add = TRUE)
  }
  
  
  if ( addInternalValidityText ) {
    polygon( x = c(0.425, 0.425, 1.00, 1.00),
             y = c(0.00, 1.00, 1.00, 0.00),
             lwd = 2,
             border = "grey")
    text( x = 0.725,
          y =  0.95,
          cex = 1.1,
          labels = "Internal validity")  }
  
  if (addExternalValidityText) {
    polygon( x = c(0.00, 0.00, 0.425, 0.425),
             y = c(0.00, 1.00, 1.00, 0.00),
             lwd = 2,
             border = "grey")
    text( x = 0.225,
          y =  0.95,
          cex = 1.1,
          labels = "External validity")
    
    
  } 
  
  
  ### ADD THIRD PARTY
  if ( addThirdParty ) {
    # Add question mark
    Deltax <- 0.075
    Deltay <- 0.125
    
    plotfunctions::plot_image(img =  "icons/iconmonstr-help-3-240.png",
                              type = "png",
                              keep.ratio = TRUE,
                              xrange = c( mean(c(pos[4, 1], 1.4)) - Deltax, 
                                          mean(c(pos[4, 1], 1.4)) + Deltax),
                              yrange = c( pos[8, 2] - Deltay,
                                          pos[8, 2] + Deltay),
                              bty = "n", # Removes box
                              add = TRUE)
    
    # Add arrows
    diagram::textrect( c(pos[4, ], 1.2),
                       lab = addCNames[1], 
                       radx = 0.075,
                       rady = 0.07,
                       shadow.size = 0,
                       lcol = ExplanatoryColour,
                       box.col = ExplanatoryColour)
    
    diagram::textrect( c(pos[5, ], 1.2),
                       lab = addCNames[2], 
                       radx = 0.075,
                       rady = 0.07,
                       shadow.size = 0,
                       lcol = ExplanatoryColour,
                       box.col = ExplanatoryColour)
    
    # Add text
    text(x = pos[4, 1],
         y = pos[7, 2] + 0.1,
         labels = "As administered\nby assistant")
    text(x = BlindTreatmentx[1, 1],
         y = pos[7, 2] + 0.1,
         labels = "Allocated by\n researchers")
  }
}

