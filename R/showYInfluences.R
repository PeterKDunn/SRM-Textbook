showYInfluences <- function (showY = TRUE,
                             showX = TRUE,
                             showChance = TRUE,
                             showExtraneous = TRUE,
                             showDesign = TRUE,
                             showConfounding = FALSE,
                             showLurking = FALSE){
  par( mar = c(0.5, 0.5, 0.5, 0.5))
  openplotmat()
  
  pos <- array(NA, 
               dim = c(5, 2))
  pos[1, ] <- c(0.50, 0.5)   # Response
  pos[2, ] <- c(0.15, 0.5)   # Chance
  pos[3, ] <- c(0.50, 0.9)   # Extraneous
  pos[4, ] <- c(0.85, 0.5)   # Explanatory
  pos[5, ] <- c(0.50, 0.1)   # Design
  
  straightarrow(from = pos[2, ], # Chance
                to = pos[1, ],   # Response
                lty = 3, 
                lcol = "black",
                lwd = 2)
  straightarrow(from = pos[3, ], # Extranous 
                to = pos[1, ],   # Response
                lwd = 2,
                lcol = "black",
                lty = 3)
  straightarrow(from = pos[4, ], # Explanatory
                to = pos[1, ],   # Response
                lwd = 2,
                lcol = "black",
                lty = 1)
  straightarrow(from = pos[5, ], # Design
                to = pos[1, ],   # Response
                lwd = 2,
                lcol = "black",
                lty = 3)
  
  if (showConfounding | showLurking ) {
    straightarrow(from = pos[3, ], # Extraneous
                  to = pos[4, ],   # Explanatory
                  lwd = 2,
                  lcol = "black",
                  lty = 3)
  }

  textrect( pos[4,], 
             lab = "Explanatory", 
             radx = 0.100, 
             rady = 0.075, 
             shadow.size = 0,
             box.col = "antiquewhite",
             lcol = "antiquewhite")
  textrect( pos[1,], 
             lab = "Response", 
             radx = 0.100, 
             rady = 0.075, 
             shadow.size = 0,
             box.col = "darkseagreen1",
             lcol = "darkseagreen1")
  
  textrect( pos[2,], 
            lab = "Chance",
            radx = 0.100,
            rady = 0.075,
            shadow.size = 0,
            lcol = ifelse(showChance, "palegoldenrod", "grey"),
            box.col = ifelse(showChance, "palegoldenrod", "white") )
  
  ExtraneousText <- "Extraneous"
  if (showConfounding ) ExtraneousText <- "Confounding"
  if (showLurking ) ExtraneousText <- "Lurking"
  
  textrect( pos[3,], 
            lab = ExtraneousText, 
            radx = 0.100,
            rady = 0.075,
            shadow.size = 0,
            lcol = ifelse(showExtraneous | showConfounding | showLurking, "palegoldenrod", "grey"),
            box.col = ifelse(showExtraneous | showConfounding | showLurking, "palegoldenrod", "white"),
            col = ifelse(showLurking, grey(0.4), "black"))
  
  textrect( pos[5,], 
            box.col = ifelse( showDesign, "mistyrose", "white"),
            lcol = ifelse( showDesign, "mistyrose", "grey"),
            shadow.size = 0,
            radx = 0.100,
            rady = 0.075,
            lab = "Design")
}