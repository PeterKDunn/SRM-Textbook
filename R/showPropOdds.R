showPropOdds <- function(){
  ### Visual for proportions and odds
  
  
  # Proportion
  par(mar = c(0.05, 0.05, 0.05, 0.05))
  plot( x = c(0.05, 0.95),
        y = c(0.05, 1.15),
        xlim = c(0.05, 0.95),
        ylim = c(0.05, 1.05),
        axes = FALSE,
        type = "n",
        xlab = "",
        ylab = "")
  
  pCol <- ifelse( knitr::is_latex_output(), ResponseColour, viridis::viridis(10)[3])
  qCol <- ifelse( knitr::is_latex_output(), IndividualColour,  viridis::viridis(10)[8])
  
  
  # Proportions image
  polygon( y = c(0.4, 0.4, 0.3, 0.3),
           x = c(0.1, 0.2, 0.2, 0.1) + 0.1,
           col = pCol)
  
  polygon( y = c(0.2, 0.2, 0.1, 0.1),
           x = c(0.1, 0.2, 0.2, 0.1),
           col = pCol)
  polygon( y = c(0.2, 0.2, 0.1, 0.1),
           x = c(0.2, 0.4, 0.4, 0.2),
           col = qCol)
  
  
  # Odds image
  polygon( y = c(0.4, 0.4, 0.3, 0.3),
           x = c(0.6, 0.7, 0.7, 0.6) + 0.1,
           col = pCol)
  polygon( y = c(0.2, 0.2, 0.1, 0.1),
           x = c(0.65, 0.85, 0.85, 0.65),
           col = qCol)
  
  # Vinculums
  segments(x0 = 0.05,
           x1 = 0.45,
           y0 = 0.25,
           y1 = 0.25,
           lwd = 2)
  
  segments(x0 = 0.55,
           x1 = 0.95,
           y0 = 0.25,
           y1 = 0.25,
           lwd = 2)
  
  
  # Text
  text(x = 0.25,
       y = 0.5,
       "Proportions =")
  text(x = 0.75,
       y = 0.5,
       "Odds =")
  
  
  # Top explanation
  polygon( y = c(0.8, 0.8, 0.9, 0.9),
           x = c(0.35, 0.45, 0.45, 0.35),
           col = pCol)
  polygon( y = c(0.8, 0.8, 0.9, 0.9),
           x = c(0.45, 0.65, 0.65, 0.45),
           col = qCol)
  
  arrows(x0 = 0.25,
         y0 = 0.72,
         x1 = 0.35,
         y1 = 0.82,
         lwd = 2,
         angle = 15,
         length = 0.1)
  arrows(x0 = 0.75,
         y0 = 0.72,
         x1 = 0.65,
         y1 = 0.82,
         lwd = 2,
         angle = 15,
         length = 0.1)
  
  
  textrect(mid = c(0.25, 0.72),
           radx = 0.2,
           rady = 0.03,
           box.col = "white",
           lcol = "white",
           shadow.size = 0,
           lab = expression(Number~of~interest*":") )
#  polygon( y = c(0.8, 0.8, 0.9, 0.9),
#           x = c(0.28, 0.38, 0.38, 0.28),
#           col = pCol)

  textrect(mid = c(0.75, 0.72),
           radx = 0.2,
           rady = 0.03,
           box.col = "white",
           lcol = "white",
           shadow.size = 0,
           lab = expression(Number~bold(not)~of~interest*":") )
  
  
#  text(x = 0.75,
#       y = 0.72,
#       expression(Number~bold(not)~of~interest*":") )
#  polygon( y = c(0.8, 0.8, 0.9, 0.9),
#           x = c(0.75, 0.95, 0.95, 0.75),
#           col = qCol)
  
  # Divider
  abline(h = 0.65, 
         col = "grey",
         lty = 2,
         lwd = 2)
  
  # Total number
  arrows(x0 = 0.35,
         x1 = 0.65,
         y0 = 0.93,
         y1 = 0.93,
         lwd = 2,
         code = 3,
         angle = 15,
         length = 0.1)
  text(x = 0.5,
       y = 0.93,
       pos = 3,
       cex = 0.9,
       labels = expression(Total~number))
  # Debugging:
#  box()
  #axis(side = 1)
 # axis(side = 2)
  
}