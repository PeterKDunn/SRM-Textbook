showVariationExplained <- function(){
  
  par( mar = c(4.75, 0.5, 2.5, 0.5))

  diagram::openplotmat()

  #axis(side=1); axis(side=2) 
  
  ### SETUP
  
  xLoc <- seq(0.15, 0.80, 
              len = 4) 
  barWidths <- 0.055
  
  yNames <- c("Explan.",   
              "Chance", 
              "Extraneous",
              "Design") # Bottom to top
  
  yRelative <- c(1.3, 0.9, 1.3, 0.8)  # Bottom to top: Explanatory var" is first
  yRelative <- yRelative/ sum(yRelative)
  yHeights <- cumsum(yRelative)
  
  
  boxColours <- c( ExplanatoryColourTransparent,
                   ChanceColourTransparent,
                   ExtraneousColourTransparent,
                   DesignColourTransparent )
  
  
  mtext(text = c("Part of the\ntotal variation is\ndue to explanatory", 
                 "Total variation\nhas other\ncomponents too",
                 "Using good\ndesign reduces\nvariation",
                 "Extraneous vars.\nexplain some\nvariation"),
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
  
  delta <- 0.01 # Amount by which to shrink arrows a little, so both are visible where they meet
  
  
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
       labels = c("All other\nvariation\nappears to\nbe chance"),
       #srt = 90,
       cex = 0.90
  )      
  
  # Arrows
  arrows(x0 = xLoc[1] + (1.2 * barWidths),
         x1 = xLoc[1] + (1.2 * barWidths),
         y0 = 0, 
         y1 = yHeights[1] - delta,
         code = 3,
         length = 0.10,
         angle = 15)
  text(x = xLoc[1] + (1.65 * barWidths),
       y = yHeights[1]/2,
       labels = "Relatively\nsmall",
       cex = 0.9,
       srt = 90)
  
  arrows(x0 = xLoc[1] + (1.2 * barWidths),
         x1 = xLoc[1] + (1.2 * barWidths),
         y0 = yHeights[1],
         y1 = yHeights[4],
         code = 3,
         length = 0.10,
         angle = 15)
  text(x = xLoc[1] + (1.65 * barWidths),
       y = mean( yHeights[ c(1, 4)] ),
       labels = "Relatively large\namount of other variation",
       cex = 0.9,
       srt = 90)
  
  
  
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
       labels = c("Due to\nextraneous\nvariables"),
       #col = "grey",
       #     srt = 90,
       cex = 0.90
  )
  text(x = xLoc[2],
       y = mean( yHeights[3:4]),
       labels = c("Due to poor\ndesign"),
       #col = "grey",
       #     srt = 90,
       cex = 0.90
  )

  # Arrows
  arrows(x0 = xLoc[2] + (1.2 * barWidths),
         x1 = xLoc[2] + (1.2 * barWidths),
         y0 = 0, 
         y1 = yHeights[1] - delta,
         code = 3,
         length = 0.10,
         angle = 15)
  text(x = xLoc[2] + (1.65 * barWidths),
       y = yHeights[1]/2,
       labels = "Relatively\nsmall",
       cex = 0.9,
       srt = 90)
  
  arrows(x0 = xLoc[2] + (1.2 * barWidths),
         x1 = xLoc[2] + (1.2 * barWidths),
         y0 = yHeights[1],
         y1 = yHeights[4],
         code = 3,
         length = 0.10,
         angle = 15)
  text(x = xLoc[2] + (1.65 * barWidths),
       y = mean( yHeights[ c(1, 4)] ),
       labels = "Still relatively large\namount of other variation",
       cex = 0.9,
       srt = 90)
  
  
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
  
  # "Shadow" missing bit
  polygon( x = c(xLoc[3] - barWidths, 
                 xLoc[3] - barWidths, 
                 xLoc[3] + barWidths, 
                 xLoc[3] + barWidths),
           y = c(yHeights[3],
                 yHeights[4],
                 yHeights[4],
                 yHeights[3]),
           border = "grey")

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
       labels = c("Due to\nextraneous\nvariables"),
       #col = "grey",
       #     srt = 90,
       cex = 0.90
  )
  text(x = xLoc[3],
       y = mean( yHeights[3:4]),
       labels = c("Reduced by\ngood design"),
       col = grey(0.3),
       #     srt = 90,
       cex = 0.90
  )
  
  
  
  # Arrows
  arrows(x0 = xLoc[3] + (1.2 * barWidths),
         x1 = xLoc[3] + (1.2 * barWidths),
         y0 = 0, 
         y1 = yHeights[1] - delta,
         code = 3,
         length = 0.10,
         angle = 15)
  text(x = xLoc[3] + (1.65 * barWidths),
       y = yHeights[1]/2,
       labels = "Relatively\nsmall",
       cex = 0.9,
       srt = 90)
  
  arrows(x0 = xLoc[3] + (1.2 * barWidths),
         x1 = xLoc[3] + (1.2 * barWidths),
         y0 = yHeights[1],
         y1 = yHeights[3],
         code = 3,
         length = 0.10,
         angle = 15)
  text(x = xLoc[3] + (1.65 * barWidths),
       y = mean( yHeights[ c(1, 3)] ),
       labels = "Moderate amount\nof other variation",
       cex = 0.9,
       srt = 90)
  
  
  
  
  
  
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
       col = grey(0.3),
       #     srt = 90,
       cex = 0.90
  )
  text(x = xLoc[4],
       y = mean( yHeights[3:4]),
       labels = c("Reduced by\ngood design"),
       col = grey(0.3),
       #     srt = 90,
       cex = 0.90
  )
  
  # "Shadow" missing bit
  polygon( x = c(xLoc[4] - barWidths, 
                 xLoc[4] - barWidths, 
                 xLoc[4] + barWidths, 
                 xLoc[4] + barWidths),
           y = c(yHeights[3],
                 yHeights[4],
                 yHeights[4],
                 yHeights[3]),
           border = "grey")
  polygon( x = c(xLoc[4] - barWidths, 
                 xLoc[4] - barWidths, 
                 xLoc[4] + barWidths, 
                 xLoc[4] + barWidths),
           y = c(yHeights[3],
                 yHeights[2],
                 yHeights[2],
                 yHeights[3]),
           border = "grey")

    
  # Arrows
  arrows(x0 = xLoc[4] + (1.2 * barWidths),
         x1 = xLoc[4] + (1.2 * barWidths),
         y0 = 0, 
         y1 = yHeights[1] - delta,
         code = 3,
         length = 0.10,
         angle = 15)
  text(x = xLoc[4] + (1.65 * barWidths),
       y = yHeights[1]/2,
       labels = "Can be\ndetected",
       cex = 0.9,
       srt = 90)
  
  arrows(x0 = xLoc[4] + (1.2 * barWidths),
         x1 = xLoc[4] + (1.2 * barWidths),
         y0 = yHeights[1],
         y1 = yHeights[2],
         code = 3,
         length = 0.10,
         angle = 15)
  text(x = xLoc[4] + (1.65 * barWidths),
       y = mean( yHeights[ 1:2] ),
       labels = "Small\namount",
       cex = 0.9,
       srt = 90)
}
