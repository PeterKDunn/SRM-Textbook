showStudyDesignOLD <- function(studyType, # One of "TrueExp", "QuasiExp", "Obs"
                            addIndividuals = FALSE, # show the allocation of individuals?
                            addGroupNames = c("Group 1", "Group 2"), # e.g. addGroupNames = c("Placebo", "10mg", "30mg")
                            addCNames = c("Treatment 1", "Treatment 2"),
                            addImages = FALSE) {
  # CANVAS
  par( mar = c(0.5, 0.5, 0.5, 0.5))
  diagram::openplotmat()

  # SETUP
  pos <- array(NA, dim = c(6, 2))
  pos[1, ] <- c(0.30, 0.25)     # Group 1
  pos[2, ] <- c(0.30, 0.75)     # Group 2
  pos[3, ] <- c(0.60, 0.75)     # Treatment 1
  pos[4, ] <- c(0.60, 0.25)     # Treatment 1
  pos[5, ] <- c(0.90, 0.50)     # Compare
  pos[6, ] <- c(0.10, 0.50)     #Individuals
  
  
  # BACKGROUND, designating what researchers control
  if (studyType == "TrueExp") left <- 0
  if (studyType == "QuasiExp") left <- 0.40
  if (studyType == "Obs") left <- 0.80
  
  bottom <- 0.02 
  top <- 0.88
  polygon( x = c(left, 1,   1, left),
           y = c(top,  top, bottom, bottom),
           border = NA,
           col = viridis::viridis(10, alpha = 0.10)[1])
  

  # ARROWS next, so boxes overplot
  # Arrows from "Individuals" to the groups
  if (addIndividuals) {   
    diagram::straightarrow(from = pos[6,], # Individuals to Group i
                           to = pos[1,], 
                           lcol = ifelse(studyType == "TrueExp", "black", "grey"),
                           lty = ifelse(studyType == "TrueExp", 1, 2), 
                           lwd = 2)
    diagram::straightarrow(from = pos[6,], # Individuals to Group i
                           to = pos[2,], 
                           lcol = ifelse(studyType == "TrueExp", "black", "grey"),
                           lty = ifelse(studyType == "TrueExp", 1, 2),  
                           lwd = 2)
  }
  
  # Arrows from groups to treatments
  diagram::straightarrow(from = pos[1,], # Group 1 to Treatment 1
                to = pos[4,], 
                lcol = ifelse(studyType == "Obs", "grey", "black"),
                lty = ifelse(studyType == "Obs", 2, 1))
  diagram::straightarrow(from = pos[2,],  # Group 2 to Treatment 2
                         to = pos[3,], 
                         lcol = ifelse(studyType == "Obs", "grey", "black"),
                         lty = ifelse(studyType == "Obs", 2, 1))
  
  # Arrows from Treatments/Conditions to Compare
  diagram::straightarrow(from = pos[3,], 
                         to = pos[5,], 
                         lcol = "black",
                         lty = 1, 
                         lwd = 2)
  diagram::straightarrow(from = pos[4,], 
                         to = pos[5,], 
                         lcol = "black",
                         lwd = 2,
                         lty = 1)
  
  
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
    diagram::textrect( pos[6, ], 
                       lab = "Individuals", 
                       radx = 0.075,
                       rady = 0.07,
                       shadow.size = 0,
                       lcol = "darkseagreen1",
                       box.col = "darkseagreen1"
    )
    
  }
  
  
  # ADD TREATMENTS/CONDITIONS
  numC <- length(addCNames)
  if (numC != numGroups) error("Need as many conditions/treatments as groups!")
  
  # Only works for two at the moment!!
  
  diagram::textrect( pos[3,], 
                     box.col = "white",
                     lcol = "white",
                     shadow.size = 0,
                     radx = 0.10,
                     rady = 0.07,
                     lab = addCNames[1])
  diagram::textrect( pos[4,], 
                     box.col = "white",
                     lcol = "white",
                     shadow.size = 0,
                     radx = 0.10,
                     rady = 0.07,
                     lab = addCNames[2])
  
  # Always need to compare...
  diagram::textrect( pos[5,], 
                     lab = "Compare", 
                     radx = 0.075, 
                     rady = 0.1, 
                     shadow.size = 0,
                     box.col = "antiquewhite",
                     lcol = "antiquewhite")
  
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
  text( x = mean(c (left, 1) ), 
        y = ifelse(studyType == "Obs", 0.17, 0.06),
        cex = 1.05,
        font = 2, # BOLD
        label = ifelse(studyType == "Obs", "Controlled\nby\nresearchers", "Controlled by researchers") )
  
  
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