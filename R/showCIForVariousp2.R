
### Draw the CI at the bottom

drawCI <- function(CI, pInCI, locateY, p ){
  # CI has two elements: c(0.2, 0.4) for instance.
  heightCI <- 0.8
  braceWidth <- 0.025

  
  # Line for CI
  lines( x = c( 0, 1),
         y = c(locateY, locateY),
         lwd = 2,
         col = "grey")
  lines( x = CI,
         y = c(locateY, locateY),
         lwd = 6)
  text( x = mean(CI),
        y = locateY - 0.5,
        expression( The~CI*":"~values~of~italic(p)~that~could~produce~hat(italic(p))),
        pos = 1)
  arrows( x0 = CI[1],
          x1 = CI[2],
          y0 = locateY - 0.7,
          y1 = locateY - 0.7,
          code = 3,
          angle = 15,
          length = 0.1)
  
  # Tickmarks
  xTick <- seq(0, 1, 
               by = 0.1)
  points(x = xTick,
         y = rep(locateY, length(xTick)),
         col = "grey",
         cex = 2,
         pch = 20)
  text(x = xTick[1], 
       y = locateY,
       pos = 1,
       label = "0")
  text(x = xTick[length(xTick)], 
       y = locateY,
       pos = 1,
       label = "1")
  
  

  # Middle: estimate
  # arrows( x0 = mean(CI),
  #         x1 = mean(CI),
  #         y0 = locateY,
  #         y1 = 0,
  #         angle = 15,
  #         length = 0.1,
  #         lty = 2,
  #         lwd = 2)
  #  text(x = mean(CI),
  #       y = locateY - heightCI,
  #       expression(hat(p)),
  #       pos = 1)
  
  # Comments on values of p-hat
  if (pInCI) {
    title(main = bquote( atop(italic(hat(p))==.(pHat)~bold(may)~bold(have)~been,
                              observed~when~italic(p)==.(p)) ) )
  } else{
    title(main = bquote( atop(italic(hat(p))==.(pHat)~bold(unlikely)~to~be,
                              observed~when~italic(p)==.(p)) ) )
  }
  

}


### Draw the normal distributions
drawDistribution <- function(mu, 
                             sd, 
                             pHat,
                             SI, #  The sampling interval to show on the top normal distribution
                             maxY,
                             locateY) {
  siLo <- SI[1]
  siHi <- SI[2]
  

  out <- plotNormal(mu,
                    sd,
                    add = TRUE,
                    xlab = expression( Values~of~hat(italic(p))),
                    xlim.lo = 0,
                    xlim.hi = 1,
                    ylim = c(0, 1.35 * yy),
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
              col = ifelse(pInCI,
                           plot.colour,
                           grey(0.9)) )
  
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
          y1 = locateY,
          col = ifelse(pInCI, 
                       "black",
                       "grey"),
          length = 0.10,
          angle = 15,
          lwd = 2)
  
  
  segments( x0 = SI[1],
          x1 = SI[1],
          y0 = maxY * 1.15,
          y1 = 0,
          lwd = 2)
  segments( x0 = SI[2],
          x1 = SI[2],
          y0 = maxY * 1.15,
          y1 = 0,
          lwd = 2)

  text(x = mu,
       y = maxY,
       bquote( atop(Values~of~hat(italic(p))~that~could~be,
                        produced~from~italic(p)==.(mu))),
       pos = 3)
 
    arrows(x0 = SI[1],
         x1 = SI[2],
         y0 = maxY * 1.05,
         y1 = maxY * 1.05,
         angle = 15,
         code = 3,
         length = 0.1,
         lwd = 2)
  
  text(x = pHat,
       y = -1.5,
       expression(hat(italic(p))),
       pos = 1)
  arrows(x0 = pHat,
         x1 = pHat,
         y0 = -1.5,
         y1 = 0,
         lwd = 2,
         col = ifelse(pInCI,
                      "black",
                      "grey"),
         angle = 15,
         length = 0.13)
  points(x = pHat,
         y = 0,
         pch = 19)
}
