showExtraneousTypes <- function (){
  
  par( mar = c(0.1, 0.1, 0.1, 0.1))
  diagram::openplotmat()


  # Parameters
  extraneousX <- c(0.05, 0.95)
  extraneousY <- c(0.05, 0.95)

  confoundingX <- c(0.25, 0.925)
  confoundingY <- c(0.25, 0.925)
  
  lurkingX <- c(0.45, 0.90)
  lurkingY <- c(0.45, 0.90)
  
  # Show the big group of extraneous variables
  polygon( x = c( extraneousX[1], extraneousX[1], extraneousX[2], extraneousX[2]),
           y = c( extraneousY[1], extraneousY[2], extraneousY[2], extraneousY[1]), 
           col = ExtraneousColour,
           lwd = 2)

  # Show the big group of confounding variables
  polygon( x = c(confoundingX[1], confoundingX[1], confoundingX[2], confoundingX[2]), 
           y = c(confoundingY[1], confoundingY[2], confoundingY[2], confoundingY[1]), 
           col = "grey",
           lwd = 2)
  
  # Show the big group of lurking variables
  polygon( x = c(lurkingX[1], lurkingX[1], lurkingX[2], lurkingX[2]),
           y = c(lurkingY[1], lurkingY[2], lurkingY[2], lurkingY[1]), 
           col = "white",
           lwd = 2)
  
  # Text
  text(x = mean(extraneousX), 
       y = 0.1,
       expression(bold(Extraneous~variables)))
  
  text(x = mean(confoundingX), 
       y = 0.30,
       expression( atop(Some~extraneous~variables~are~bold(confounding)~variables) ) )
  
  text(x = mean(lurkingX), 
       y = 0.55,
       expression( atop(Some~confounding~variables, are~bold(lurking)~variables) ) )
  
  }