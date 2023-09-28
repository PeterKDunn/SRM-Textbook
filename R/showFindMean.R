FindMean <- function(locate.x = 5.25, numberImages, iteration){
  
  # Data
  milk <- c(4.8, 6.5, 5.2, 4.5, 5.2, 5.7, 5.4, 4.8, 5.2, 5.2) 
  mean.x <- mean(milk)
  data.table <- table(milk)
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
  mar = c(0.1, 0.1, 3, 0.1) + 0.1
  plot( x = c(4, 8), 
        y = c(-0.5, 2.25),
        type = "n",
        axes = FALSE,
        main = "Finding the mean:\n where the sum is zero",
        xlab = "",
        ylab = "")
  
  # Draw ruler
  polygon( x = Pos[1:4, 1], 
           y = Pos[1:4, 2], 
           col = plot.colour)
  
  
  # Draw data
  jump <- jump.extra <- 0.18
  for (i in 1:length(milk)){
    points( sort(milk)[i], jump, 
            pch = 19)
    
    # The arrows
    arrows( locate.x, jump, sort(milk)[i], jump,
            length = ifelse( abs(locate.x - sort(milk)[i]) > 0.2, 0.15, 0.0), # Arrows when there is enough space
            col = ifelse( locate.x - sort(milk)[i] > 0, 
                          "red", 
                          "green4"),
            lwd = 2,
            angle = 15)
    
    # The distances
    text( 7.5, jump, 
          sprintf("%.2f", round(sort(milk)[i] - locate.x, 2)),
          col = ifelse( locate.x - sort(milk)[i] > 0, 
                        "red", 
                        "green4"),
          adj = 1,
          cex = 1)
    
    jump <- jump + jump.extra
    
  }
  
  
  # Highlight the mean/mean guess
  lines(x = rep(locate.x, 2),
        y = c(-0.5, 2),
         col = "grey")
  text(x = locate.x, 
       y = 2.2, 
       labels = expression(bar(italic(x)) == 5.25),
       cex = 1)
  
  
  # The sum  
  segments( x0 = 7.1, 
            y0 = 0,
            x1 = 7.6)
  text( 7.5, -0.4, 
        sprintf("%.2f", round( sum(sort(milk) - locate.x), 2)),
        adj = 1,
        cex = 0.95)
  text( 7.65, 
        jump + jump.extra, "Distance",
        adj = 1,
        cex = 0.95)
  text( 7.5, -0.2, 
        "Sum:",
        adj = 1,
        cex = 1.1)
  
  # Shade summing area
  polygon ( c(7, 7, 7.8, 7.8, 7),
            c(-0.7, 2.3, 2.3, -0.75, -0.75),
            border = NA,
            col = mycol <- rgb(240, 240, 240, max = 255, alpha = 100))
  
  base <- 4
  for (i in 1:length(data.table)){
    polygon( x = Pos[(1:5) + base, 1], 
             y = Pos[(1:5) + base, 2], 
             col = grey(0.4))
    
    base <- base + 5
  }
  
  # Draw "number line"
  xLineLabs <- seq( min(milk), max(milk), by = 0.5)
  segments( x0 = xLineLabs,
            y0 = 0,
            y1 = -0.05,
            col = "black")
  text(x = xLineLabs,
       y = -0.05,
       labels = xLineLabs,
       cex = 0.9,
       pos = 1,
       col = "black")
  
  
  # Draw invisible dots.
  # Without this, the final image gets transformed straight to the beginning again....
  bit <- 0.1
  delta <- (8-4 - 2 * bit)/numberImages # From the initial plots call; the size of the canvs is x-direction
  x0 <- 4 + bit                # The left-most point
  ylow <- -1                 # From initial plot call
  xplot <- x0 * iteration * delta
  points( xplot, ylow, 
          col = "white")
}


meanCandidates <- c( seq(5, 5.5, by = 0.05),
                     seq(5.5, 5.0, by = -0.05),
                     seq(5.0, 5.25, by = 0.025),
                     rep(5.25, 20))
