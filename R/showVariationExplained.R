showVariationExplained <- function(){
  
  par( mar = c(4.75, 0.5, 2.5, 0.5))
  diagram::openplotmat()
  
  xLoc <- seq(0.15, 0.80, 
              len = 5) 
  barWidths <- 0.07
  
  yNames <- c("Explan.",   
              "Chance", 
              "Extraneous",
              "Design") # Bottom to top
  yRelative <- c(1, 0.9, 1.3, 0.8) / 4 # Bottom to top
  yHeights <- cumsum(yRelative)
  
  
  boxColours <- c( ExplanatoryColourTransparent,
                   ChanceColourTransparent,
                   ExtraneousColourTransparent,
                   DesignColourTransparent )
  
  #axis(side=1); axis(side=2) 
  
  mtext(text = c("All variation\nlooks like\nchance", 
                 "Good design\neliminates\nsome variation",
                 "The remaining\nvariation looks\nlike chance",
                 "Some variation\nexplained by\nextraneous vars",
                 "Explan. variable\nsmall relative\nto chance"),
        side = 1,
        line = 1,
        padj = 1, # Top aligned
        at = xLoc)
  
  mtext(text = c("(a)", 
                 "(b)",
                 "(c)",
                 "(d)",
                 "(e)"),
        side = 3,
        line = 1,
        padj = 1, # Top aligned
        at = xLoc)
  
  ###
  
  
  
  ### ALL VARIATION
  diagram::textrect( mid = c( xLoc[1], mean( yRelative ) ),
                     radx = barWidths,
                     rady = 1,
                     shadow.size = 0,
                     lcol = boxColours[2],
                     box.col = boxColours[2])
  # Text
  text(x = xLoc[1],
       y = 0.5,
       labels = c("All variation\nappears\nto be chance"),
       #srt = 90,
       cex = 0.90
  )      
  
  
  
  
  # ELIMINATE DESIGN
  diagram::textrect( mid = c( xLoc[2], mean( c(yHeights[1], yHeights[4]) ) ),
                     radx = barWidths,
                     rady = (yHeights[1] + yHeights[4]) / 2,
                     shadow.size = 0,
                     lcol = boxColours[1],
                     box.col = boxColours[2])
  
  #Outline
  polygon( x = c( xLoc[2] - barWidths,
                  xLoc[2] - barWidths,
                  xLoc[2] + barWidths,
                  xLoc[2] + barWidths),
           y = c(0, 
                 yHeights[3], 
                 yHeights[3], 
                 0),
           lwd = 2)
  
  
  # Design
  diagram::textrect( mid = c( xLoc[2], mean( yHeights[3:4] ) ),
                     radx = barWidths,
                     rady =  yRelative[4] / 2,
                     shadow.size = 0,
                     lcol = boxColours[4],
                     box.col = "white",
                     lwd = 4)
  text(x = xLoc[2],
       y = mean( yHeights[3:4]),
       labels = c("Reduced by\ngood design"),
       #     srt = 90,
       cex = 0.90,
       col = "grey")
  
  # Text
  text(x = xLoc[2],
       y = mean( yHeights[1:2]),
       labels = c("The rest of\nthe variation\nappears to\nbe chance"),
       #     srt = 90,
       cex = 0.90
  )
  
  
  
  
  ### ADD EXPLANATORY
  # Design
  diagram::textrect( mid = c( xLoc[3], mean( yHeights[3:4] ) ),
                     radx = barWidths,
                     rady =  yRelative[4] / 2,
                     shadow.size = 0,
                     lcol = boxColours[4],
                     box.col = "white",
                     lwd = 4)
  text(x = xLoc[3],
       y = mean( yHeights[3:4]),
       labels = c("Reduced by\ngood design"),
       #     srt = 90,
       cex = 0.90,
       col = "grey")
  
  
  
  
  diagram::textrect( mid = c( xLoc[3], mean( c(0, yRelative[1]) ) ),
                     radx = barWidths,
                     rady = yRelative[1] / 2,
                     shadow.size = 0,
                     lcol = boxColours[1],
                     box.col = boxColours[1])
  diagram::textrect( mid = c( xLoc[3], mean( yHeights[c(1, 3)] ) ),
                     radx = barWidths,
                     rady = ( yHeights[4] - yHeights[2] ) /2,
                     shadow.size = 0,
                     lcol = boxColours[2],
                     box.col = boxColours[2])
  
  #Outline
  polygon( x = c( xLoc[3] - barWidths,
                  xLoc[3] - barWidths,
                  xLoc[3] + barWidths,
                  xLoc[3] + barWidths),
           y = c(yHeights[1], 
                 yHeights[3], 
                 yHeights[3], 
                 yHeights[1]),
           lwd = 2)
  
  # Text
  text(x = xLoc[3],
       y = mean( yHeights[c(1, 3)] ),
       labels = c("The rest of\nthe variation\nappears to\nbe chance"),
       #     srt = 90,
       cex = 0.90
  )      
  text(x = xLoc[3],
       y =  yHeights[1] / 2,
       labels = c("Due to\nexplanatory\nvariable"),
       #     srt = 90,
       cex = 0.90
  )      
  
  
  
  
  
  
  
  ### Divided up in one tall box still
  diagram::textrect( mid = c( xLoc[4], mean( c(0, yRelative[1]) ) ),
                     radx = barWidths,
                     rady = yRelative[1] / 2,
                     shadow.size = 0,
                     lcol = boxColours[1],
                     box.col = boxColours[1])
  diagram::textrect( mid = c( xLoc[4], mean( yHeights[1:2] ) ),
                     radx = barWidths,
                     rady = yRelative[2] / 2,
                     shadow.size = 0,
                     lcol = boxColours[2],
                     box.col = boxColours[2])
  diagram::textrect( mid = c( xLoc[4], mean( yHeights[2:3] ) ),
                     radx = barWidths,
                     rady = yRelative[3] / 2,
                     shadow.size = 0,
                     lcol = boxColours[3],
                     box.col = boxColours[3])

  
  #Outline
  polygon( x = c( xLoc[4] - barWidths,
                  xLoc[4] - barWidths,
                  xLoc[4] + barWidths,
                  xLoc[4] + barWidths),
           y = c(yHeights[1], 
                 yHeights[3], 
                 yHeights[3], 
                 yHeights[1]),
           lwd = 2)
  # Text
  text(x = xLoc[4],
       y = mean( c(0, yHeights[1]) ),
       labels = c("Due to\nexplanatory\nvariable"),
       #     srt = 90,
       cex = 0.90
  )      
  text(x = xLoc[4],
       y = mean( yHeights[1:2]),
       labels = c("Due to\nchance"),
       #     srt = 90,
       cex = 0.90
  )
  text(x = xLoc[4],
       y = mean( yHeights[2:3]),
       labels = c("Explained by\nextraneous\nvariables"),
       #     srt = 90,
       cex = 0.90
  )
  
  
  # Design box
  diagram::textrect( mid = c( xLoc[4], mean( yHeights[3:4] ) ),
                     radx = barWidths,
                     rady =  yRelative[4] / 2,
                     shadow.size = 0,
                     lcol = boxColours[4],
                     box.col = "white",
                     lwd = 4)
  text(x = xLoc[4],
       y = mean( yHeights[3:4]),
       labels = c("Reduced by\ngood design"),
       #     srt = 90,
       cex = 0.90,
       col = "grey")
  
  
  
  
  ### Divided up in one tall box still, but "hide" design and explanatory
  diagram::textrect( mid = c( xLoc[5], mean( c(0, yRelative[1]) ) ),
                     radx = barWidths,
                     rady = yRelative[1] / 2,
                     shadow.size = 0,
                     lcol = boxColours[1],
                     box.col = boxColours[1])
  diagram::textrect( mid = c( xLoc[5], mean( yHeights[1:2] ) ),
                     radx = barWidths,
                     rady = yRelative[2] / 2,
                     shadow.size = 0,
                     lcol = boxColours[2],
                     box.col = boxColours[2])
  diagram::textrect( mid = c( xLoc[5], mean( yHeights[2:3] ) ),
                     radx = barWidths,
                     rady = yRelative[3] / 2,
                     shadow.size = 0,
                     lcol = boxColours[3],
                     box.col = "white",
                     lwd = 4)
  diagram::textrect( mid = c( xLoc[5], mean( yHeights[3:4] ) ),
                     radx = barWidths,
                     rady =  yRelative[4] / 2,
                     shadow.size = 0,
                     lcol = boxColours[4],
                     box.col = "white",
                     lwd = 4)
  
  
  #Outline
  polygon( x = c( xLoc[5] - barWidths,
                  xLoc[5] - barWidths,
                  xLoc[5] + barWidths,
                  xLoc[5] + barWidths),
           y = c(yHeights[1], 
                 yHeights[2], 
                 yHeights[2], 
                 yHeights[1]),
           lwd = 2)
  # Text
  text(x = xLoc[5],
       y = mean( c(0, yHeights[1]) ),
       labels = c("Due to the\nexplanatory\nvariable"),
       #     srt = 90,
       cex = 0.90
  )      
  text(x = xLoc[5],
       y = mean( yHeights[1:2]),
       labels = c("Due to\nchance"),
       #     srt = 90,
       cex = 0.90
  )
  text(x = xLoc[5],
       y = mean( yHeights[2:3]),
       labels = c("Explained by\nextraneous\nvariables"),
       col = "grey",
       #     srt = 90,
       cex = 0.90
  )
  text(x = xLoc[5],
       y = mean( yHeights[3:4]),
       labels = c("Reduced by\ngood design"),
       col = "grey",
       #     srt = 90,
       cex = 0.90
  )
  
  
  # Arrow 
  arrows(y0 = 0,
         y1 = 1,
         x0 = 0.06,
         x1 = 0.06,
         code = 3, # Arrow both ends
         length = 0.15,
         angle = 15)
  text(x = 0.03,
       y = 0.5,
       labels = "Total variation in the response",
       srt = 90,
       cex = 0.90)
  
  
  
  # Arrow
  arrows(y0 = yHeights[2],
         y1 = 1,
         x0 = 0.92,
         x1 = 0.92,
         code = 3, # Arrow both ends
         length = 0.15,
         angle = 15)
  text(x = 0.97,
       y = mean(yHeights[c(2, 4)]),
       labels = "These effects\nexplained",
       srt = 90,
       cex = 0.90)
}
