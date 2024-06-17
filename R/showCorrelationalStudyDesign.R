showCorrelationalStudyDesign <- function(intervention = FALSE,
                                     explanatoryName = NA,
                                     responseName = NA,
                                     individualNames = NA,
                                     interventionName = NA,
                                     outcomeName = NA) {
  
  ### Makes a study design diagram for a repeated measures design  
  ### Works for two groups/treatments; most things should work with three
  
  
  ### CANVAS
  par( mar = c(0, 0, 0, 0))
  useDefaultCanvas <- TRUE
  xLimLo <- 0
  xLimHi <- 1
  
  
  # Canvas
  diagram::openplotmat( ylim = c(0.05, 0.9) )
  
  
  # STATE NAMES
  if ( is.na(explanatoryName[1]) ){
    explanatoryName <- "Explanatory variable"
  } 
  if ( is.na(responseName[1]) ){
    responseName <- "Response variable"
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
  
  
  ### RELATIONSHIP ARROW
  # Need "thick" arrow
  # First, draw the arrow shaft:
  diagram::textrect(mid = c(0.45, 0.3), 
                    radx = 0.15,
                    rady = 0.03,
                    shadow.size = 0,
                    lab = "",
                    box.col = grey(0.85),
                    lcol = grey(0.85))
  # Second, draw the arrow head
  diagram::textmulti(mid = c(0.6, 0.3),
                     radx = 0.0475,
                     rady = 0.08,
                     nr = 3, # THAT IS, A TRIANGLE
                     angle = 0, # ROTATION DEGREES
                     shadow.size = 0,
                     lab = "",
                     box.col = grey(0.85),
                     lcol = grey(0.85))
  text(x = 0.5,
       y = 0.2,
       font = 2, # BOLD
       label = "Relationship")
  
  
  
  ### ARROWS Variables to 'individuals'
  if (intervention) {
    diagram::straightarrow(from = c(0.25, 0.3), # From X to IND
                           to = c(0.5, 0.7), 
                           #segment = c(0.4, 0.6),
                           lty = ifelse(intervention, 1, 2), 
                           lwd = 2)
    text(x = 0.35,
         y = 0.5,
         labels = "By researchers",
         col = "grey",
         srt = 0,
         cex = 1.65)

  } else {
    diagram::straightarrow(from = c(0.5, 0.7), # From X to IND
                           to = c(0.25, 0.3), 
                           #segment = c(0.4, 0.6),
                           lty = ifelse(intervention, 1, 2), 
                           lwd = 2)
  }
  diagram::straightarrow(from = c(0.5, 0.7), # From X to IND
                         to = c(0.75, 0.3), 
                         #segment = c(0.4, 0.6),
                         lty = 2, 
                         lwd = 2)
  
  
  ### INDIVIDUALS boxes
  diagram::textrect( mid = c(0.5, 0.7),
                     radx = 0.30,
                     rady = 0.1,
                     box.col = IndividualColour,
                     lcol = IndividualColour,
                     shadow.size = 0,
                     lab = individualNames)
  

  ### VARS
  diagram::textrect( mid = c(0.2, 0.3),
                     radx = 0.15,
                     rady = 0.1,
                     box.col = ExplanatoryColour,
                     lcol = ExplanatoryColour,
                     shadow.size = 0,
                     lab = explanatoryName)
  if ( tolower(explanatoryName) != tolower("Explanatory variable") ) {
    text( x = 0.2, 
          y = 0.1,
          cex = 0.9,
          labels = "(Explanatory variable)")
  }
  
  diagram::textrect( mid = c(0.8, 0.3),
                     radx = 0.15,
                     rady = 0.1,
                     box.col = ResponseColour,
                     lcol = ResponseColour,
                     shadow.size = 0,
                     lab = responseName)
  if ( tolower(responseName) != tolower("Response variable") ) {
    text( x = 0.8, 
          y = 0.1,
          cex = 0.9,
          labels = "(Response variable)")
  }
  
  
}

