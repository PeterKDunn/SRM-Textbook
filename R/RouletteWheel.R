


# Define helpful angles functions
deg2rad <- function(x) {
  x * pi / 180
}
rad2deg <- function(x) {
  x * 180 / pi
}

# Plot wheel function
plotWheel <- function(wheelSize = c(10, 4), numberColours){

  DD <- wheelSize[1]
  dd <- wheelSize[2]

  sectorAngle <- 360/37
  
  numberLabels <-  c(0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 
                     11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 
                     22, 18, 29, 7, 28, 12, 35, 3, 26)
  
  # Colours on the segments
  plot( x = cos( deg2rad(seq(0, 360, by=1))) * DD,
        y = sin( deg2rad(seq(0, 360, by=1))) * DD,
        axes = FALSE,
        xlab = "", 
        ylab = "",
        type = "n", # DO the outer lines later to define them properly
        mar = c(0.5, 0.5, 0.5, 0.5),
        asp = 1)
  
  for (i in (1:37)){ # For each wheel segment...
    
    colAngle <- sectorAngle*(i-1)

    polygon(x = c(0, seq( cos( deg2rad( colAngle ) ) * DD, 
                          cos( deg2rad( colAngle + sectorAngle) ) * DD, length=10), 0 ),
            y = c(0, seq( sin( deg2rad( colAngle ) ) * DD, 
                          sin( deg2rad( colAngle + sectorAngle) ) * DD, length=10), 0 ),
            col = numberColours[i+1]) # Because the first one is for 0
  }
  
  # Plot inner wheel2: Overwrites segment colours
  polygon(x=cos( deg2rad(seq(0, 360, by=0.1))) * dd * 1.5,
          y=sin( deg2rad(seq(0, 360, by=0.1))) * dd * 1.5,
          col="white")

  polygon(x=cos( deg2rad(seq(0, 360, by=0.1))) * dd,
          y=sin( deg2rad(seq(0, 360, by=0.1))) * dd,
          col="grey")
  
  
  # Plot "spokes": Overwrite segment colours
  spokes <- seq(0, 360, by=sectorAngle)
  for (i in (1:length(spokes))){
    segments( x0 = 0, 
              y0 = 0,
              x1 = DD * cos( deg2rad(spokes[i])), 
              y1 = DD * sin( deg2rad(spokes[i])),
              col="grey")
  }
  
  # Show numbers
  textAngle <- spokes - (sectorAngle/2)
  text(x = cos( deg2rad( textAngle)) * 0.9 * DD,
       y = sin( deg2rad( textAngle)) * 0.9 * DD,
       labels=numberLabels,
       col="black")
  
  # Redo outside wheel outline
  lines( x=cos( deg2rad(seq(0, 360, by=0.05))) * DD,
         y=sin( deg2rad(seq(0, 360, by=0.05))) * DD,
         lwd=2)
}       


# Plotting ball function
plotBall <- function(angle, radius, wheelSize = c(10, 4), colour = "black"){
  
  DD <- wheelSize[1]
  dd <- wheelSize[2]
  
  # Plot ball at current position of ball
  points( x = cos(angle) * radius,
          y = sin(angle) * radius,
          pch = 19,
          cex = 2,
          col = colour)  
  
}


# Plotting shadow ball function
plotBallShadow <- function(angle, radius, wheelSize = c(10, 4), colour){

  DD <- wheelSize[1]
  dd <- wheelSize[2]

  # Plot ball shadow at given position of ball
  points( x = cos(angle) * radius,
          y = sin(angle) * radius,
          pch = 19,
          cex = 2,
          col = colour)
  
}







#####################################################################################
###########################################################################################################


plotSpinningWheel <- function(angle, radius, wheelSize = c(10, 4), plotShadow = TRUE, 
                              shadowColour =  rgb(255, 255, 255, max = 255, alpha = 55),
                              main = "Rolling...") {
  
  # angle is the *middle* of each segment, where the ball lies
  # ange is in radians

  sectorAngle <- 360/37 # Angle of each of the 37 segments, IN DEGREES

  # Colour info
  colRed <- c(
    seq( 1, 10, by = 2),
    seq(19, 28, by = 2),
    seq(12, 18, by = 2),
    seq(30, 36, by = 2)
  )
  numberColours <- rep(NA, 38)
  numberColours <- rep( rgb(0, 0, 0, 
                            max = 255, 
                            alpha = 125, 
                            names = "blackWheel"), 
                        37)
  
  # Number info
  numberLabels <-  c(0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 
                     11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 
                     22, 18, 29, 7, 28, 12, 35, 3, 26)
  
  numberColours[numberLabels%in%colRed] <-  rgb(255, 0, 0,     
                                                max = 255, 
                                                alpha = 125, 
                                                names = "redWheel")
  numberColours[numberLabels%in%0] <-  rgb(0, 255, 0,     
                                           max = 255, 
                                           alpha = 125, 
                                           names = "greenWheel")
  numberColours[38] <-  rgb(0, 255, 0,     
                            max = 255, 
                            alpha = 125, 
                            names = "greenWheel")
  
  
  ## Parameters
  DD <- wheelSize[1]
  dd <- wheelSize[2]
  
  
  # Plot wheel
  plotWheel(wheelSize = wheelSize, numberColours)
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
#  cat("----\nangle:", rad2deg(angle - sectorAngle/2), "\n")
  angle.mod <- rad2deg(angle) %% 360
#  cat("angle:", angle.mod, "\n")
  location <- (angle.mod / sectorAngle)
#  location <- rad2deg(angle + deg2rad(sectorAngle)/2) / sectorAngle # Recall: angle is the middle o each segment.

#  cat("\nlocation+2:", location+1, numberLabels[ location+2  ], "\n")
#  cat("location+1:", location+1, numberLabels[ location+1  ], "\n")
#  cat("location:", location, numberLabels[ location  ], "\n")
#  cat("location-1:", location-1, numberLabels[ location-1  ], "\n")
  
  numberLabels <-  c(0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 
                     11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 
                     22, 18, 29, 7, 28, 12, 35, 3, 26)
  
  coloursInWords <- rep("black", 38)
  coloursInWords[numberLabels%in%colRed] <- "red"
  coloursInWords[numberLabels%in%0] <- "green"
  coloursInWords[38] <- "green"
  
  roll <- numberLabels[ location+2  ]
  colour <- coloursInWords[ location+2  ]

  return( list(roll = roll,
               colour = colour) )
}