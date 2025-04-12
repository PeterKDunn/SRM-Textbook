showMakeDecisions <- function(arrowYes = TRUE, # Full arrow to YES: SUPPORTS ASSUMPTION
                              arrowNo = TRUE,  # Full arrow to NO: CONTRADICTS ASSUMPTION
                              expectationText ="Sample:\nExpectation",
                              observationText = "Sample:\nObservation",
                              assumptionText = "Population:\nAssumption") {
  par( mar = c(0.1, 0.1, 0.1, 0.1))
  openplotmat()
  
  pos <-   array(NA, 
                 dim = c(6, 2))
  pos[1, ] <-   c(0.10, 0.85) # Assumption
  pos[2, ] <-   c(0.42, 0.85) # Expectation
  pos[3, ] <-   c(0.42, 0.15) # Observation
  pos[4, ] <-   c(0.42, 0.50) # Consistency?
  pos[5, ] <-   c(0.80, 0.85) # YES
  pos[6, ] <-   c(0.80, 0.15) # NO
  
  straightarrow(from = pos[1, ], to = pos[2, ], 
                lty = 1, 
                lwd = 2)
  straightarrow(from = pos[4, ], to = pos[2, ], 
                lcol = "black",
                lty = 2,
                lwd = 2)
  straightarrow(from = pos[4, ], to = pos[3, ], 
                lcol = grey(0.4),
                arr.pos = 0.5, # Then cover with box
                lty = 2)
  curvedarrow(from = pos[4, ] + c(0, 0.065), to = pos[5, ], 
              lcol = ifelse(arrowYes, "black", grey(0.7)),
              curve = 0.35,
              arr.pos = 0.5, # Then cover with box
              lty = 2)
  curvedarrow(from = pos[4, ] - c(0, 0.065), to = pos[6, ] , 
              lcol = ifelse(arrowNo, "black", grey(0.7)),
              curve = -0.35,
              arr.pos = 0.5, # Then cover with box
              lty = 2)
  
  
  textrect( pos[4, ],
            radx = 0.11,
            rady = 0.1,
            shadow.size = 0,
            lcol = "snow2",
            box.col = "snow2",
            lab = "Compare:\nConsistency?",
            col = grey(0)) # CHECKMARK
  textrect( pos[5, ], 
            radx = 0.15,
            rady = 0.1,
            shadow.size = 0,
            lcol = "darkseagreen2",
            box.col = "darkseagreen2",
            lab = "Yes: supports\nassumption", 
            col = ifelse(arrowYes, "black", grey(0.7)) ) 
  textrect( pos[6, ], 
            radx = 0.11,
            rady = 0.1,
            shadow.size = 0,
            lcol = "darksalmon",
            box.col = "darksalmon",
            lab = "No: contradicts\nassumption", 
            col = ifelse(arrowNo, "black", grey(0.7)) )
  
  textrect( pos[1, ], 
            lab = assumptionText,
            radx = 0.11,
            rady = 0.1,
            shadow.size = 0,
            lcol = "slategray1",
            box.col = "slategray1",
            cex = 1)
  textrect( pos[2, ], 
            lab = expectationText, 
            radx = 0.11,
            rady = 0.1,
            shadow.size = 0,
            lcol = "slategray2",
            box.col = "slategray2",
            cex = 1)
  textrect( pos[3, ], 
            box.col = "slategray3",
            lcol = "slategray3",
            shadow.size = 0,
            radx = 0.11,
            rady = 0.1,
            lab = observationText,
            cex = 1)
}