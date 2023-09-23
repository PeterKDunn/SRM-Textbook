showDesignConsiderations <- function(studyType = "Experiment"){
  
  par( mar = c(0.5, 0.5, 0.5, 0.5))
  openplotmat()
  
  pos <- array(NA, dim = c(14, 2))
  
  # Problems
  pos[1, ] <- c(0.45, 0.84) # Confounding
  pos[2, ] <- c(0.45, 0.58) # Hawthorne
  pos[3, ] <- c(0.45, 0.42) # Placebo
  pos[4, ] <- c(0.45, 0.26) # Observer
  pos[5, ] <- c(0.45, 0.10) # Carry-over
  
  # Solutions
  pos[7, ] <- c(0.8, 0.74) # Extraneous vars/Analysis
  pos[8, ] <- c(0.8, 0.90) # Random allocation
  pos[13, ] <- c(0.1, 0.90) # Blocking
  pos[14, ] <- c(0.1, 0.74) # Restrictions
  
  pos[9, ] <- c(0.8, 0.58) # Blind individuals
  pos[10, ] <- c(0.8, 0.42) # Objective outcomes
  pos[11, ] <- c(0.8, 0.26) # Blind researchers
  pos[12, ] <- c(0.8, 0.10) # Washout
  
  
  
  # Confounding, to...
  extendArrowStart <- c(0.07, 0) # Move the arrow start out a bit, closer to edge of the box
  curvedarrow(from = pos[1, ] - extendArrowStart, # Confounding
              to = pos[13, ],  # Blocking 
              curve = 0, 
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[1, ] - extendArrowStart, # Confounding
              to = pos[14, ],   # Restriction 
              curve = 0, 
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[1, ] + extendArrowStart, # Confounding 
              to = pos[7, ],   # Analysis
              curve = 0, 
              lty = 1, 
              lwd = 2)
  if (studyType == "Experiment") {# No line for confounding to random allocation for observational 
    curvedarrow(from = pos[1, ] + extendArrowStart, # Confounding
                to = pos[8, ],   # Random allocation
                curve = 0, 
                lty =  1, 
                lwd = 2 ) 
  }
  if (studyType == "Experiment") {# No line for carryover to washout when Obs
    curvedarrow(from = pos[5, ] + extendArrowStart, # Carryover
                to = pos[12, ],   # Washout
                curve = 0, 
                lty = 1, # lty = 2 indicates "not at random" 
                lwd = 2)
  }
  curvedarrow(from = pos[2, ] + extendArrowStart, # Hawthorne 
              to = pos[9, ],   # Blind individuals
              curve = 0, 
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[3, ] + extendArrowStart, # Placebo
              to = pos[9, ] - extendArrowStart/2,  # Blind individuals
              curve = 0, 
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[3, ] + extendArrowStart, # Placebo
              to = pos[11, ] - extendArrowStart/2,  # Blind researchers
              curve = 0, 
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[3, ] + extendArrowStart, # Placebo
              to = pos[10, ],  # Controls
              curve = 0, 
              lty = 1, 
              lwd = 2)
  curvedarrow(from = pos[4, ] + extendArrowStart, # Observer effect
              to = pos[11, ],  # Blind researchers
              curve = 0, 
              lty = 1, 
              lwd = 2)
  
  # text(x = mean( c(pos[5, 1], pos[12, 1])) + 0.02,
  #      y = c( pos[5, 2], pos[12, 2]),
  #      labels = "Can be\nrandomly",
  #      cex = 0.9,
  #      pos = 3)
  # text(x = mean( c(pos[5, 1], pos[12, 1])) + 0.025,
  #      y = c( pos[5, 2], pos[12, 2]),
  #      labels = "allocated",
  #      cex = 0.9,
  #      pos = 1)
  # 
  # text(x = mean( c(pos[4, 1], pos[11, 1])) + 0.02,
  #      y = c( pos[4, 2], pos[4, 2]),
  #      labels = "Not randomly",
  #      cex = 0.9,
  #      pos = 3)
  # text(x = mean( c(pos[4, 1], pos[11, 1])) + 0.025,
  #      y = c( pos[4, 2], pos[4, 2]),
  #      labels = "allocated",
  #      cex = 0.9,
  #      pos = 1)
  
  
  ### TEXT
  textrect( pos[1, ], 
            lab = "Confounding", 
            radx = 0.12, 
            rady = 0.050, 
            adj = 0.6,
            shadow.size = 0,
            box.col = ExtraneousColour,
            lcol = ExtraneousColour)
  textrect( pos[2, ], 
            lab = "Hawthorne\n effect", 
            radx = 0.12, 
            rady = 0.050, 
            adj = 0.6,
            shadow.size = 0,
            box.col = ExtraneousColour,
            lcol = ExtraneousColour)
  textrect( pos[3, ], 
            lab = "Placebo\neffect", 
            radx = 0.12, 
            rady = 0.050, 
            adj = 0.6,
            shadow.size = 0,
            box.col = ExtraneousColour,
            lcol = ExtraneousColour)
  textrect( pos[4, ], 
            lab = "Observer\neffect", 
            radx = 0.12, 
            rady = 0.050, 
            adj = 0.6,
            shadow.size = 0,
            box.col = ExtraneousColour,
            lcol = ExtraneousColour)
  textrect( pos[5, ], 
            lab = "Carry-over\neffect", 
            radx = 0.12, 
            rady = 0.050, 
            adj = 0.6,
            shadow.size = 0,
            box.col = ExtraneousColour,
            lcol = ExtraneousColour)
  #textrect( pos[6, ], 
  #           lab = c("Observer",
  #                   "bias"), 
  #           radx = 0.12, 
  #           rady = 0.050, 
  #           shadow.size = 0,
  #           box.col = "lightsteelblue3",
  #           lcol = "lightsteelblue3")
  
  
  
  textrect( pos[7, ], 
            lab = c("Analysis"), 
            radx = 0.08, 
            rady = 0.050, 
            shadow.size = 0,
            box.col = DesignColour,
            lcol = DesignColour)
  textrect( pos[8, ], 
            lab = "Random\nallocation", 
            radx = 0.08, 
            rady = 0.050, 
            shadow.size = 0,
            col = ifelse( studyType =="Experiment", "black", "grey"), # TEXT COLOUR
            box.col = ifelse(studyType == "Experiment", DesignColour, "white"), # BOX FILL COLOUR
            lcol = ifelse(studyType == "Experiment", DesignColour, "grey") ) # LINES
  
  textrect( pos[13, ], 
            lab = "Blocking", 
            radx = 0.08, 
            rady = 0.050, 
            shadow.size = 0,
            box.col = DesignColour,
            lcol = DesignColour)
  textrect( pos[14, ], 
            lab = "Restrict", 
            radx = 0.08, 
            rady = 0.050, 
            shadow.size = 0,
            box.col = DesignColour,
            lcol = DesignColour)
  
  textrect( pos[9, ], 
            lab = "Blind\nindividuals",
            radx = 0.08, 
            rady = 0.050, 
            shadow.size = 0,
            box.col = DesignColour,
            lcol = DesignColour)
  textrect( pos[10, ], 
            lab = "Objective\noutcomes", 
            radx = 0.08, 
            rady = 0.050, 
            shadow.size = 0,
            box.col = DesignColour,
            lcol = DesignColour)
  textrect( pos[11, ], 
            lab = "Blind\nresearchers", 
            radx = 0.08, 
            rady = 0.050, 
            shadow.size = 0,
            box.col = DesignColour,
            lcol = DesignColour)
  textrect( pos[12, ], 
            lab = "Washout", 
            radx = 0.08, 
            rady = 0.050, 
            shadow.size = 0,
            col = ifelse( studyType =="Experiment", "black", "grey"), # TEXT COLOUR
            box.col = ifelse(studyType == "Experiment", DesignColour, "white"), # BOX FILL COLOUR
            lcol = ifelse(studyType == "Experiment", DesignColour, "grey") ) # LINES
  
  
  # Add icons
  plotfunctions::plot_image(
    img = "./Pics/iconmonstr-resize-4-240.png", # Confounding
    type = "png",
    keep.ratio = TRUE,
    yrange = c(0.81, 0.86),
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
  #plotfunctions::plot_image(
  #                           img = "./Pics/iconmonstr-eye-6-240.png", # Observer
  #                           type = "png",
  #                           keep.ratio = TRUE,
  #                           yrange = c(0.08, 0.12),
  #                           xrange = c(0.52, 0.56),
  #                           bty = "n", # Removes box from around the plot 
  #                           add = TRUE)
  
}
