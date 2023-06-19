shadeNormal <- function(xx, yy, lo, hi, 
                        col = "blue", #Shading colour
                        density = NULL,
                        angle = 45,
                        outline = FALSE){
  
  xshade <- xx[ (xx >= lo) & ( xx <= hi ) ]
  yshade <- yy[ (xx >= lo) & ( xx <= hi ) ]
  y0 <- rep(0, length(yshade))
  
  if ( !is.na(col) ){
    polygon( x = c(xshade, rev(xshade) ),
             y = c( yshade, y0),
             col = col)
  }
  if ( !is.null(density)){
    polygon( x = c(xshade, rev(xshade) ),
             y = c( yshade, y0),
             col = NA,
             density = density,
             angle = angle)
  }
  
  if (outline) { # Draw lines at each end of the shading region
    lo.ShadeAt <- min(which(out1$x > lo))
    hi.ShadeAt <- max(which(out1$x < hi))
    
    lines( x = c(lo, lo),
           y = c(0, yy[lo.ShadeAt]))
    lines( x = c(hi, hi),
           y = c(0, yy[hi.ShadeAt]))
  }
}

plotNormal <- function(mu, 
                       sd,
                       showX = seq(-3, 3, by = 1) * sd + mu, # The tick marks
                       showXlabels = NULL, # if NULL, use the numbers in showX to place on the horizontal axis; otherwise, give the labels
                       showXaxis = TRUE, # If FALSE, then no bottom axis is shown at all 
                       xlim.hi = mu + 3.5*sd, # Upper x-axis limit
                       xlim.lo = mu - 3.5*sd, # Lower x-axis limit
                       cex.axis = 1, # char expansion for axis text (i.e., labels)
                       round.dec = 1,
                       main = "", # Main title
                       xlab = "", # horizontal axis labels
                       showZ = TRUE, # Whether to show z = -3:3 on the graph or not, using grey vertical lines
                       showZtall = FALSE, # if TRUE, the lines go all the way to the top of the graph; if FALSE, to the normal curve
                       bg = "white", 
                       cex.tickmarks = 1,
                       las = 1,
                       ylim = NA,
                       axis.labels = NULL,
                       add = FALSE){
  
  # mu  is the mean of the distn
  # sd  is the std dev of the distn
  # round.dec  is the number of decimals to round to on the shown x-axis
  #    (full precision used in calculations)
  # las: The  las  parameter in par, for labelling horizontal axis
  # srt: String rotation of the x-axis labels.
  # cex.tickmarks: The value of  cex  for the tickmark labels
  # main  is the main title to use

  hor <- seq(xlim.lo, 
             xlim.hi, 
             length = 500)

  nc <- dnorm(hor, 
              mean = mu,
              sd = sd)

  extra <- 0.25 # extra space at ends
  
  if (add) {
    lines( nc ~ hor,
          bg = bg,
          ylim = switch( any(is.na(ylim)) + 1, ylim, c(0, max(nc))), # Since ifelse fails to return NULL
          xlim = c(xlim.lo, xlim.hi),
          lwd = 2,
          xlab = xlab,
          ylab = "",
          main = main)
    
  } else {
    plot( nc ~ hor, 
            axes = FALSE,
            bg = bg,
            ylim = switch( any(is.na(ylim)) + 1, ylim, c(0, max(nc))), # Since ifelse fails to return NULL
            xlim = c(xlim.lo, xlim.hi),
            lwd = 2,
            xlab = xlab,
            ylab = "",
            main = main,
            type = "l")
  }
  if( showXaxis) {
    if (is.null(showXlabels)) {
      axis(side = 1,
           at = showX,
           las = las,
           labels = round(showX, round.dec))
    } else {
      axis(side = 1,
           at = showX,
           las = las,
           cex.axis = cex.axis,
           labels = showXlabels)
    }
  }

  arrows( x0 = xlim.lo, 
          x1 = xlim.hi,
          y0 = 0,
          y1 = 0,
          length = 0.125, 
          angle = 20, 
          lwd = 2)
  if (showZ) {
    if (showZtall) {
      abline( v = seq(-3, 3, by = 1) * sd + mu,
              col = "grey")
    } else {
      for (z in (-3:3)) { # Do one vertical line at a time
         xVertLines <- z * sd + mu
         yVertLines <- dnorm( xVertLines, mean = mu, sd = sd )
         lines( x = c( xVertLines, xVertLines),
                y = c(0, yVertLines),
                col = "grey")
      }
    }
  }

  
  invisible( return( list(y = nc, 
                          x = hor)) )
}



