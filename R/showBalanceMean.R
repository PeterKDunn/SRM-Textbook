BalanceMean <- function(locate.fulcrum, # Where to place fulcrum
                        numberImages, # 
                        iteration){ # Which to show
  # Parameters
  
  #locate.fulcrum <- 5
  h.fulcrum <- 0.5  # Height of fulcrum
  w.fulcrum <- 0.25   # Width of fulcrum, to *one* side. Total width is twice this
  
  
  # Data
  milk <- c(4.8, 6.5, 5.2, 4.5, 5.2, 5.7, 5.4, 4.8, 5.2, 5.2) 
  mean.x <- mean(milk)
  
  
  # Ruler details
  extra <- 0.05
  l.ruler <- max(milk) - min(milk) + 2 * extra   # The length of the ruler
  min.ruler <- min(milk) - extra
  max.ruler <- max(milk) + extra
  h.ruler <- 0.05    # The height of the ruler
  
  
  # Create matrix
  Pos <- array( dim = c(4 + 5 * length(unique(milk)), 2) )
  
  ## Ruler: polygon in order (1, 2, 3, 4, 1)
  Pos[1, ] <- c( min.ruler, 0)
  Pos[2, ] <- c( min.ruler, h.ruler)
  Pos[3, ] <- c( max.ruler, h.ruler)
  Pos[4, ] <- c( max.ruler, 0)
  
  
  ## Position the data on top of ruler 
  data.ht <- 0.06
  data.width <- 0.02
  data.table <- table(milk)
  
  data.counter <- array( 0, 
                         dim = length(data.table) )
  
  base.counter <- 4
  for (i in (1:length(data.table))){
    
    x <- as.numeric(names(data.table)[i])
    Pos[base.counter + 1, ] <- c(x - data.width, 
                                 h.ruler  )
    Pos[base.counter + 2, ] <- c(x - data.width, 
                                 h.ruler + data.table[i] * data.ht)
    Pos[base.counter + 3, ] <- c(x + data.width, 
                                 h.ruler + data.table[i] * data.ht)
    Pos[base.counter + 4, ] <- c(x + data.width, 
                                 h.ruler)
    Pos[base.counter + 5, ] <- Pos[base.counter + 1, ]
    
    base.counter <- base.counter + 5
  }
  
  levelPos <- Pos
  
  ## Rotate ruler
  if ( locate.fulcrum == mean.x ) {
    theta <- 0
  } 
  if ( locate.fulcrum > mean.x ) {
    theta <- atan( h.fulcrum / (min.ruler - locate.fulcrum) )
  }
  if ( locate.fulcrum < mean.x ) {
    theta <- atan( h.fulcrum / (max.ruler - locate.fulcrum) )
  }
  
  
  ### START RotateMatrix
  RotateMatrix <- function(X, angle, locate.fulcrum = locate.fulcrum){
    RM <- matrix( c( cos(angle), 
                     sin(angle), 
                     -sin(angle), 
                     cos(angle)),
                  nrow = 2,
                  byrow = TRUE)
    
    cent <- c( locate.fulcrum, 0 )
    # Centre matrix
    X[, 1] <- X[, 1] - cent[1]
    X[, 2] <- X[, 2] - cent[2]
    
    newMat <- RM %*% t( as.matrix(X) )
    newMat <- t(newMat)
    newMat[, 1] <- newMat[, 1] + cent[1]
    newMat[, 2] <- newMat[, 2] + cent[2]
    newMat
  }
  ### END RotateMatrix
  
  
  
  Pos <- RotateMatrix(Pos, 
                      theta, 
                      locate.fulcrum = locate.fulcrum)
  
  ## Translate ruler higher
  if ( locate.fulcrum == mean.x ){
    Pos[, 2] <- Pos[, 2] + h.fulcrum
  }
  if ( locate.fulcrum > mean.x ){
    
    Pos[, 2] <- Pos[, 2] - Pos[1, 2]
    horizontal.shift <- Pos[1, 1] - min.ruler
    Pos[, 1] <- Pos[, 1] - horizontal.shift
  }
  if ( locate.fulcrum < mean.x ){
    Pos[, 2] <- Pos[, 2] - Pos[4, 2]
    
    horizontal.shift <- Pos[4, 1] - max.ruler
    Pos[, 1] <- Pos[, 1] - horizontal.shift
  }  
  
  # Canvas
  par( mar = c(0.5, 0.5, 3.5, 0.5) )
  plot( x = c(4, 7), 
        y = c(-0.5, 1.15),
        type = "n",
        axes = FALSE,
        main = "Trying to find the balance point...",
        xlab = "",
        ylab = "")
  
  # Draw ground
  abline( h = 0, 
          col = "darkgrey")
  
  # Draw ruler
  polygon( x = Pos[1:4, 1], 
           y = Pos[1:4, 2], 
           col = plot.colour)
  
  # Draw data
  base <- 4
  for (i in 1:length(data.table)){
    polygon( Pos[(1:5) + base, 1], 
             Pos[(1:5) + base, 2], 
             col = grey(0.8))
    
    base <- base + 5
  }
  
  # Draw "number line"
  xLineLabs <- seq( min(milk), 
                    max(milk), 
                    by = 0.5)
  segments( x0 = xLineLabs,
            y0 = 0,
            y1 = -0.05 * h.fulcrum,
            col = grey(0.2) )
  text(x = xLineLabs,
       y = -0.05 * h.fulcrum,
       labels = xLineLabs,
       cex = 0.75,
       pos = 1,
       col = grey(0.2))
  
  # Labels bars of data
  plotDataPlaces <- seq(6, dim(Pos)[1], 
                        by = 5)
  text( x = Pos[plotDataPlaces, 1] + data.width,
        y = Pos[plotDataPlaces, 2] + data.ht,
        labels = names(data.table),
        srt = -180 * theta / pi,
        cex = 0.75,
        col = grey(0.2))
  
  # Draw fulcrum
  polygon( x = c(-w.fulcrum, 0,         w.fulcrum, -w.fulcrum) + locate.fulcrum,
           y = c(0,          h.fulcrum, 0,         0),
           col = plot.colour)
  text(locate.fulcrum, -0.2, 
       #sprintf("%.3f", locate.fulcrum),
       expression(bar(italic(x)) == 5.25),
       pos = 1)
  
  
  # Draw fulcrum pivot, and the vertical line
  lines( x = c( locate.fulcrum, locate.fulcrum),
         y = c(-0.3 * h.fulcrum, h.fulcrum),
         col = grey(0.3))
  points(x = locate.fulcrum, 
         y = h.fulcrum, 
         pch = 19, 
         cex = 0.75)
  
  
  # Draw invisible dots.
  # Without this, the final image gets transformed straight to the beginning again....
  bit <- 0.1
  delta <- (7 - 4 - 2*bit)/numberImages # From the initial plots call; the size of the canvs is x-direction
  x0 <- 4 + bit                # The left-most point
  ylow <- -1                   # From initial plot call
  xplot <- x0 * iteration * delta
  points( xplot, ylow, 
          col = "white")
  
  invisible(Pos)
}