showVariationExplained <- function(){
  
  par( mar = c(4.75, 0.5, 2.5, 0.5))

  diagram::openplotmat()

  #axis(side=1); axis(side=2) 
  
  ### SETUP
  
  # Whole variation
  polygon( x = c(0, 0, 1, 1),
           y = c(0.6, 0.8, 0.8, 0.6),
           col = ResponseColour )
  text(x = 0.5,
       y = 0.87,
       "Variation in the response variable...")
  
  # Partitioned
  polygon( x = c(0, 0, 0.2, 0.2),
           y = c(0.2, 0.4, 0.4, 0.2),
           col = ChanceColour)
  polygon( x = c(0.2, 0.2, 0.7, 0.7),
           y = c(0.2, 0.4, 0.4, 0.2),
           col = ExtraneousColour)
  polygon( x = c(0.7, 0.7, 1, 1),
           y = c(0.2, 0.4, 0.4, 0.2),
           col = ExplanatoryColour)
  
  text(x = 0.1,
       y = 0.3,
       "Chance")
  text(x = 0.45,
       y = 0.3,
       "Extraneous")
  text(x = 0.85,
       y = 0.3,
       "Explanatory")
  
  segments(y0 = 0.6,
           y1 = 0.4,
           x0 = 1,
           x1 = 1,
           lwd = 2,
           lty = 2)
  segments(y0 = 0.6,
           y1 = 0.4,
           x0 = 0,
           x1 = 0,
           lwd = 2,
           lty = 2)
  
  text(x = 0.5,
       y = 0.13,
       "... comes from various sources")
  
  
}
