showYInfluences <- function (showY = TRUE,
                             showX = TRUE,
                             showBasic = FALSE,
                             showChance = TRUE,
                             showExtraneous = TRUE,
                             showConfounding = FALSE,
                             partition = NA,  # PARTITION something like c(3, 5, 2); i.e., *relative* widths
                             showLurking = FALSE){
  
  leftEdge <- 0
  lowerEdge <- 0.15
  
  boxHeight <- 0.16
  boxWidth <- 0.225
  responseWidth <- 0.30
  
  if (showConfounding | showLurking ){
    # Make some changes in these cases, as these are placed two beside each other
    leftEdge <- 0.35
    lowerEdge <- 0.30
    responseWidth <- 0.15
    boxWidth <- 0.20
  }

  par( mar = c(0.1, 0.1, 0.1, 0.1))
  #diagram::openplotmat()
  shape::emptyplot( xlim = c(leftEdge, 1),
                    ylim = c(lowerEdge, 1),
                    asp = NA)

  if (showBasic){
    showChance <- FALSE
    showExtraneous <- FALSE
    showLurking <- FALSE
    showConfounding <- FALSE
    partition <- NA
    showX <- TRUE
    showY <- TRUE
  }
  if (showConfounding){
    showChance <- FALSE
    showExtraneous <- TRUE
    showLurking <- FALSE
    showConfounding <- TRUE
    partition <- NA
    showX <- TRUE
    showY <- TRUE
  }
  if (showLurking){
    showChance <- FALSE
    showExtraneous <- FALSE
    showLurking <- TRUE
    showConfounding <- FALSE
    partition <- NA
    showX <- TRUE
    showY <- TRUE
  }
  
  
  if ( !all(is.na( partition) ) ){
    partition <- responseWidth * c(0, cumsum(partition) / sum(partition) )
    partition <- (1 - responseWidth)/2 + partition
  }
  pos <- array(NA, 
               dim = c(5, 2))
  pos[1, ] <- c(0.50, 0.5)   # Response
  pos[2, ] <- c(0.15, 0.5)   # Chance
  pos[3, ] <- c(0.50, 0.9)   # Extraneous
  pos[4, ] <- c(0.85, 0.5)   # Explanatory
  
  if (showChance) {
    straightarrow(from = pos[2, ], # Chance
                  to = pos[1, ],   # Response
                  lty = 1, 
                  lcol = "grey",
                  lwd = 2)
  }
  if ( !showBasic ) {
    straightarrow(from = pos[3, ], # Extraneous 
                  to = pos[1, ],   # Response
                  lwd = ifelse( showConfounding, 2 , 2),
                  lcol = ifelse( showConfounding, "black", "grey" ),
                  lty = ifelse( showLurking, 2, 1) )
  }
  
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
         labels = "Apparent")
    text(x = 0.666,
         y = pos[4, 2],
         cex = 0.85,
         pos = 1,
         labels = "link")
  }
  if (showConfounding) {
    text(x = 0.666,
         y = pos[4, 2] - 0.02,
         cex = 0.85,
         pos = 3,
         labels = "No real")
    text(x = 0.666,
         y = pos[4, 2] + 0.02,
         cex = 0.85,
         pos = 1,
         labels = "link")
  }
  
  if (showConfounding | showLurking ) {
    bentarrow(from = pos[3, ], # Extraneous
                  to = pos[4, ],   # Explanatory
                  lwd = 2,
                  lcol = ifelse( showConfounding, "black", "grey" ),
                  lty = ifelse( showLurking, 2, 1) )
  }
  
  textrect( pos[4,], 
            lab = "Explanatory", 
            radx = boxWidth/2, 
            rady = boxHeight/2, 
            shadow.size = 0,
            box.col = ExplanatoryColour,
            lcol = ExplanatoryColour)
  if ( !all(is.na( partition) ) ) {
    if (showChance) {
    polygon( x = c( partition[1] ,
                    partition[1] ,
                    partition[2] ,
                    partition[2] ),
             y = c( pos[1, 2] - boxHeight/2,
                    pos[1, 2] + boxHeight/2,
                    pos[1, 2] + boxHeight/2,
                    pos[1, 2] - boxHeight/2),
             border = "grey",
             col = ChanceColour )
    }
    polygon( x = c( partition[2],
                    partition[2],
                    partition[3],
                    partition[3] ),
             y = c( pos[1, 2] - boxHeight/2,
                    pos[1, 2] + boxHeight/2,
                    pos[1, 2] + boxHeight/2,
                    pos[1, 2] - boxHeight/2),
             border = "grey",
             col = ExtraneousColour )
    polygon( x = c( partition[3],
                    partition[3],
                    partition[4],
                    partition[4]),
             y = c( pos[1, 2] - boxHeight/2,
                    pos[1, 2] + boxHeight/2,
                    pos[1, 2] + boxHeight/2,
                    pos[1, 2] - boxHeight/2),
             border = "grey",
             col = ExplanatoryColour )
    # Outside, black border
    polygon(x = c( partition[1],
                   partition[1],
                   partition[4],
                   partition[4]), 
            y = c( pos[1, 2] - boxHeight/2,
                   pos[1, 2] + boxHeight/2,
                   pos[1, 2] + boxHeight/2,
                   pos[1, 2] - boxHeight/2),
            border = "black",
            col = NA) # Unfilled
    text(x = 0.5,
         y = pos[1, 2],
         "Response  variable")
    text(x = pos[1, 1],
         y = pos[1, 2] - 0.25,
         "Total amount of variation in the reponse variable\ncomes from different sources")
    arrows(x0 = 0.5 - responseWidth/2,
           x1 = 0.5 + responseWidth/2,
           y0 = pos[1, 2] - 0.15,
           y1 = pos[1, 2] - 0.15,
           code = 3, # Both ends
           length = 0.1,
           angle = 15)
  }  else {
    textrect( pos[1,], 
              lab = "Response", 
              radx = responseWidth/2, 
              rady = boxHeight/2, 
              shadow.size = 0,
              box.col = ResponseColour,
              lcol = ResponseColour)
  }
         
  if (!showBasic) {
    if (showChance) {
      textrect( pos[2,], 
                lab = "Chance",
                radx = boxWidth/2,
                rady = boxHeight/2,
                shadow.size = 0,
                lcol = ChanceColour,
                box.col = ChanceColour )
    }
    
    ExtraneousText <- "Extraneous"
    if (showConfounding ) ExtraneousText <- "Confounding"
    if (showLurking ) ExtraneousText <- "Lurking"
    
    textrect( pos[3,], 
              lab = ExtraneousText, 
              radx = boxWidth/2,
              rady = boxHeight/2,
              shadow.size = 0,
              lcol = ExtraneousColour,
              box.col = ExtraneousColour,
              col = ifelse(showLurking, grey(0.4), "black"))
  }
}