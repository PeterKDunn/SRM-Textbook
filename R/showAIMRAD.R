showAIMRAD <- function(debug = FALSE){

  openplotmat(mar = c(0.10, 0.10, 0.10, 0.10))
#  shape::emptyplot(mar = c(0.05, 0.05, 0.05, 0.05),
#                   asp = NULL)
#  diagram::openplotmat()
  
  pos <- array(NA, 
               dim = c(13, 2))
  
  pos[6:11, 1] <- 0.20
  pos[6:11, 2] <- rev( seq(0.05, 0.70,
                           length = 6) )
  
  # pos[6, ] <- c(0.20, 0.80) ### PROCESS: RQ
  # pos[7, ] <- c(0.20, 0.65) ###          DESIGN
  # pos[8, ] <- c(0.20, 0.50) ###          COLLECTION
  # pos[9, ] <- c(0.20, 0.35) ###          DESCRIBE; SUMMARY
  # pos[10,] <- c(0.20, 0.20) ###          ANALYSIS
  # pos[11,] <- c(0.20, 0.05) ###          REPORT
  
  
  pos[1:5, 1] <- 0.70
  pos[1, 2] <- pos[6, 2]
  pos[2, 2] <- mean( pos[7:8, 2])
  pos[3, 2] <- pos[10, 2]
  pos[4, 2] <- pos[11, 2]
  pos[5, 2] <- pos[1, 2]
  
  
  # pos[1, ] <- c(0.70, 0.80) ### PAPER: INTRO
  # pos[2, ] <- c(0.70, 0.575) ###        METHODS
  # pos[3, ] <- c(0.70, 0.20) ###         RESULTS
  # pos[4, ] <- c(0.70, 0.05) ###         DISCUSSION
  # pos[5, ] <- c(0.70, 0.75) ###         ABSTRACT
  
  
  pos[12, ] <- c(0.70, 0.95) ### TITLE: PAPER
  pos[13, ] <- c(0.20, 0.95) ### TITLE: PROCESS
  
  # TITLES
  diagram::textrect( pos[12, ], 
                     lab = "PAPER", 
                     radx = 0.11, 
                     rady = 0.035, 
                     shadow.size = 0
                     #           box.col="lightcoral",
                     #           lcol="lightcoral"
  )
  diagram::textrect( pos[13, ], 
                     lab = "PROCESS", 
                     radx = 0.11, 
                     rady = 0.035, 
                     shadow.size = 0
                     #           box.col="lightcoral",
                     #           lcol="lightcoral"
  )
  
  
  # Link.
  arrowPosition <- 0.55
  diagram::curvedarrow(from = pos[6, ], 
                       to = pos[1, ], 
                       curve = 0, 
                       #            code=3,
                       arr.pos = arrowPosition,
                       lty = 1, 
                       lwd = 2)
  diagram::curvedarrow(from = pos[7, ], 
                       to = pos[2, ], 
                       curve = 0, 
                       #            code=3,
                       arr.pos = arrowPosition,
                       lty = 1, 
                       lwd = 2)
  diagram::curvedarrow(from = pos[8, ], 
                       to = pos[2, ], 
                       curve = 0, 
                       #            code=3,
                       arr.pos = arrowPosition,
                       lty = 1, 
                       lwd = 2)
  diagram::curvedarrow(from = pos[9, ], 
                       to = pos[3, ], 
                       curve = 0, 
                       #            code=3,
                       arr.pos = arrowPosition,
                       lty = 1, 
                       lwd = 2)
  diagram::curvedarrow(from = pos[10, ], 
                       to = pos[3, ], 
                       curve = 0, 
                       #            code=3,
                       arr.pos = arrowPosition,
                       lty = 1, 
                       lwd = 2)
  diagram::curvedarrow(from = pos[11, ], 
                       to = pos[3, ], 
                       curve = 0, 
                       #            code=3,
                       arr.pos = arrowPosition,
                       lty = 1, 
                       lwd = 2)
  
  
  ### TEXT
  diagram::textrect( pos[1, ],
                     lab = "Introduction",
                     radx = 0.11,
                     rady = 0.025,
                     shadow.size = 0,
                     box.col = "lightcoral",
                     lcol = "lightcoral")
  diagram::textrect( pos[2, ], 
                     lab = "Methods", 
                     radx = 0.11, 
                     rady = 0.035, 
                     shadow.size = 0,
                     box.col = "lightcoral",
                     lcol = "lightcoral")
  diagram::textrect( pos[3, ], 
                     lab = "Results", 
                     radx = 0.11, 
                     rady = 0.035, 
                     shadow.size=0,
                     box.col = "lightcoral",
                     lcol = "lightcoral")
  diagram::textrect( pos[4, ], 
                     lab = "Discussion", 
                     radx = 0.11, 
                     rady = 0.035, 
                     shadow.size = 0,
                     box.col = "lightcoral",
                     lcol = "lightcoral")
  # textrect( pos[5, ], 
  #            lab = "Discussion", 
  #            radx = 0.11, 
  #            rady = 0.035, 
  #            shadow.size = 0,
  #            box.col = plot.colour,
  #            lcol = plot.colour)
  
  
  
  diagram::textrect( pos[6, ], 
                     lab = "RQ", 
                     radx = 0.20, 
                     rady = 0.035, 
                     shadow.size = 0,
                     box.col = "darkseagreen1",
                     lcol = "darkseagreen1")
  diagram::textrect( pos[7, ], 
                     lab = "Study design", 
                     radx = 0.20, 
                     rady = 0.035, 
                     shadow.size = 0,
                     box.col = "darkseagreen1",
                     lcol = "darkseagreen1")
  diagram::textrect( pos[8, ], 
                     lab = "Data collection", 
                     radx = 0.20, 
                     rady = 0.035, 
                     shadow.size = 0,
                     box.col = "darkseagreen1",
                     lcol = "darkseagreen1")
  diagram::textrect( pos[9, ], 
                     lab = "Description, summary", 
                     radx = 0.20, 
                     rady = 0.035, 
                     shadow.size = 0,
                     box.col = "darkseagreen1",
                     lcol = "darkseagreen1")
  diagram::textrect( pos[10, ], 
                     lab = "Data analysis", 
                     radx = 0.20, 
                     rady = 0.035, 
                     shadow.size = 0,
                     box.col = "darkseagreen1",
                     lcol = "darkseagreen1")
  diagram::textrect( pos[11, ], 
                     lab = "Report results", 
                     radx = 0.20, 
                     rady = 0.035, 
                     shadow.size = 0,
                     box.col = "darkseagreen1",
                     lcol = "darkseagreen1")
  
  
  
  # ADD Abstract 
  yDelta <- ( pos[3, 2] - pos[4, 2]) / 2
  diagram::textrect( mid = c( 0.7, pos[1, 2] + 2 * yDelta),
                     lab = "Abstract", 
                     radx = 0.11, 
                     rady = 0.035, 
                     shadow.size = 0,
                     box.col = "lightcoral",
                     lcol = "lightcoral")
  
  arrows(x0 = 0.75, # 0.70!!
         y0 = pos[1, 2] - 0.75 * yDelta,
         x1 = 0.75, # 0.70!
         y1 = pos[1, 2] ,
         col = "black",
         code = 2,
         angle = 15,
         length = 0.1)
  
  
  
  # POINT TO DISCUSSION
  yLow <- pos[3, 2] - 0.75 * yDelta
  yHi  <- pos[1, 2] + 0.75 * yDelta
  
  polygon( x = c(0.60, 0.90, 0.90, 0.60) - 0.05,
           y = c(yHi, yHi, yLow, yLow), 
           lwd = 1)
  arrows(x0 = 0.70,
         y0 = pos[3, 2] - 0.75 * yDelta,
         x1 = 0.70,
         y1 = 0.08,
         col = "black",
         code = 2,
         angle = 15,
         length = 0.1)
  
  # ABSTRACT
  # lines( x = c(0.75, 0.90, 0.90, 0.75),
  #        y = c(0.87, 0.87, 0.01, 0.01),
  #        lwd = 2,
  #        col = "black")
  # arrows(x0 = 0.95,
  #        y0 = 0.44,
  #        x1 = 0.99,
  #        y1 = 0.44,
  #        col = "black",
  #        code = 2,
  #        angle = 15,
  #        length = 0.1)
  # textrect( 0.95, 0.44, 
  #            lab = "Abstract", 
  #            radx = 0.15, 
  #            rady = 0.035, 
  #            shadow.size = 0,
  #            angle = 90,
  #            box.col = "darkseagreen1",
  #            lcol = "darkseagreen1")
  
  if (debug) {
    axis(side = 1)
    axis(side = 2)
    box()
  }
  
}
