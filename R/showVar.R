
showVar <- function(){
  
  # Data
  milk <- c(4.8, 6.5, 5.2, 4.5, 5.2, 5.7, 5.4, 4.8, 5.2, 5.2) 
  mean.x <- mean(milk)
  data.table <- table(milk)
  locate.x <- mean(milk)
  jump <- jump.extra <- 0.18
  
  # Parameters
  extra <- 0.05
  l.ruler <- max(milk) - min(milk) + 2 * extra   # The length of the ruler
  min.ruler <- min(milk) - extra
  max.ruler <- max(milk)  + extra
  h.ruler <- 0.05    # The height of the ruler
  
  
  # Create matrix
  Pos <- array( dim = c(4 + 5 * length(unique(milk)), 2) )
  
  ## Ruler: polygon in order (1, 2, 3, 4, 1)
  Pos[1, ] <- c( min.ruler, 0)
  Pos[2, ] <- c( min.ruler, h.ruler)
  Pos[3, ] <- c( max.ruler, h.ruler)
  Pos[4, ] <- c( max.ruler, 0)
  
    
  # Canvas
  par( mar = c(0.5, 0.5, 3, 0.5) + 0.1)
  plot( x = c(4, 9), 
        y = c(-0.1, 1.9),
        type = "n",
        asp = 1,
        axes = FALSE,
        main = "The sum of the squared distances\nof each observation from the mean",
        xlab = "",
        ylab = "")
  
  # Draw ruler
  polygon( Pos[1:4, 1], 
           Pos[1:4, 2], 
	   col = "lightblue")
  
    # Draw data
  jump <- jump.extra <- 0.18
  for (i in 1:length(milk)){
    points( sort(milk)[i], jump, 
            pch = 19)
    
    # The arrows
    arrows( x0 = locate.x, 
            y0 = jump, 
            x1 = sort(milk)[i], 
            y1 = jump,
            length = ifelse(abs(locate.x - sort(milk)[i]) > 0.2, 0.2, 0),
            lwd = 2,
            col = ifelse( locate.x - sort(milk)[i] > 0, "red", "green4"),
            angle = 15)
    
    # The distances
    text( 7.5, jump, 
          sprintf("%.4f", (sort(milk)[i] - locate.x)),
          col = ifelse( locate.x - sort(milk)[i] > 0, "red", "green4"),
          adj = 1,
          cex = 0.95)
    
    # The distances^2
    text( 8.5, jump, sprintf("%.4f", (sort(milk)[i] - locate.x)^2),
          adj = 1,
          cex = 0.95)

        jump <- jump + jump.extra
    
  }


  # Highlight the mean/mean guess
  lines(x = c(locate.x, locate.x),
        y = c(0, jump),
        col = "grey")
  text(locate.x, 
       jump + jump.extra, 
       labels = expression(bar(italic(x))==5.25),
       cex = 0.95)
  

    # The sum  
  segments(  x0 = 7.0, 
             y0 = 0, 
	     x1 = 8.7)
  
  text( 7.5, -0.15, 
        sprintf("%.4f", sum( (sort(milk)- locate.x))),
        adj = 1,
        cex = 0.95)
  text( 7.5, jump + jump.extra, 
        "Deviation",
        adj = 1,
        cex = 0.95)

  text( 8.5, -0.15, 
        sprintf("%.4f",  sum( (sort(milk)- locate.x)^2)),
        adj = 1,
        cex = 0.95)
  text( 8.5, jump + jump.extra, 
        expression((Dev.)^2),
        adj = 1,
        cex = 0.95)
  

  base <- 4
  for (i in 1:length(data.table)){
    polygon( Pos[(1:5) + base, 1], 
             Pos[(1:5) + base, 2], 
	     col = grey(0.4))
    
    base <- base + 5
  }
  
  # Shade dist area
  polygon( c(6.8, 6.8, 8.7, 8.7, 6.8),
           c(-0.3, 2.3, 2.3, -0.3, -0.3),
            border = NA,
            col = mycol <- rgb(240, 240, 240, max = 255, alpha = 100))

    
  # Draw "number line"
  xLineLabs <- seq( min(milk), max(milk), by = 0.5)
  segments( x0 = xLineLabs,
            y0 = 0,
            y1 = -0.05,
            col = "black")
  text(x = xLineLabs,
       y = -0.05,
       labels = xLineLabs,
       cex = 0.75,
       pos = 1,
       col = "black")
}
