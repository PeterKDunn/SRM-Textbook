showProgressBar <- function(x, # x is a PERCENTAGE! 
                            barColour, 
                            boxColour,
                            showBox = TRUE,
                            lwd = 1,
                            xPlacement, # LEFT; RIGHT
                            yPlacement){ # TOP; BOTTOM
  
  
  
  
  # Preliminaries
  maxValue <-  100 # A percentage
  boxWidth  <- xPlacement[2] - xPlacement[1]
  boxHeight <- yPlacement[1] - yPlacement[2]
  
  barRight <- x/100 * boxWidth
  
  xBarPlacement <- c(xPlacement[1], 
                     xPlacement[1] + (x/100 * boxWidth)) # LEFT; RIGHT

  # Draw progress: Do first, then overlap with box if requested
  polygon(x = c(xBarPlacement, rev(xBarPlacement) ),
          y = c( yPlacement[1], yPlacement[1],
                 yPlacement[2], yPlacement[2]),
          col = barColour,
          border = NA)

  
  # Draw box (i.e., bar container)
  if (showBox){
    polygon(x = c(xPlacement, rev(xPlacement) ),
            y = c( yPlacement[1], yPlacement[1],
                   yPlacement[2], yPlacement[2]),
            lwd = lwd,
            col = NA,
            border = boxColour)
  }
}