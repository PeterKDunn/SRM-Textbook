showPOCI <- function(addC = ifelse(addI, TRUE, FALSE), # Always have PO; add C?
                     addI = FALSE, # Always have PO; add I?
                     addX = FALSE, # Label "explanatory var" for the C
                     addY = FALSE, # Label "response var" for the O
                     Xname = "Explanatory\nvariable",
                     Yname = "Response\nvariable",
                     addArrows = FALSE,
                     addOCXYArrows = FALSE){
  
  # CANVAS
  par( mar = c(0.25, 0.25, 0.25, 0.25))
  diagram::openplotmat()
  
  
  # SETUP  
  pos <- array(NA, dim = c(6, 2))
  pos[1, ] <- c(0.20, 0.75) # P 
  pos[2, ] <- c(0.40, 0.75) # O
  pos[3, ] <- c(0.60, 0.75)   # C
  pos[4, ] <- c(0.80, 0.75)   # I
  pos[5, ] <- c(0.20, 0.25)   # Response
  pos[6, ] <- c(0.80, 0.25)   # Explanatory
  
  # Need to show arrows first, so that POCI overplot  
  if ( addOCXYArrows | (addArrows & (addX & addY) ) ) {
    diagram::straightarrow(from = pos[6, ], # From X to Y
                           to = pos[5, ], 
                           #segment = c(0.4, 0.6),
                           lty = 1, 
                           lwd = 2)
  }
  if (addArrows & addI) {
    diagram::straightarrow(from = pos[3, ],  # From C to I
                           to = pos[4, ], 
                           lcol = "grey",
                           #segment = c(0.25, 0.75), 
                           lty = 2)
  }
  if (addOCXYArrows | (addArrows & addY) ) {
    diagram::straightarrow(from = pos[2, ], # From O to response
                           to = pos[5, ], 
                           lcol = "grey",
                           #segment = c(0.25, 0.75),
                           lty = 2)
  }
  if (addArrows & addC & !addI) {
    diagram::straightarrow(from = pos[3, ], # From C to explanatory
                           to = pos[6, ], 
                           lcol = "grey",
                           #segment = c(0.25, 0.75),
                           lty = 2)
  }
  if (addArrows & addI & addX) {
    diagram::curvedarrow(from = pos[4, ], # From I to Explanatory
                         to = pos[6, ], 
                         lcol = "grey",
                         curve = -0.38,
                         #segment = c(0.25, 0.75),
                         lty = 2)
  }
  if (addOCXYArrows){
    diagram::straightarrow(from = pos[3, ], # From C to Explanatory
                           to = pos[6, ], 
                           lcol = "grey",
                           #segment = c(0.25, 0.75),
                           lty = 2)
  }
  
  diagram::textrect( pos[1, ], 
                     lab = "P",
                     radx = 0.025,
                     rady = 0.075,
                     shadow.size = 0,
                     lcol = "white",
                     box.col = "white",
                     cex = 2)
  diagram::textrect( pos[2, ], 
                     lab = "O", 
                     radx = 0.025,
                     rady = 0.075,
                     shadow.size = 0,
                     lcol = "white",
                     box.col = "white",
                     cex = 2)
  if (addC) {
    diagram::textrect( pos[3, ], 
                       box.col = "white",
                       lcol = "white",
                       shadow.size = 0,
                       radx = 0.02,
                       rady = 0.075,
                       lab = "C",
                       cex = 2)
  } else {
    textplain( pos[3, ], 
               lab = "C", 
               col = "grey",
               cex = 2)
  }
  if (addI) {
    diagram::textrect( pos[4, ], 
                       box.col = "white",
                       lcol = "white",
                       shadow.size = 0,
                       radx = 0.02,
                       rady = 0.075,
                       lab = "I",
                       cex = 2)
  } else {
    diagram::textplain( pos[4, ], 
                        lab = "I", 
                        col = "grey",
                        cex = 2)
  }
  if (addX){
    diagram::textrect( pos[6, ], 
                       lab = Xname, 
                       radx = 0.10, 
                       rady = 0.15, 
                       shadow.size = 0,
                       box.col = ExplanatoryColour,
                       lcol = ExplanatoryColour)
  }
  if (addY){
    diagram::textrect( pos[5, ], 
                       lab = Yname, 
                       radx = 0.10, 
                       rady = 0.15, 
                       shadow.size = 0,
                       box.col = IndividualColour,
                       lcol = IndividualColour)
  }
}
