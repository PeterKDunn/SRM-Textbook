showEmpRule <- function(z){
  zseq <- seq(-4, 4, 
              by = 0.1)
  dseq <- dnorm(zseq)
  
  plot( dseq ~ zseq, 
        xlim = c(-4, 4),
        ylim = c(0, max(dseq)),
        lwd = 2,
        xlab = "Number of standard deviations from the mean",
        ylab = "",
        type = "l",
        col = "blue",
        axes = FALSE)
  axis(side = 1, 
       at = seq(-3, 3, by = 1) )
  abline(h = 0, 
         lwd = 1,
         col = "grey")
  abline(v = 0,
         lwd = 1,
         col = "grey")
  
  if (z == 1) {
    pEmp <- "68%"
    pEdge <- "16%"
    title( main = "One standard deviation\nfrom the mean")
  }
  if (z == 2) {
    pEmp <- "95%"
    pEdge <- "2.5%"
    title( main = "Two standard deviations\nfrom the mean")
  }
  if (z == 3) {
    pEmp <- "99.7%"
    pEdge <- "0.015%"
    title( main = "Three standard deviations\nfrom the mean")
  }
  
  # Lines
  abline(v = z, 
         col = "grey")
  abline(v = -z, 
         col = "grey")
  
  # Shading
  zSelect <- (zseq <= z) & (zseq >= (-z) )

  polygon( x = c( zseq[zSelect],                 rev( zseq[zSelect] ) ),
           y = c( rep(0, length(zseq[zSelect])), rev( dseq[zSelect] ) ),
           border = "blue",
           lwd = 2,
           col = rgb(0, 0, 100, 
	             alpha = 50, 
		     maxColorValue = 255))

  # Labelling: Central bit
  text(   x = 0, 
          y = max(dseq)/3, 
          labels = pEmp,  
          pos = 3, 
          cex = 1.1)
  # Labelling: Right bit
  text(   x = 3.2, 
          y = max(dseq)/2 - 0.02, 
          labels = pEdge, 
          pos = 3)
  # Labelling: Left bit
  text(  x = -3.2, 
         y = max(dseq)/2 - 0.02, 
         labels = pEdge, 
         pos = 3)
  
  # Arrows
  fiddleFactor <- 0.65
  if (z == 2) fiddleFactor <- 0.72
  if (z == 3) fiddleFactor <- 0.9
  arrows( x0 = 3.2, 
          y0 = 0.45 * max(dseq), 
          x1 = mean( c(4, z) ) * fiddleFactor, 
          y1 = (dseq[z == zseq]) * 0.16,
          length = 0.1,
          lwd = 2,
          angle = 15)
  arrows(x0 = -3.2, 
         y0 = 0.45 * max(dseq), 
         x1 = mean( c(-4, -z) ) * fiddleFactor, 
         y1 = (dseq[z == zseq]) * 0.16,
         length = 0.1,
         lwd = 2,
         angle = 15)
 
}
