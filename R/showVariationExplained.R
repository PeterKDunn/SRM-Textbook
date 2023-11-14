showVariationExplained <- function(){
  
  par( mar = c(4.75, 0.5, 2.5, 0.5))
  diagram::openplotmat()
  
  xLoc <- seq(0.15, 0.80, 
              len = 4) 
  barWidths <- 0.07
  
  yNames <- c("Explan.",   
              "Chance", 
              "Extraneous",
              "Design") # Bottom to top
  yRelative <- c(1.0, 0.9, 1.3, 0.8) / 4 # Bottom to top
  yHeights <- cumsum(yRelative)
  
  
  boxColours <- c( ExplanatoryColourTransparent,
                   ChanceColourTransparent,
                   ExtraneousColourTransparent,
                   DesignColourTransparent )
  
  #axis(side=1); axis(side=2) 
  
  mtext(text = c("Part of the\ntotal variation is\ndue to explanatory", 
                 "Total variation\nhas other\ncomponents too",
                 "Using good\ndesign reduces\nvariation",
                 "Extraneous\nvariables\nexplain some\n variation"),
        side = 1,
        line = 1,
        padj = 1, # Top aligned
        at = xLoc)
  
  mtext(text = c("(a)", 
                 "(b)",
                 "(c)",
                 "(d)"),
        side = 3,
        line = 1,
        padj = 1, # Top aligned
        at = xLoc[1:4])
  
  ###
  
  
  #################################################################################
  ### ALL VARIATION
  diagram::textrect( mid = c( xLoc[1], 
                              mean( c(0, yRelative[1]) ) ),
                     radx = barWidths,
                     rady = yRelative[1] / 2,
                     shadow.size = 0,
                     lcol = boxColours[1],
                     box.col = boxColours[1])
  
  
  diagram::textrect( mid = c( xLoc[1], 
                              mean( yHeights[c(1, 4)]) ),
                     radx = barWidths,
                     rady = sum(yRelative[2:4])/2,
                     shadow.size = 0,
                     lcol = boxColours[2],
                     box.col = boxColours[2])
  
  # Text
  text(x = xLoc[1],
       y = mean( c(0, yHeights[1]) ),
       labels = c("Due to the\nexplanatory\nvariable"),
       #     srt = 90,
       cex = 0.90
  )      
  text(x = xLoc[1],
       y = mean(yHeights[1:4]),
       labels = c("All variation\nappears\nto be chance"),
       #srt = 90,
       cex = 0.90
  )      
  
  
  
  
  
  
  #################################################################################
    ### Divided up in one tall box still, but "hide" design and explanatory
  diagram::textrect( mid = c( xLoc[2], 
                              mean( c(0, yRelative[1]) ) ),
                     radx = barWidths,
                     rady = yRelative[1] / 2,
                     shadow.size = 0,
                     lcol = boxColours[1],
                     box.col = boxColours[1])
  diagram::textrect( mid = c( xLoc[2], 
                              mean( yHeights[1:2] ) ),
                     radx = barWidths,
                     rady = yRelative[2] / 2,
                     shadow.size = 0,
                     lcol = boxColours[2],
                     box.col = boxColours[2])
  diagram::textrect( mid = c( xLoc[2], 
                              mean( yHeights[2:3] ) ),
                     radx = barWidths,
                     rady = yRelative[3] / 2,
                     shadow.size = 0,
                     lcol = boxColours[3],
                     box.col = boxColours[3],
                     lwd = 2)
  diagram::textrect( mid = c( xLoc[2], 
                              mean( yHeights[3:4] ) ),
                     radx = barWidths,
                     rady =  yRelative[4] / 2,
                     shadow.size = 0,
                     lcol = boxColours[4],
                     box.col = boxColours[4],
                     lwd = 2)
  
  
  #Outline
  polygon( x = c( xLoc[2] - barWidths,
                  xLoc[2] - barWidths,
                  xLoc[2] + barWidths,
                  xLoc[2] + barWidths),
           y = c(yHeights[1], 
                 yHeights[2], 
                 yHeights[2], 
                 yHeights[1]),
           lwd = 2)
  # Text
  text(x = xLoc[2],
       y = mean( c(0, yHeights[1]) ),
       labels = c("Due to the\nexplanatory\nvariable"),
       #     srt = 90,
       cex = 0.90
  )      
  text(x = xLoc[2],
       y = mean( yHeights[1:2]),
       labels = c("Due to\nchance"),
       #     srt = 90,
       cex = 0.90
  )
  text(x = xLoc[2],
       y = mean( yHeights[2:3]),
       labels = c("Explained by\nextraneous\nvariables"),
       #col = "grey",
       #     srt = 90,
       cex = 0.90
  )
  text(x = xLoc[2],
       y = mean( yHeights[3:4]),
       labels = c("Explained by\ndesign"),
       #col = "grey",
       #     srt = 90,
       cex = 0.90
  )
  
  
  
  
  
  #################################################################################
  #  Text on right
  text( x = xLoc[5],
        y = yHeights[3],
        labels = "xxx")

  #################################################################################
  ### Remove design component
  diagram::textrect( mid = c( xLoc[3], 
                              mean( c(0, yRelative[1]) ) ),
                     radx = barWidths,
                     rady = yRelative[1] / 2,
                     shadow.size = 0,
                     lcol = boxColours[1],
                     box.col = boxColours[1])
  diagram::textrect( mid = c( xLoc[3], 
                              mean( yHeights[1:2] ) ),
                     radx = barWidths,
                     rady = yRelative[2] / 2,
                     shadow.size = 0,
                     lcol = boxColours[2],
                     box.col = boxColours[2])
  diagram::textrect( mid = c( xLoc[3], 
                              mean( yHeights[2:3] ) ),
                     radx = barWidths,
                     rady = yRelative[3] / 2,
                     shadow.size = 0,
                     lcol = boxColours[3],
                     box.col = boxColours[3],
                     lwd = 2)
  #diagram::textrect( mid = c( xLoc[2], mean( yHeights[3:4] ) ),
  #                   radx = barWidths,
  #                   rady =  yRelative[4] / 2,
  #                   shadow.size = 0,
  #                   lcol = boxColours[4],
  #                   box.col = "white",
  #                   lwd = 2)
  
  
  #Outline
  polygon( x = c( xLoc[2] - barWidths,
                  xLoc[2] - barWidths,
                  xLoc[2] + barWidths,
                  xLoc[2] + barWidths),
           y = c(yHeights[1], 
                 yHeights[2], 
                 yHeights[2], 
                 yHeights[1]),
           lwd = 2)
  # Text
  text(x = xLoc[3],
       y = mean( c(0, yHeights[1]) ),
       labels = c("Due to the\nexplanatory\nvariable"),
       #     srt = 90,
       cex = 0.90
  )      
  text(x = xLoc[3],
       y = mean( yHeights[1:2]),
       labels = c("Due to\nchance"),
       #     srt = 90,
       cex = 0.90
  )
  text(x = xLoc[3],
       y = mean( yHeights[2:3]),
       labels = c("Explained by\nextraneous\nvariables"),
       #col = "grey",
       #     srt = 90,
       cex = 0.90
  )
  text(x = xLoc[3],
       y = mean( yHeights[3:4]),
       labels = c("Reduced by\ngood design"),
       #col = "grey",
       #     srt = 90,
       cex = 0.90
  )
  
  
  
  
  
  
  
  #################################################################################
  ### Remove design AND extraneous components
  diagram::textrect( mid = c( xLoc[4], 
                              mean( c(0, yRelative[1]) ) ),
                     radx = barWidths,
                     rady = yRelative[1] / 2,
                     shadow.size = 0,
                     lcol = boxColours[1],
                     box.col = boxColours[1])
  diagram::textrect( mid = c( xLoc[4], 
                              mean( yHeights[1:2] ) ),
                     radx = barWidths,
                     rady = yRelative[2] / 2,
                     shadow.size = 0,
                     lcol = boxColours[2],
                     box.col = boxColours[2])
  # diagram::textrect( mid = c( xLoc[3], 
  #                             mean( yHeights[2:3] ) ),
  #                    radx = barWidths,
  #                    rady = yRelative[3] / 2,
  #                    shadow.size = 0,
  #                    lcol = boxColours[3],
  #                    box.col = boxColours[3],
  #                    lwd = 2)
  #diagram::textrect( mid = c( xLoc[2], mean( yHeights[3:4] ) ),
  #                   radx = barWidths,
  #                   rady =  yRelative[4] / 2,
  #                   shadow.size = 0,
  #                   lcol = boxColours[4],
  #                   box.col = "white",
  #                   lwd = 2)
  
  
  #Outline
  polygon( x = c( xLoc[2] - barWidths,
                  xLoc[2] - barWidths,
                  xLoc[2] + barWidths,
                  xLoc[2] + barWidths),
           y = c(yHeights[1], 
                 yHeights[2], 
                 yHeights[2], 
                 yHeights[1]),
           lwd = 2)
  # Text
  text(x = xLoc[4],
       y = mean( c(0, yHeights[1]) ),
       labels = c("Due to the\nexplanatory\nvariable"),
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
       #col = "grey",
       #     srt = 90,
       cex = 0.90
  )
  text(x = xLoc[4],
       y = mean( yHeights[3:4]),
       labels = c("Reduced by\ngood design"),
       #col = "grey",
       #     srt = 90,
       cex = 0.90
  )
  
  
  
  
  
  
  
  
  
  
  

  
  ### Arrow 
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
  
  
  ### Arrow
  delta <- 0.01
  arrows(y0 = yHeights[2] + delta,
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
  
  ### Arrow
  arrows(y0 = yHeights[2] - delta,
         y1 = 0,
         x0 = 0.92,
         x1 = 0.92,
         code = 3, # Arrow both ends
         length = 0.15,
         angle = 15)
  text(x = 0.97,
       y = mean(yHeights[1]),
       labels = "Impact of explanatory\neasier to detect",
       srt = 90,
       cex = 0.90)
}
