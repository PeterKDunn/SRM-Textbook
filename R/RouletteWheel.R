
# Define helpful angles functions
deg2rad <- function(x) {
  x * pi / 180
}


#####################################################################################
rad2deg <- function(x) {
  x * 180 / pi
}


#####################################################################################
# Plot wheel function
plotWheel <- function(wheelSize = c(10, 4), isLaTeX = is_latex_output(), numberColours){

  DD <- wheelSize[1]
  dd <- wheelSize[2]

  sectorAngle <- 360/37 # Degrees
  
  numberLabels <-  c(0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 
                     11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 
                     22, 18, 29, 7, 28, 12, 35, 3, 26)
  
  # Colours on the segments
  par( mar = c(0.1, 0.1, 2.1, 0.1))
  xPlot <- cos( deg2rad(seq(0, 360, 
                by = 1))) * DD
  yPlot <- sin( deg2rad(seq(0, 360, 
                by = 1))) * DD
  plot( x = xPlot,
        y = yPlot,
        axes = FALSE,
        xlab = "", 
        ylab = "",
        xlim = range(xPlot),
        ylim = range(yPlot),
        type = "n", # DO the outer lines later to define them properly
        asp = 1)

    
  for (i in (1:37)){ # For each wheel segment...
    
    colAngle <- sectorAngle*(i - 1)

    polygon(x = c(0, seq( cos( deg2rad( colAngle ) ) * DD, 
                          cos( deg2rad( colAngle + sectorAngle) ) * DD, length = 10), 0 ),
            y = c(0, seq( sin( deg2rad( colAngle ) ) * DD, 
                          sin( deg2rad( colAngle + sectorAngle) ) * DD, length = 10), 0 ),
            col = numberColours[i + 1]) # Because the first one is for 0
  }
  
  # Plot inner wheel2: Overwrites segment colours
  polygon(x = cos( deg2rad(seq(0, 360, by = 0.1))) * dd * 1.5,
          y = sin( deg2rad(seq(0, 360, by = 0.1))) * dd * 1.5,
          col = "white")

  polygon(x = cos( deg2rad(seq(0, 360, by = 0.1))) * dd,
          y = sin( deg2rad(seq(0, 360, by = 0.1))) * dd,
          col = "grey")
  
  
  # Plot "spokes": Overwrite segment colours
  spokes <- seq(0, 360, 
                by = sectorAngle) # Degrees
  for (i in (1:length(spokes))){
    segments( x0 = 0, 
              y0 = 0,
              x1 = DD * cos( deg2rad(spokes[i])), 
              y1 = DD * sin( deg2rad(spokes[i])),
              col="grey")
  }
  
  # Show numbers
  # To use  srt  to rotate text, we need to loop: srt  does not take vectors
  radiusForNumbers <- 0.92
  for (i in (1:37)){ # For each wheel segment...
    textAngle <- spokes - (sectorAngle/2) # Degrees
    text(x = cos( deg2rad( textAngle[i])) * radiusForNumbers * DD,
         y = sin( deg2rad( textAngle[i])) * radiusForNumbers * DD,
         labels = numberLabels[i],
         srt = textAngle[i] - 90,
         cex = 0.85,
         col = "black")
  }  
  # Redo outside wheel outline
  lines( x = cos( deg2rad(seq(0, 360, by = 0.05))) * DD,
         y = sin( deg2rad(seq(0, 360, by = 0.05))) * DD,
         lwd = 2)
}       


#####################################################################################
# Plotting ball function
plotBall <- function(angle, radius, wheelSize = c(10, 4), colour = "black"){
  
  DD <- wheelSize[1]
  dd <- wheelSize[2]
  
  # Plot ball at current position of ball
  points( x = cos(angle) * radius,
          y = sin(angle) * radius,
          pch = 19,
          cex = 1.6,
          col = colour)  
  
}


# Plotting shadow ball function
plotBallShadow <- function(angle, 
                           radius, 
                           wheelSize = c(10, 4), 
                           colour){

  DD <- wheelSize[1]
  dd <- wheelSize[2]

  # Plot ball shadow at given position of ball
  points( x = cos(angle) * radius,
          y = sin(angle) * radius,
          pch = 19,
          cex = 1.6,
          col = colour)
  
}



#####################################################################################
###########################################################################################################


plotSpinningWheel <- function(angle, 
                              radius, 
                              wheelSize = c(10, 4), 
                              plotShadow = TRUE, 
                              shadowColour =  rgb(255, 255, 255, 
                                                  max = 255, 
                                                  alpha = 55),
                              isLaTeX = is_latex_output(),
                              main = "Rolling...") {
  
  # angle is the *middle* of each segment, where the ball lies
  # angle is in radians

  sectorAngle <- 360/37 # Angle of each of the 37 segments, IN DEGREES

  # Colour info: Which sectors to make 'red'
  colRed <- c(
    seq( 1, 10, by = 2),
    seq(19, 28, by = 2),
    seq(12, 18, by = 2),
    seq(30, 36, by = 2)
  )
  # By default, set up every sector to be black (and later change those that need to be red)
  numberColours <- rep(NA, 38)
  
  if (isLaTeX) { # LaTeX
    numberColours <- rep( rgb(0.45, 0.45, 0.45, 
                              max = 255, 
                              alpha = 125, 
                              names = "blackWheel"), 
                          37)
  } else { # HTML
    numberColours <- rep( rgb(25, 25, 25,   # BLACK
                              max = 255, 
                              alpha = 125, 
                              names = "blackWheel"), 
                          37)
  }
  # Number info for each sector
  numberLabels <-  c(0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 
                     11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 
                     22, 18, 29, 7, 28, 12, 35, 3, 26)
  if (isLaTeX) { # LaTeX
    numberColours[numberLabels%in%colRed] <-  rgb(250, 250, 250,     # LIGHT GREY
                                                  max = 255, 
                                                  alpha = 125, 
                                                  names = "redWheel")
    numberColours[numberLabels%in%0] <-  rgb(120, 120, 120,     # GREEN
                                             max = 255, 
                                             alpha = 125, 
                                             names = "greenWheel")
    numberColours[38] <-  rgb(120, 120, 120,     
                              max = 255, 
                              alpha = 125, 
                              names = "greenWheel")
  } else { #HTML
    numberColours[numberLabels%in%colRed] <-  rgb(255, 0, 0,     # RED
                                                  max = 255, 
                                                  alpha = 125, 
                                                  names = "redWheel")
    numberColours[numberLabels%in%0] <-  rgb(0, 255, 0,     # GREEN
                                             max = 255, 
                                             alpha = 125, 
                                             names = "greenWheel")
    numberColours[38] <-  rgb(0, 255, 0,     
                              max = 255, 
                              alpha = 125, 
                              names = "greenWheel")
  }
  
  ## Parameters
  DD <- wheelSize[1]
  dd <- wheelSize[2]
  
  
  # Plot wheel
  plotWheel(wheelSize = wheelSize, 
            isLaTeX = isLateX,
            numberColours)
  title( main = main )    
  
  
  # Plot ball at *previous* position, slightly greyed, to convey movement
  if (plotShadow | is.na(shadowColour) ) {
    
    plotBallShadow(angle = angle - deg2rad(sectorAngle),
                   radius = radius,
                   colour = shadowColour,
                   wheelSize = c(DD, dd) )
  }
  

  # Plot ball at *current* position
  plotBall(angle = angle,
           radius = radius,
           wheelSize = c(DD, dd))
  
  
  # Find the whole number starting which of the 37 segments we are in
  # Recall that the  angles  are the midpoints of each sector
  angle.mod <- rad2deg(angle) %% 360
  location <- (angle.mod / sectorAngle)

  coloursInWords <- rep("black", 38)
  coloursInWords[numberLabels%in%colRed] <- "red"
  coloursInWords[numberLabels%in%0] <- "green"
  coloursInWords[38] <- "green"
  
  roll <- numberLabels[ location + 2  ]
  colour <- coloursInWords[ location + 2  ]

  return( list(roll = roll,
               colour = colour) )
}