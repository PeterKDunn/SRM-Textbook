showCorrelationalStudyDesign <- function(intervention = FALSE,
                                     explanatoryName = NA,
                                     responseName = NA,
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
  diagram::textrect( mid = c(0.25, 0.3),
                     radx = 0.15,
                     rady = 0.1,
                     box.col = ExplanatoryColour,
                     lcol = ExplanatoryColour,
                     shadow.size = 0,
                     lab = explanatoryName)
  diagram::textrect( mid = c(0.75, 0.3),
                     radx = 0.15,
                     rady = 0.1,
                     box.col = ResponseColour,
                     lcol = ResponseColour,
                     shadow.size = 0,
                     lab = responseName)
  
}

