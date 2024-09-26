FindMean <- function(locate.x = .22214, numberImages, iteration, format){
  
  # Data
  beat <- c(0.7, 0.9, 1.3, 1.5, 1.5, 1.5, 1.7, 1.7, 1.8, 2.6, 3, 4.1, 4.4, 4.4)
  mean.x <- mean(beat)
  data.table <- table(beat)
  jump <- jump.extra <- 0.18
  
  # Parameters
  extra <- 0.05
  l.ruler <- max(beat) - min(beat) + 2 * extra   # The length of the ruler
  min.ruler <- min(beat) - extra
  max.ruler <- max(beat)  + extra
  h.ruler <- 0.05    # The height of the ruler
  
  # Create matrix
  Pos <- array( dim = c(4 + 5 * length(unique(beat)), 2) )
  
  ## Ruler: polygon in order (1, 2, 3, 4, 1)
  Pos[1, ] <- c( min.ruler, 0)
  Pos[2, ] <- c( min.ruler, h.ruler)
  Pos[3, ] <- c( max.ruler, h.ruler)
  Pos[4, ] <- c( max.ruler, 0)
  
  #######################
  # Canvas
  par( mar = c(0.1, 0.1, 3, 0.1) + 0.1)
  plot( x = c(0.5, 7.15), 
        y = c(-0.5, 3.5),
        type = "n",
        axes = FALSE,
        main = "Finding the mean: where the\n sum of deviations is zero",
        xlab = "",
        ylab = "")
 
  # Draw ruler
  polygon( x = Pos[1:4, 1], 
           y = Pos[1:4, 2], 
           col = plot.colour)
  
  
  # Draw data
  jump <- jump.extra <- 0.18
  for (i in 1:length(beat)){
    points( x = sort(beat)[i], 
            y = jump, 
            pch = 19)
    
    # The arrows
    arrows( x0 = locate.x, 
            y0 = jump, 
            x1 = sort(beat)[i], 
            y1 = jump,
            length = ifelse( abs(locate.x - sort(beat)[i]) > 0.2, 0.15, 0.0), # Arrows when there is enough space
            lty = ifelse(format == "HTML", 
                         1, 
                         ifelse(locate.x - sort(beat)[i] > 0, 1, 5)),
            col = ifelse( locate.x - sort(beat)[i] > 0, 
                          ifelse( format == "HTML", "red", "black"), 
                          ifelse( format == "HTML", "green4", grey(0.2)) ),
            lwd = 2,
            angle = 15)
    
    # The distances on the right-side
    text( x = 6.5, 
          y = jump, 
          sprintf("%.3f", round(sort(beat)[i] - locate.x, 3)),
          col = ifelse( locate.x - sort(beat)[i] > 0, 
                        ifelse( format == "HTML", "red", "black"), 
                        ifelse( format == "HTML", "green4", grey(0.2) ) ),
          adj = 1,
          font = ifelse( (sort(beat)[i] - locate.x) < 0, 2, 3), # ITALIC for positive; BOLD for negative (so - signs more visible)
          cex = 1)
    
    jump <- jump + jump.extra
    
  }
  
  
  # Highlight the mean/mean guess
  lines(x = rep(locate.x, 2), # Vertical line for the mean
        y = c(-0.5, 2.75), 
         col = "grey")
  text(x = locate.x, 
       y = jump + jump.extra, 
       labels = expression(bar(italic(x)) == 2.221),
       cex = 1)
  
  ################
  # The summing
  segments( x0 = 5.2,  # The line under the distance, to sum
            x1 = 6.8,
            y0 = 0)
  
  meanText <- round( sum(sort(beat) - locate.x), 5 )
  if ( abs(meanText) < 0.001) meanText <- 0
                   
  text( x = 6.5, 
        y = -0.4, 
        sprintf("%.4f", meanText),
        adj = 1,
        cex = 0.95)

  text( x = 6.65, 
        y = jump + jump.extra, 
        labels = "Distance",
        adj = 1,
        cex = 0.95)
  text( x = 6.5, 
        y = -0.2, 
        labels = "Sum:",
        adj = 1,
        cex = 1.1)
  
  # Shade summing area on right side (HTML) or box it (PDF)
  if (format =="HTML") {
    polygon ( x = c(5.1, 5.1, 7, 7),
              y = c(-0.7, 3.2, 3.2, -0.75),
              border = NA,
              col = mycol <- rgb(240, 240, 240, max = 255, alpha = 100))
  } else { # PDF
    polygon ( x = c(5.1, 5.1, 5.1, 5.1),
              y = c(-0.7, 3.2, 3.2, -0.75),
              border = "grey",
              lty = 2
              #col = mycol <- rgb(240, 240, 240, max = 255, alpha = 100)
              )
  }
  # base <- 1
  # for (i in 1:length(data.table)){
  #   polygon( x = Pos[(1:5) + base, 1], 
  #            y = Pos[(1:5) + base, 2], 
  #            col = grey(0.4))
  #   
  #   base <- base + 5
  # }
  
  # Draw "number line"
  xLineLabs <- seq( min(beat), max(beat), by = 0.5)
  segments( x0 = xLineLabs, # These are the tick marks on the left side
            y0 = 0,
            y1 = -0.05,
            col = "black")
  text(x = xLineLabs, # The tick mark labels
       y = -0.05,
       labels = xLineLabs,
       cex = 0.9,
       pos = 1,
       col = "black")
  
  
  # Draw invisible dots.
  # Without this, the final image gets transformed straight to the beginning again....
  bit <- 0.1
  delta <- (8 - 4 - 2 * bit)/numberImages # From the initial plots call; the size of the canvas is x-direction
  x0 <- 4 + bit                # The left-most point
  ylow <- 3                  # From initial plot call
  xplot <- x0 * iteration * delta
  points( x = xplot, 
          y = ylow, 
          col = "white")
}

meanCandidates <- c( seq(2, 3, by = 0.05),
                     seq(3, 2, by = -0.05),
                     seq(2.1, 2.3, by = 0.025),
                     rep( mean(GYoung), 20))

