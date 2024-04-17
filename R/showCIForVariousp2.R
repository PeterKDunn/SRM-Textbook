par( #mfrow = c(1, 4),
    mar = c(0.25, 0.3, 0.25, 0.3) )

pHat <- 11/25

n <- 25
pVec <- c(0.25, 0.4, 0.6, 0.7)
pMean <- pVec
pStdDev <- sqrt( pHat * (1 - pHat) / n)

# Pre-calculate y-limits
xx <- seq(0, 1, length = 1000)
yy <- max( dnorm(x = xx, 
                 mean = pMean[1], # Just as an example, to set limits
                 sd = pStdDev) )
maxY <- max(yy)



## Canvas
plot( x = c(0, 1),
      y = c(maxY * 2.5, 
            -maxY * 2.15),
      type = "n",
      axes = FALSE,
      ylab = "",
      xlab = expression(Values~of~hat(italic(p))))



### Draw the CI at the bottom
### Draw the CI at the bottom
drawCI <- function(CI, pInCI ){
  # CI has two elements: c(0.2, 0.4) for instance.
  heightCI <- 0.8
  braceWidth <- 0.025
  locateY <- (-maxY * 1.2)
  
  # Line for CI
  lines( x = c( 0, 1),
         y = c(locateY, locateY),
         lwd = 2,
         col = "grey")
  lines( x = CI,
         y = c(locateY, locateY),
         lwd = 4)

  

  # Middle: estimate
  arrows( x0 = mean(CI),
          x1 = mean(CI),
          y0 = locateY - heightCI,
          y1 = 0,
          angle = 15,
          length = 0.1,
          lty = 2,
          lwd = 2)
  #  text(x = mean(CI),
  #       y = locateY - heightCI,
  #       expression(hat(p)),
  #       pos = 1)
  
  # Comments on values of p-hat
  if (pInCI) {
    text(x = pHat,
         y = locateY - 2.75*heightCI,
         bquote( atop(italic(hat(p))==.(pHat)~may~have,
                      come~from~this~value~of~italic(p))) )
  } else{
    text(x = pHat,
         y = locateY - 2.75*heightCI,
         bquote( atop(italic(hat(p))==.(pHat)~unlikely~to,
                      come~from~this~value~of~italic(p))) )
    
  }
  
  
}


drawCI2 <- function(CI, pInCI ){
  # CI has two elements: c(0.2, 0.4) for instance.
  heightCI <- 0.8
  braceWidth <- 0.025
  locateY <- (-maxY * 1.2)
  
  # Left
  lines( x = c( CI[1], CI[1]),
         y = c(locateY - heightCI,
               locateY + heightCI))

  lines( x = c(CI[1], CI[1] + braceWidth),
         y = c(locateY - heightCI,
               locateY - heightCI) )
  lines( x = c(CI[1], CI[1] + braceWidth),
         y = c(locateY + heightCI,
               locateY + heightCI) )

  # Right
  lines( x = c( CI[2], CI[2]),
         y = c(locateY - heightCI,
               locateY + heightCI))

  lines( x = c(CI[2], CI[2] - braceWidth),
         y = c(locateY - heightCI,
               locateY - heightCI) )
  lines( x = c(CI[2], CI[2] - braceWidth),
         y = c(locateY + heightCI,
               locateY + heightCI) )
  
  # Middle: estimate
  arrows( x0 = mean(CI),
          x1 = mean(CI),
          y0 = locateY - heightCI,
          y1 = 0,
          angle = 15,
          length = 0.1,
          lty = 2,
          lwd = 2)
#  text(x = mean(CI),
#       y = locateY - heightCI,
#       expression(hat(p)),
#       pos = 1)
  
  # Comments on values of p-hat
  if (pInCI) {
    text(x = pHat,
         y = locateY - 2.75*heightCI,
         bquote( atop(italic(hat(p))==.(pHat)~may~have,
                        come~from~this~value~of~italic(p))) )
  } else{
    text(x = pHat,
         y = locateY - 2.75*heightCI,
         bquote( atop(italic(hat(p))==.(pHat)~unlikely~to,
                      come~from~this~value~of~italic(p))) )
    
  }
  
  
}

### Draw the normal distributions
drawDistribution <- function(mu, 
                             sd, 
                             pHat,
                             SI, #  The sampling interval to show on the top normal distribution
                             maxY) {
  siLo <- SI[1]
  siHi <- SI[2]
  

  out <- plotNormal(mu,
                    sd,
                    add = TRUE,
                    xlab = expression( Values~of~hat(italic(p))),
                    xlim.lo = 0,
                    xlim.hi = 1,
                    ylim = c(0, 1.2 * yy),
                    # main = if(pHatInOrOut) {
                    #   bquote( atop( If~italic(p) == .(pVec[i])~then~hat(italic(p))~is,
                    #                 likely~to~be~observed) ) } else {
                    #                   bquote( atop( If~italic(p) == .(pVec[i])~then~hat(italic(p))~is,
                    #                                 bold(unlikely)~to~be~observed) )
                    #                 },
                    #ylim = c(0, 7.5),
                    showXaxis = FALSE)
  shadeNormal(out$x, 
              out$y,
              lo = siLo,
              hi = siHi,
              col = plot.colour)
  
  points( x = mu,
          y = 0,
          pch = ifelse(pInCI, 
                       19,
                       4),
          cex = 1.5,
          lwd = 2)
  text(x = mu,
       y = 0,
       bquote(italic(p) == .(mu)),
       pos = 3)
  arrows( x0 = mu,
          x1 = mu,
          y0 = 0,
          y1 = -2,
          length = 0.10,
          angle = 15,
          lwd = 2)
  
  
  arrows( x0 = SI[1],
          x1 = SI[1],
          y0 = maxY * 1.5,
          y1 = -2,
          length = 0.10,
          angle = 15,
          lwd = 2)
  arrows( x0 = SI[2],
          x1 = SI[2],
          y0 = maxY * 1.5,
          y1 = -2,
          length = 0.10,
          angle = 15,
          lwd = 2)

  text(x = mu,
       y = maxY,
       expression( atop(Values~of~hat(italic(p))~that~could~be,
                        reasonably~produced~from~this~italic(p))),
       pos = 3)
  
}

#############
ciLo <- 0.241
ciHi <- 0.639
pHat <- mean( c(ciLo, ciHi) )


pVec[1] <- 0.8

pInCI <- ifelse( (pVec[1] > ciLo) & (pVec[1] < ciHi), 
                 TRUE, 
                 FALSE )


siLo <- pVec[1] - 2 * pStdDev
siHi <- pVec[1] + 2 * pStdDev

drawCI( CI = c(ciLo, ciHi),
        pInCI)
drawDistribution(mu = pVec[1], 
                 sd = 0.1, 
                 pHat = pHat,
                 SI = c(siLo, siHi),
                 maxY)
#box()

################################################################################################################

if (FALSE){
  
for (i in 1:4){
  ciLo <- pVec[i] - 2 * pStdDev
  ciHi <- pVec[i] + 2 * pStdDev
  
  pHatInOrOut <- ifelse( (pHat > ciLo) & (pHat < ciHi), TRUE, FALSE )
  
  # Pre-calculate y-limits
  xx <- seq(0, 1, length = 1000)
  yy <- max( dnorm(x = xx, 
                   mean = pMean[i],
                   sd = pStdDev) )
  
  
  out <- plotNormal(pMean[i],
                    pStdDev,
                    xlab = expression( Values~of~hat(italic(p))),
                    xlim.lo = 0,
                    xlim.hi = 1,
                    ylim = c(0, 1.2 * yy),
                    main = if(pHatInOrOut) {
                      bquote( atop( If~italic(p) == .(pVec[i])~then~hat(italic(p))~is,
                                    likely~to~be~observed) ) } else {
                                      bquote( atop( If~italic(p) == .(pVec[i])~then~hat(italic(p))~is,
                                                    bold(unlikely)~to~be~observed) )
                                    },
                    #ylim = c(0, 7.5),
                    showXaxis = FALSE)
  shadeNormal(out$x, 
              out$y,
              lo = ciLo,
              hi = ciHi,
              col = plot.colour)
  axis(side = 1,
       las = 2,
       at = c(0, 0.25, 0.50, 0.75, 1))
  
  # Mark on p-hat
  lines( x = c(pHat, pHat),
         y = c(0, 1.15 * yy ),
         lwd = 1,
         lty = 1)
  text(x = pHat,
       y = 0.85 * yy,
       cex = 0.95,
       #       labels = expression(Observed~hat(italic(p))),
       #       labels = expression(Observed*":"~hat(italic(p))==0.44 ),
       labels = expression(atop(Observed*":",
                                hat(italic(p))==0.44 ) ),
       pos = ifelse(i < 3, 4, 2) ) #Swap sides depending on value of p
}
}