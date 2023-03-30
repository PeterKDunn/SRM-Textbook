showStudyDesign <- function(studyType, # One of "TrueExp", "QuasiExp", "Obs"
                            addIndividuals = FALSE, # show the allocation of individuals?
                            addGroupNames = c("Group 1", "Group 2"), # e.g. addGroupNames = c("Placebo", "10mg", "30mg")
                            addCNames = c("Treatment 1", "Treatment 2"),
                            addImages = FALSE,
                            addBlocking = FALSE, # If  TRUE  then two block are shown 
                            addSampling = FALSE) { # Show  "POP -> SAMPLE"
  ### CANVAS
  par( mar = c(0.5, 0.5, 0.5, 0.5))
  diagram::openplotmat()
  
  
  
### AT PRESENT ONLY FOR ONE BLOCK...:


  # NAMES
  if ( studyType == "Obs") {
    addCNames <- c("Condition 1", "Condition 2")
  }
    ### SETUP
  pos <- array(NA, dim = c(14, 2))
  # pos[1:3, ] refer to the Groups; see below
  # pos[4:6, ] refer to the Treatments; see below
  pos[7, ] <- c(0.60, 0.05)     # Compare
  pos[8, ] <- c(0.33, 0.50)     # Individuals/Sample
  pos[9, ] <- c(0.10, 0.50)     # Population
  

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
  
  ### BACKGROUND, designating what researchers control
  
  if (studyType == "TrueExp") {
    top <- 0.99
    left <- pos[8, 1]
    right <- 1
  }
  if (studyType == "QuasiExp") {
    top <- 0.99
    left <- 0.50
    right <- 1
  }
  if (studyType == "Obs") {
#    top <- 0.2
#    left <- 0.50
#    right <- 0.7
  }
 
  if ( studyType != "Obs") { 
    bottom <- 0.25
    polygon( x = c(left, right, right, left),
             y = c(top,  top, bottom, bottom),
             border = NA,
             col = viridis::viridis(10, alpha = 0.10)[1])
  }  
  
  ### COMPARISON
  # Need "thick" arrow
  # First, draw the arrow shaft:
  diagram::textrect(mid = colMeans( pos[1:3, ], na.rm = TRUE),
                    radx = 0.025,
                    rady = 0.35,
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
    diagram::straightarrow(from = pos[8, ], # Individuals to Group i
                           to = pos[1, ], 
                           lcol = ifelse(studyType == "TrueExp", "black", "grey"),
                           lty = ifelse(studyType == "TrueExp", 1, 2), 
                           lwd = 2)
    diagram::straightarrow(from = pos[8, ], # Individuals to Group i
                           to = pos[2, ], 
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
  } else { # studyType is  "QuasiExp" or "TrueExp"
    diagram::straightarrow(from = pos[4, ], # Group 1 to Treatment 1
                           to = pos[1, ], 
                           lcol = ifelse(studyType == "Obs", "grey", "black"),
                           lty = ifelse(studyType == "Obs", 2, 1))
    diagram::straightarrow(from = pos[5, ],  # Group 2 to Treatment 2
                           to = pos[2, ], 
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

  
    # Arrows from Treatments/Conditions to Compare
#  diagram::straightarrow(from = pos[3,], 
#                         to = pos[5,], 
#                         lcol = "black",
#                         lty = 1, 
#                         lwd = 2)
#  diagram::straightarrow(from = pos[4,], 
#                         to = pos[5,], 
#                         lcol = "black",
#                         lwd = 2,
#                         lty = 1)
  
  
  # ADD GROUPS
  numGroups <- length(addGroupNames)
  # Only works for two at the moment!!
  
  diagram::textrect( pos[1,], 
                     lab = addGroupNames[2],
                     radx = 0.075,
                     rady = 0.07,
                     shadow.size = 0,
                     lcol = "darkseagreen1",
                     box.col = "darkseagreen1")
  diagram::textrect( pos[2,], 
                     lab = addGroupNames[1], 
                     radx = 0.075,
                     rady = 0.07,
                     shadow.size = 0,
                     lcol = "darkseagreen1",
                     box.col = "darkseagreen1")
  
  # ADD INDIVIDUALS
  if (addIndividuals) {
    diagram::textrect( pos[8, ], 
                       lab = "Individuals", 
                       radx = 0.075,
                       rady = 0.07,
                       shadow.size = 0,
                       lcol = "darkseagreen1",
                       box.col = "darkseagreen1"
    )
    
  }
  
  # ADD POPULATION
  if (addSampling) {
    diagram::textrect( pos[9, ], 
                       lab = "Population", 
                       radx = 0.075,
                       rady = 0.07,
                       shadow.size = 0,
                       lcol = "darkseagreen1",
                       box.col = "darkseagreen1" )
  }
  
  
  
  
  # ADD TREATMENTS/CONDITIONS
  numC <- length(addCNames)
  if (numC != numGroups) error("Need as many conditions/treatments as groups!")
  
  # Only works for two at the moment!!
  
  diagram::textrect( pos[4,], 
                     box.col = "white",
                     lcol = "white",
                     shadow.size = 0,
                     radx = 0.08,
                     rady = 0.07,
                     lab = addCNames[1])
  diagram::textrect( pos[5,], 
                     box.col = "white",
                     lcol = "white",
                     shadow.size = 0,
                     radx = 0.08,
                     rady = 0.07,
                     lab = addCNames[2])
  
  # Always need to compare...
  text( x = pos[7, 1], 
        y = 0.05,
        cex = 1.05,
        font = 2, # BOLD
        label = "Compare")

  # Add headings
  text( x = pos[1, 1], 
        y = 0.95,
        cex = 1.05,
        font = 2, # BOLD
        label = "Groups")
  text( x = pos[3, 1], 
        y = 0.95,
        cex = 1.05,
        font = 2, # BOLD
        label = ifelse(studyType == "Obs", "Conditions", "Treatments"))

  
  # Add the "Controlled by researchers" text
  if (studyType == "Obs") {
#    text( x = mean( c(left + 0.2, 1) ), 
#          y = 0.10,
#          cex = 1.05,
#          font = 2, # BOLD
#          label = ifelse(studyType == "Obs", "Controlled\nby\nresearchers") )
    # And and arrow

    
  } else { # TrueExp and QuasiExp
    text( x = 0.975, 
        y = 0.625,
        srt = 90,
        cex = 1.05,
        font = 2, # BOLD
        label = "Controlled by researchers")
  }
  
  # Add images
  if (addImages) {
    plotfunctions::plot_image(img = "./Pics/iconmonstr-checkbox-26-240.png",
                              type = "png",
                              keep.ratio = TRUE,
                              xrange = c(0.75, 0.8),
                              yrange = c(0.80, 0.9),
                              bty = "n", # Removes box from around the plot 
                              add = TRUE)
    
    plotfunctions::plot_image(img = "./Pics/iconmonstr-checkbox-22-240.png",
                              type = "png",
                              keep.ratio = TRUE,
                              xrange = c(0.75, 0.8),
                              yrange = c(0.10, 0.2),
                              bty = "n", # Removes box from around the plot 
                              add = TRUE)
  }
}


showStudyDesign(studyType = "QuasiExp",
                addIndividuals = TRUE)