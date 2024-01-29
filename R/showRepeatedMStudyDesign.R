showRepeatedMStudyDesign <- function(intervention = FALSE,
                                     numStates = 2,
                                     stateNames = NA,
                                     individualNames = NA,
                                     interventionName = NA,
                                     outcomeName = NA) {
  
  ### Makes a study design diagram for a repeated measures design  
  ### Works for two groups/treatments; most things should work with three
  
  
  ### CANVAS
  par( mar = c(0.015, 0.015, 0.015, 0.015))
  useDefaultCanvas <- TRUE
  xLimLo <- 0
  xLimHi <- 1
  
  
  # Canvas
  diagram::openplotmat()
  
  
  # OUTCOME NAMES
  if ( is.na(outcomeName) ){
    outcomeName <- "Outcome"
  } 

  
  # STATE NAMES
  if ( is.na(stateNames[1]) ){
    stateNames <- paste("State", 1:numStates)
  } 
  
  # INDIVIDUAL NAMES
  # Does nothing at the moment!
  if ( is.na(individualNames) ){
    individualNames <- "Individuals"
  } 
  
  # INTERVENTION NAMES
  if ( is.na(interventionName) ){
    if (intervention) interventionName <- "Intervention"
  } 
  
  ### COMPARISON ARROW
  # Need "thick" arrow
  # First, draw the arrow shaft:
  diagram::textrect(mid = c(0.4, 0.7), 
                    radx = 0.3,
                    rady = 0.03,
                    shadow.size = 0,
                    lab = "",
                    box.col = grey(0.85),
                    lcol = grey(0.85))
  # Second, draw the arrow head
  diagram::textmulti(mid = c(0.725, 0.7),
                     radx = 0.0475,
                     rady = 0.08,
                     nr = 3, # THAT IS, A TRIANGLE
                     angle = 0, # ROTATION DEGREES
                     shadow.size = 0,
                     lab = "",
                     box.col = grey(0.85),
                     lcol = grey(0.85))
  
  
  ### COMPARE text
  text(x = 0.85,
       y = 0.7,
       cex = 1.05,
       font = 2, # BOLD
       label = paste("Compare\n", outcomeName) )
  
  
  ### ARROWS States to 'individuals'
  arrows(x0 = 0.25, 
         x1 = 0.25,
         y0 = 0.7,
         y1 = 0.45,
         angle = 15,
         length = 0.1,
         lwd = 2)
  arrows(x0 = 0.55, 
         x1 = 0.55,
         y0 = 0.7,
         y1 = 0.45,
         angle = 15,
         length = 0.1,
         lwd = 2)
  
  ### INDIVIDUALS boxes
  polygon( x = c(0.1, 0.375, 0.375, 0.1),
           y = c(0.45, 0.45, 0.25, 0.25),
           lwd = 4,
           col = IndividualColour,
           border = IndividualColour)
  
  polygon( x = c(0.425, 0.7, 0.7, 0.425),
           y = c(0.45, 0.45, 0.25, 0.25),
           lwd = 4,
           col = IndividualColour,
           border = IndividualColour)
  
  polygon( x = c(0.375, 0.425, 0.425, 0.375),
           y = c(0.45, 0.45, 0.25, 0.25),
           lwd = 4,
           col = makeTransparent(IndividualColour),
           border = IndividualColour)

  ### STATES
  diagram::textrect( mid = c(0.25, 0.7),
                     radx = 0.10,
                     rady = 0.07,
                     box.col = ExplanatoryColour,
                     lcol = ExplanatoryColour,
                     shadow.size = 0,
                     lab = stateNames[1])
  diagram::textrect( mid = c(0.55, 0.7),
                     radx = 0.10,
                     rady = 0.07,
                     box.col = ExplanatoryColour,
                     lcol = ExplanatoryColour,
                     shadow.size = 0,
                     lab = stateNames[2])
  
  ### ADD intervention
  if (intervention) {
    arrows(x0 = 0.4,
           x1 = 0.4,
           y0 = 0.08,
           y1 = 0.325,
           angle = 17,
           length = 0.1,
           lwd = 2)
    text(x = 0.4,
         y = 0.175,
         labels = "By researchers",
         col = "grey",
         srt = 0,
         cex = 1.65)
    text(x = 0.4,
         y = 0.05,
         labels = interventionName)
    
   # segments(x0 = 0.4,
  #         x1 = 0.4,
   #        y0 = 0.15,
  #         y1 = 0.5,
   #        angle = 15,
    #       lty = 2, 
     #      col = "grey",
    #       length = 0.1,
    #       lwd = 2)
    # segments(x0 = 0.4,
    #          x1 = 0.4,
    #          y0 = 0.07, 
    #          y1 = 0.2,
    #          col = "grey",
    #          lty = 2,
    #          lwd = 2)
  }
  if ( !is.na(interventionName)) {
    text(x = 0.4,
         y = 0.05,
         labels = interventionName)
  }
  
  ### INDIVIDUALS text
  text(x = 0.4,
       y = 0.35,
       #font = 2,
       labels = "I   n   d   i   v   i   d   u   a   l   s  ")
  
}

