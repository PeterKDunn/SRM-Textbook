showYInfluences <- function (showY = TRUE,
                             showX = TRUE,
                             showChance = TRUE,
                             showExtraneous = TRUE,
                             showDesign = TRUE,
                             showConfounding = FALSE,
                             showLurking = FALSE){
  par( mar = c(0.1, 0.1, 0.1, 0.1))
  diagram::openplotmat()
  
  pos <- array(NA, 
               dim = c(5, 2))
  pos[1, ] <- c(0.50, 0.5)   # Response
  pos[2, ] <- c(0.15, 0.5)   # Chance
  pos[3, ] <- c(0.50, 0.9)   # Extraneous
  pos[4, ] <- c(0.85, 0.5)   # Explanatory
  pos[5, ] <- c(0.50, 0.1)   # Design
  
  straightarrow(from = pos[2, ], # Chance
                to = pos[1, ],   # Response
                lty = 1, 
                lcol = "grey",
                lwd = 2)
  straightarrow(from = pos[3, ], # Extraneous 
                to = pos[1, ],   # Response
                lwd = ifelse( showConfounding, 2 , 2),
                lcol = ifelse( showConfounding, "black", "grey" ),
                lty = ifelse( showConfounding | showLurking, 2, 1) )
  arrowExplanatoryToResponseColour <- "black"
 
  if ( !showConfounding) {
  straightarrow(from = pos[4, ], # Explanatory
                to = pos[1, ],   # Response
                lwd = 2,
                lcol = ifelse(showConfounding, "grey", arrowExplanatoryToResponseColour),
                lty = 1)
  }
  if (showLurking) {
    text(x = 0.666,
         y = pos[4, 2],
         cex = 0.85,
         pos = 3,
         labels = "Spurious")
    text(x = 0.666,
         y = pos[4, 2],
         cex = 0.85,
         pos = 1,
         labels = "link")
  }
  if (showConfounding) {
    text(x = 0.666,
         y = pos[4, 2],
         cex = 0.85,
         pos = 3,
         labels = "No real")
    text(x = 0.666,
         y = pos[4, 2],
         cex = 0.85,
         pos = 1,
         labels = "link")
  }
  straightarrow(from = pos[5, ], # Design
                to = pos[1, ],   # Response
                lwd = 2,
                lcol = ifelse( showConfounding, "black", "grey" ),
                lty = 1)
  
    if (showConfounding | showLurking ) {
       straightarrow(from = pos[3, ], # Extraneous
                     to = pos[4, ],   # Explanatory
                     lwd = 2,
                     lcol = ifelse( showConfounding, "black", "grey" ),
                     lty = 2)
  }

  textrect( pos[4,], 
             lab = "Explanatory", 
             radx = 0.110, 
             rady = 0.075, 
             shadow.size = 0,
             box.col = ExplanatoryColour,
             lcol = ExplanatoryColour)
  textrect( pos[1,], 
             lab = "Response", 
             radx = 0.100, 
             rady = 0.075, 
             shadow.size = 0,
             box.col = ResponseColour,
             lcol = ResponseColour)
  
  textrect( pos[2,], 
            lab = "Chance",
            radx = 0.100,
            rady = 0.075,
            shadow.size = 0,
            lcol = ifelse(showChance, ChanceColour, "grey"),
            box.col = ifelse(showChance, ChanceColour, "white") )
  
  ExtraneousText <- "Extraneous"
  if (showConfounding ) ExtraneousText <- "Confounding"
  if (showLurking ) ExtraneousText <- "Lurking"
  
  textrect( pos[3,], 
            lab = ExtraneousText, 
            radx = 0.130,
            rady = 0.075,
            shadow.size = 0,
            lcol = ifelse(showExtraneous | showConfounding | showLurking, ExtraneousColour, "grey"),
            box.col = ifelse(showExtraneous | showConfounding | showLurking, ExtraneousColour, "white"),
            col = ifelse(showLurking, grey(0.4), "black"))
  
  textrect( pos[5,], 
            box.col = ifelse( showDesign, DesignColour, "white"),
            lcol = ifelse( showDesign, DesignColour, "grey"),
            shadow.size = 0,
            radx = 0.130,
            rady = 0.075,
            lab = "Design")
}