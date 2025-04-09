showDesignConsiderations <- function(studyType="Experiment", addIcons = FALSE){
  
  par( mar = c(0.5, 0.5, 0.5, 0.5))
  openplotmat(ylim = c(-0.1, 1) )
  
  pos <- array(NA, dim = c(15, 2))
  
  # Problems
  # pos[1, ] <- c(0.45, 0.75) # Confounding
  # pos[2, ] <- c(0.45, 0.60) # Hawthorne
  # pos[3, ] <- c(0.45, 0.37) # Placebo
  pos[1, ] <- c(0.45, 0.60) # Confounding
  pos[2, ] <- c(0.45, 0.45) # Hawthorne
  pos[3, ] <- c(0.45, 0.30) # Placebo
  pos[4, ] <- c(0.45, 0.15) # Observer
  pos[5, ] <- c(0.45, 0.00) # Carryover
  
  # Solutions
  pos[7, ]  <- c(0.57, 0.85) # Analysis
  pos[8, ]  <- c(0.1, 0.60) # Random allocation
  pos[13, ] <- c(0.33, 0.85) # Blocking
  pos[14, ] <- c(0.8, 0.75) # Restrictions
  
  pos[9, ]  <- c(0.8, 0.60) # Blind individuals
  pos[10, ] <- c(0.8, 0.45) # Objective outcomes
  pos[15, ] <- c(0.8, 0.30) # Controls
  pos[11, ] <- c(0.8, 0.15) # Blind researchers
  pos[12, ] <- c(0.8, 0.00) # Washout
  
  
  
  # Confounding, to...
  extendArrowStartx <- c(0.07, 0) # Move the arrow start out a bit, closer to edge of the box
  if (addIcons){
    extendArrowStartxTopRow <- c(0.07, 0) # Move the arrow start out a bit, closer to edge of the box
  } else {
    extendArrowStartxTopRow <- c(0, 0) # Move the arrow start out a bit, closer to edge of the box
  }
  curvedarrow(from = pos[1, ] + extendArrowStartxTopRow, # Confounding
              to = pos[13, ],  # Blocking 
              curve = 0,
              arr.pos = 0.55,
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[1, ] + extendArrowStartx, # Confounding
              to = pos[14, ],   # Restriction 
              curve = 0, 
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[1, ] + extendArrowStartxTopRow, # Confounding 
              to = pos[7, ],   # Analysis
              curve = 0, 
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[5, ] + extendArrowStartx, # Carryover
              to = pos[12, ],   # Washout
              curve = 0, 
              arr.pos = 0.525,
              lty = 1,  
              lwd = 2)
  
  ### ONLY FOR EXPERIMENTAL
  delta <- 0.015
  curvedarrow(from = pos[1, ] + extendArrowStartx, # Confounding
              to = pos[8, ],   # Random allocation
              curve = 0,
              arr.pos = 0.525,
              lty =  1, 
              lwd = 2 ) 
  text( x = mean( pos[c(1, 8), 1]) - delta,
        y = mean( pos[c(1, 8), 2]),
        "True\nexperiments",
        cex = 0.90,
        pos = 3)
  text( x = mean( pos[c(1, 8), 1]) - delta,
        y = mean( pos[c(1, 8), 2]),
        "only",
        cex = 0.90,
        pos = 1)
  
  
  
  curvedarrow(from = pos[2, ] + extendArrowStartx, # Hawthorne 
              to = pos[9, ] - extendArrowStartx,   # Blind individuals
              curve = 0, 
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[3, ] + extendArrowStartx, # Placebo
              to = pos[9, ] - extendArrowStartx,  # Blind individuals
              curve = 0, 
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[3, ] + extendArrowStartx, # Placebo
              to = pos[11, ] - extendArrowStartx,  # Blind researchers
              curve = 0, 
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[3, ] + extendArrowStartx, # Placebo
              to = pos[10, ],  # Controls
              curve = 0, 
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[3, ] + extendArrowStartx, # Placebo
              to = pos[15, ] - extendArrowStartx,  # Controls
              curve = 0, 
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[4, ] + extendArrowStartx, # Observer effect
              to = pos[11, ],  # Blind researchers
              curve = 0, 
              lty = 1, 
              lwd = 2)
  
  ### TEXT
  textrect( pos[1, ], 
            lab = "Confounding", 
            radx = 0.10, 
            rady = 0.055, 
            adj = ifelse(addIcons, 0.6, 0.5),
            shadow.size = 0,
            box.col = DesignColour,
            lcol = DesignColour)
  textrect( pos[2, ], 
            lab = "Hawthorne\n effect", 
            radx = 0.10, 
            rady = 0.055, 
            adj = ifelse(addIcons, 0.6, 0.5),
            shadow.size = 0,
            box.col = DesignColour,
            lcol = DesignColour)
  textrect( pos[3, ], 
            lab = "Placebo\neffect", 
            radx = 0.10, 
            rady = 0.055, 
            adj = ifelse(addIcons, 0.6, 0.5),
            shadow.size = 0,
            box.col = DesignColour,
            lcol = "black",
            lwd = 2) # As experimental only
  textrect( pos[4, ], 
            lab = "Observer\neffect", 
            radx = 0.10, 
            rady = 0.055, 
            adj = ifelse(addIcons, 0.6, 0.5),
            shadow.size = 0,
            box.col = DesignColour,
            lcol = DesignColour)
  textrect( pos[5, ], 
            lab = "Carryover\neffect", 
            radx = 0.10, 
            rady = 0.055, 
            adj = ifelse(addIcons, 0.6, 0.5),
            shadow.size = 0,
            box.col = DesignColour,
            lcol = DesignColour)
  
  
  
  textrect( pos[7, ], 
            lab = c("Analysis"), 
            radx = 0.08, 
            rady = 0.055, 
            shadow.size = 0,
            box.col = GroupColour,
            lcol = GroupColour)
  textrect( pos[8, ], 
            lab = "Random\nallocation of\nindividuals to\ncomparison\ngroups", 
            radx = 0.09, 
            rady = 0.15, 
            shadow.size = 0,
            col = ifelse( studyType =="Experiment", "black", "grey"), # TEXT COLOUR
            box.col = ifelse(studyType == "Experiment", GroupColour, "white"), # BOX FILL COLOUR
            lcol = ifelse(studyType == "Experiment", GroupColour, "grey") ) # LINES
  
  textrect( pos[13, ], 
            lab = "Blocking", 
            radx = 0.08, 
            rady = 0.055, 
            shadow.size = 0,
            box.col = GroupColour,
            lcol = GroupColour)
  textrect( pos[14, ], 
            lab = "Restrict", 
            radx = 0.08, 
            rady = 0.055, 
            shadow.size = 0,
            box.col = GroupColour,
            lcol = GroupColour)
  
  textrect( pos[9, ], 
            lab = "Blind\nindividuals",
            radx = 0.08, 
            rady = 0.055, 
            shadow.size = 0,
            box.col = GroupColour,
            lcol = GroupColour)
  textrect( pos[10, ], 
            lab = "Objective\noutcomes", 
            radx = 0.08, 
            rady = 0.055, 
            shadow.size = 0,
            box.col = GroupColour,
            lcol = GroupColour)
  textrect( pos[15, ], 
            lab = "Controls", 
            radx = 0.08, 
            rady = 0.055, 
            shadow.size = 0,
            box.col = GroupColour,
            lcol = GroupColour)
  textrect( pos[11, ], 
            lab = "Blind\nresearchers", 
            radx = 0.08, 
            rady = 0.055, 
            shadow.size = 0,
            box.col = GroupColour,
            lcol = GroupColour)
  textrect( pos[12, ], 
            lab = "Washout", 
            radx = 0.08, 
            rady = 0.055, 
            shadow.size = 0,
            col = ifelse( studyType =="Experiment", "black", "grey"), # TEXT COLOUR
            box.col = ifelse(studyType == "Experiment", GroupColour, "white"), # BOX FILL COLOUR
            lcol = ifelse(studyType == "Experiment", GroupColour, "grey") ) # LINES
  
  # Note placebo effect only for experiments
  delta2 <- 0.06
  text(x =  mean( pos[c(1, 8), 1]) + delta2,
       y = pos[3, 2],
       cex = 0.90,
       adj = 1,
       "Experiments\nonly:")
  
  # Add icons
  if (addIcons){
    plotfunctions::plot_image(
      img = "./Pics/iconmonstr-resize-4-240.png", # Confounding
      type = "png",
      keep.ratio = TRUE,
      yrange = c(0.71, 0.76),
      xrange = c(0.53, 0.56),
      bty = "n", # Removes box from around the plot 
      add = TRUE)
    
    plotfunctions::plot_image(
      img = "./Pics/iconmonstr-chart-21-240.png", # Carryover
      type = "png",
      keep.ratio = TRUE,
      yrange = c(0.07, 0.12),
      xrange = c(0.52, 0.56),
      bty = "n", # Removes box from around the plot 
      add = TRUE)
    
    plotfunctions::plot_image(
      img = "./Pics/iconmonstr-binoculars-8-240.png", # Hawthorne
      type = "png",
      keep.ratio = TRUE,
      yrange = c(0.55, 0.60),
      xrange = c(0.52, 0.56),
      bty = "n", # Removes box from around the plot 
      add = TRUE)
    plotfunctions::plot_image(
      img = "./Pics/iconmonstr-help-3-240.png", # Placebo
      type = "png",
      keep.ratio = TRUE,
      yrange = c(0.39, 0.44),
      xrange = c(0.52, 0.55),
      bty = "n", # Removes box from around the plot 
      add = TRUE)
    plotfunctions::plot_image( 
      img = "./Pics/iconmonstr-idea-10-240.png", # Observer
      type = "png",
      keep.ratio = TRUE,
      yrange = c(0.23, 0.28),
      xrange = c(0.52, 0.56),
      bty = "n", # Removes box from around the plot 
      add = TRUE)
  }
  #plotfunctions::plot_image(
  #                           img = "./Pics/iconmonstr-eye-6-240.png", # Observer
  #                           type = "png",
  #                           keep.ratio = TRUE,
  #                           yrange = c(0.08, 0.12),
  #                           xrange = c(0.52, 0.56),
  #                           bty = "n", # Removes box from around the plot 
  #                           add = TRUE)
  
}
