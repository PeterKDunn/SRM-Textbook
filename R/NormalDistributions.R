shadeNormal <- function(xx, yy, lo, hi, col="blue", outline = FALSE){
  
  xshade <- xx[ (xx >= lo) & ( xx <= hi ) ]
  yshade <- yy[ (xx >= lo) & ( xx <= hi ) ]
  y0 <- rep(0, length(yshade))
  
  polygon( x = c(xshade, rev(xshade) ),
           y = c( yshade, y0),
           col = col)
  
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
                       showX = seq(-3, 3, by = 1) * sd + mu,
                       showXlabels = NULL, # if NULL, use the numbers in showX to place on the horizontal axis; otherwise, give the labels
                       cex.axis = 1, # char expansion for axis text (i.e., labels)
                       round.dec = 1,
                       main = "", # Main title
                       xlab = "", # horizontal axis labels
                       showZ = TRUE, # Whether to show z = -3:3 on the graph or not, using grey vertical lines
                       showZtall = FALSE, # if TRUE, the lines go all the way to the top of the graohl if FALSE, to the normal curve
                       bg = "white", 
                       cex.tickmarks = 1,
                       las = 1,
                       ylim = NA,
                       xlim.hi = mu + 3.5*sd, # Upper x-axis limit
                       xlim.lo = mu - 3.5*sd, # Lower x-axis limit
                       axis.labels = NULL){
  
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





##############################################################
##############################################################
##############################################################
##############################################################




# 
# 
# plot.normZ <- function(mu, sd, xlab.name="Variable",
#                        new=TRUE,
#                        shade.lo.x=NA, shade.hi.x=NA,
#                        shade.lo.z=NA, shade.hi.z=NA,
#                        show.lo=NA, show.hi=NA,
#                        round.dec=1,
#                        shade.col=plot.colour,
#                        main="",
#                        width=6, # WAS 3.5
#                        height=width,
#                        type="z",
#                        las=1,
#                        srt=0,
#                        cex.tickmarks=1,
#                        zlim.hi = 3.5, zlim.lo=-zlim.hi,
#                        axis.labels=NULL){
#   
#   # mu  is the mean of the distn
#   # sd  is the std dev of the distn
#   # xlab.name  is the  xlab  label
#   # new is TRUE by default: a new plot is drawn.  If FALSE, the plot is added to the current device 
#   # shade.lo.z  is the lower shade limit (in terms of z, not x)
#   # shade.hi.z  is the upper shade limit (in terms of z, not x)
#   # show.lo  is a LOGICAL for showing the lower x-score 
#   #   If it is a number, that number is placed at the lo position instead
#   # show.hi  is a LOGICAL for showing the lower x-score explicitly
#   #   If it is a number, that number is placed at the lo position instead
#   # zlim.lo  /zlim.hi  is the lower (upper) limit of z on which to draw
#   # round.dec  is the number of decimals to round to on the shown x-axis
#   #    (full precision used in calculations)
#   # type  is the the type of course, generally "z" or "t", placed as a label on the horizontal axis
#   # las: The  las  parameter in par, for labelling horizontal axis
#   # shade.col  is the shading colour, defaulting to "wheat" (see ?colours)
#   # main  is the main title to use
#   # width  and  height  specify the width and height of the x11 device window
#   
#   #if ( is.na(shade.lo.z) ) {
#   #	warning(" shade.lo.z  must be given.")
#   #}
#   #if (  is.na(shade.hi.z) ) {
#   #	warning(" shade.hi.z  must be given.")
#   #}
#   
#   if ( new ) {
#     #   quartz(width=width,height=height, bg="white")
#     par(mar=c(2, 0, 2, 0) + 0.1  )
#   }
#   
#   if ( is.na(shade.lo.z) ) {
#     shade.lo.z <- (shade.lo.x - mu)/sd
#   }
#   if ( is.na(shade.hi.z) ) {
#     shade.hi.z <- (shade.hi.x - mu)/sd
#   }
#   if (is.na(shade.lo.x) ) {
#     shade.lo.x <- shade.lo.z * sd + mu
#   }
#   if (is.na(shade.hi.x) ) {
#     shade.hi.x <- shade.hi.z * sd + mu
#   }
#   
#   
#   hor <- seq(zlim.lo, zlim.hi, length=250) # z-scores
#   nc <- dnorm(hor, 0, 1) # Normal curve
#   extra <- 0.25 # extra space at ends
#   spacer <- -0.05 # space to other x-axis
#   text.loc <- c(-3, -2, -1, 0, 1, 2, 3) # In terms of z
#   
#   
#   if (new) {
#     plot( nc ~ hor, 
#           axes=FALSE,
#           ylim=c(-0.1, 0.4),
#           xlim=c(zlim.lo-2*extra , zlim.hi+2*extra),
#           lwd=2,
#           xlab="",
#           ylab="",
#           main=main,
#           type="l")
#   }
#   
#   lines( c(zlim.lo-extra, zlim.hi+extra) , c(0,0), lwd=2 )
#   #arrows(0, spacer, 3.75, spacer, length=0.15, angle=20, lwd=2)
#   
#   #lines( c(zlim.lo-extra, zlim.hi+extra) , c(spacer, spacer), lwd=2 )
#   #arrows(0, 0, 3.75, 0, length=0.15, angle=20, lwd=2)
#   
#   lines( c(0,0.4) ~ c(0, 0), lwd=2 )
#   
#   # text(zlim.hi+1.5*extra, spacer, adj=0,"z")
#   #text(zlim.hi-extra, 2*spacer, pos=1, adj=0,xlab.name)
#   title(sub=xlab.name, line=0)
#   
#   #text(zlim.hi+1.5*extra, 0, adj=0,xlab.name)
#   text(zlim.hi+extra, 0, pos=3, adj=0, "z")
#   
#   # Label horizontal axis
#   if ( is.null(axis.labels)){
#     text( text.loc, 0, 
#           pos=1, 
#           cex=cex.tickmarks,
#           srt=srt,
#           labels=as.character(text.loc) )
#   } else {
#     text( text.loc, 0, 
#           pos=1, 
#           cex=cex.tickmarks,
#           srt=srt,
#           labels=axis.labels )
#   }
#   #  text( text.loc, 0, pos=1, labels=as.character(text.loc), las=las )
#   #text( text.loc, spacer, pos=1, 
#   #   labels=as.character(round(text.loc*sd + mu, round.dec)) )
#   
#   
#   lines(c(shade.lo.z, shade.lo.z), c(0, dnorm(shade.lo.z,0,1)), lwd=2)
#   lines(c(shade.hi.z, shade.hi.z), c(0, dnorm(shade.hi.z,0,1)), lwd=2)
#   
#   if ( !is.na(show.lo) ) {
#     if (is.logical(show.lo) ){
#       if ( show.lo ) {
#         lines( c(shade.lo.z, shade.lo.z), c(0, dnorm(shade.lo.z,0,1)))
#         text(shade.lo, -0.11, as.character(shade.lo.z) )
#         #	      text(shade.lo, spacer-150, as.character(shade.lo.z) )
#       }
#     } else { # Not logical:  a value/character is supplied
#       lines( c(shade.lo.z, shade.lo.z), c(0, dnorm(shade.lo.z,0,1)))
#       #      text(shade.lo, spacer-0.05, as.character(show.lo) )
#       #      text(shade.lo, -0.11, as.character(show.lo) )
#     }
#   }
#   
#   if ( !is.na(show.hi) ) {
#     if (is.logical(show.hi) ){
#       if( show.hi ) {
#         lines( c(shade.hi.z, shade.hi.z), c(0, dnorm(shade.hi.z,0,1)))
#         #text(shade.hi.z, -0.11, as.character(shade.hi.z) )
#       }
#     } else {
#       lines( c(shade.hi.z, shade.hi.z), c(0, dnorm(shade.hi.z,0,1)))
#       #text(shade.hi.z, -0.11, as.character(show.hi) )
#     }
#   }
#   
#   # Shading
#   x.poly <- seq( max(zlim.lo, shade.lo.z), 
#                  min(zlim.hi, shade.hi.z), length=100)
#   y.poly <- dnorm( x.poly, 0, 1)
#   
#   x.p <- c( x.poly, rev(x.poly) )
#   y.p <- c( rep(0, length(x.poly)), rev(y.poly) )
#   polygon(x.p, y.p, col=shade.col )
#   
#   # Rug on horizontal axis
#   yrange <- max(nc) - 0
#   for (i in 1:length(text.loc)) {
#     lines( c(text.loc[i], text.loc[i]),
#            c(0, 0.05*yrange),
#            col="grey")
#   } 
# }
# 
# 
# plot.norm <- function(mu, sd, 
#                       xlab.name = "Variable",
#                       new = TRUE,
#                       shade.lo.x = NA, 
#                       shade.hi.x = NA,
#                       shade.lo.z = NA, 
#                       shade.hi.z = NA,
#                       show.lo = NA, 
#                       show.hi = NA,
#                       round.dec = 1,
#                       shade.col = plot.colour,
#                       main = "",
#                       width = 6, # WAS 3.5
#                       height = width,
#                       type = "z",
#                       srt = 0,
#                       bg = "white", 
#                       cex.tickmarks = 1,
#                       las = 1,
#                       xlim.hi = NA, 
#                       xlim.lo = NA,
#                       zlim.hi = 3.5, 
#                       zlim.lo = -zlim.hi,
#                       axis.labels = NULL){
#   
#   # mu  is the mean of the distn
#   # sd  is the std dev of the distn
#   # xlab.name  is the  xlab  label
#   # new is TRUE by default: a new plot is drawn.  If FALSE, the plot is added to the current device 
#   # shade.lo.x  is the lower shade limit (in terms of x, not z)
#   # shade.hi.x  is the upper shade limit (in terms of x, not z)
#   # shade.lo.z  is the lower shade limit (in terms of z, not x)
#   # shade.hi.z  is the upper shade limit (in terms of z, not x)
#   # show.lo  is a LOGICAL for showing the lower x-score 
#   #   If it is a number, that number is placed at the lo position instead
#   # show.hi  is a LOGICAL for showing the lower x-score explicitly
#   #   If it is a number, that number is placed at the lo position instead
#   # zlim.lo  /zlim.hi  is the lower (upper) limit of z on which to draw
#   # round.dec  is the number of decimals to round to on the shown x-axis
#   #    (full precision used in calculations)
#   # type  is the the type of course, generally "z" or "t", placed as a label on the horizontal axis
#   # las: The  las  parameter in par, for labelling horizontal axis
#   # shade.col  is the shading colour, defaulting to "wheat" (see ?colours)
#   # srt: String rotation of the x-axis labels.
#   # cex.tickmarks: The value of  cex  for the tickmark labels
#   # main  is the main title to use
#   # width  and  height  specify the width and height of the x11 device window
#   
#   if ( is.na(shade.lo.x) & is.na(shade.lo.z) ) {
#     warning("One of  shade.lo.x  and shade.lo.z  must be given.")
#   }
#   if ( is.na(shade.hi.x) & is.na(shade.hi.z) ) {
#     warning("One of  shade.hi.x  and shade.hi.z  must be given.")
#   }
#   
#   if ( new ) {
#     par(mar = c(2, 0, 2, 0) + 0.1  )
#   }
#   
#   if (!is.na(xlim.hi) ){
#     zlim.hi <- (xlim.hi - mu)/sd
#   }
#   if (!is.na(xlim.lo) ){
#     zlim.lo <- (xlim.lo - mu)/sd
#   }
#   
#   hor <- seq(zlim.lo, 
#              zlim.hi, 
#              length = 250) # z-scores
#   nc <- dnorm(hor, 0, 1) # Normal curve
#   extra <- 0.25 # extra space at ends
#   spacer <- -0.05 # space to other x-axis
#   text.loc.z <- c(-3, -2, -1, 0, 1, 2, 3) 		# Where to place x-axis labels: In terms of z
#   text.loc.x <- round(mu + text.loc.z * sd, 
#                       round.dec) 		# Where to place x-axis labels: In terms of x 
#   
#   if ( is.na(shade.lo.z) ) {
#     shade.lo.z <- (shade.lo.x - mu)/sd
#   }
#   if ( is.na(shade.hi.z) ) {
#     shade.hi.z <- (shade.hi.x - mu)/sd
#   }
#   if (is.na(shade.lo.x) ) {
#     shade.lo.x <- shade.lo.z * sd + mu
#   }
#   if (is.na(shade.hi.x) ) {
#     shade.hi.x <- shade.hi.z * sd + mu
#   }
#   
#   if (new) {
#     plot( nc ~ hor, 
#           axes = FALSE,
#           bg = bg,
#           ylim = c(-0.1, 0.4),
#           xlim = c(zlim.lo - 2 * extra , 
#                    zlim.hi + 2 * extra),
#           lwd = 2,
#           xlab = "",
#           ylab = "",
#           main = main,
#           type = "l")
#   }
#   
#   # Horizontal axis
#   lines( c(zlim.lo - extra, 
#            zlim.hi + extra), 
#          c(0, 0),
#          lwd = 2 )
#   
#   # Add arrow to axis
#   arrows(0, 0, 3.75, 0, 
#          length = 0.15, 
#          angle = 20, 
#          lwd = 2)
#   
#   # Add line corresponding to the mean (z=0)
#   lines( c(0, 0.4) ~ c(0, 0), 
#          lwd = 2,
#          col = "grey")
#   
#   # Titles
#   title(sub = xlab.name, 
#         line = 0)
#   
#   # Label axis;  type  is usually "t" or "z" or is blank (i.e. type="")
#   text(zlim.hi + extra, 0, 
#        pos  =3, 
#        adj = 0, 
#        type)
#   
#   # Label horizontal axis
#   if ( is.null(axis.labels)){
#     text( text.loc.z, 0, 
#           pos = 1, 
#           cex = cex.tickmarks,
#           srt = srt,
#           labels = as.character(text.loc.x) )
#   } else {
#     text( text.loc.z, 0, 
#           pos = 1, 
#           cex = cex.tickmarks,
#           srt = srt,
#           labels = axis.labels )
#   }
#   
#   # Add lines to demarcate shading
#   lines(c(shade.lo.z, shade.lo.z), 
#         c(0, dnorm(shade.lo.z, 0, 1)), 
#         lwd = 2)
#   lines(c(shade.hi.z, shade.hi.z), 
#         c(0, dnorm(shade.hi.z, 0, 1)), 
#         lwd = 2)
#   
#   # What to shade?
#   if ( !is.na(show.lo) ) {
#     if (is.logical(show.lo) ){
#       if ( show.lo ) {
#         lines( c(shade.lo.z, shade.lo.z), 
#                c(spacer, dnorm(shade.lo.x, 0, 1)))
#         text(shade.lo.z, -0.11, 
#              as.character(shade.lo.x) )
#       }
#     } else { # Not logical:  a value/character is supplied
#       lines( c(shade.lo.z, shade.lo.z), 
#              c(spacer, dnorm(shade.lo.x, 0, 1)))
#       text(shade.lo.z, -0.11, 
#            as.character(show.lo) )
#     }
#   }
#   
#   if ( !is.na(show.hi) ) {
#     if (is.logical(show.hi) ){
#       if( show.hi ) {
#         lines( c(shade.hi.z, shade.hi.z), 
#                c(spacer, dnorm(shade.hi.x, 0, 1)))
#         text(shade.hi.z, -0.11, 
#              as.character(shade.hi.x) )
#       }
#     } else {
#       lines( c(shade.hi.z, shade.hi.z), 
#              c(spacer, dnorm(shade.hi.x, 0, 1)))
#       text(shade.hi.z, -0.11, 
#            as.character(show.hi) )
#     }
#   }
#   
#   # Add Shading
#   x.poly <- seq( max(zlim.lo, shade.lo.z), 
#                  min(zlim.hi, shade.hi.z), 
#                  length = 100)
#   y.poly <- dnorm( x.poly, 0, 1)
#   
#   x.p <- c( x.poly, rev(x.poly) )
#   y.p <- c( rep(0, length(x.poly)), rev(y.poly) )
#   polygon(x.p, y.p, 
#           col = shade.col )
#   
#   # Rug on horizontal axis
#   yrange <- max(nc) - 0
#   for (i in 1:length(text.loc.z)) {
#     lines( c(text.loc.z[i], text.loc.z[i]),
#            c(0, 0.05 * yrange),
#            col = "grey")
#   } 
# }
# 
# 
# 
# 
# 
# ##############################################################
# ##############################################################
# ##############################################################
# ##############################################################
# 
# 
# 
# 
# 
# 
# plot.normZ <- function(mu, sd, xlab.name="Variable",
#                        new=TRUE,
#                        shade.lo.x=NA, shade.hi.x=NA,
#                        shade.lo.z=NA, shade.hi.z=NA,
#                        show.lo=NA, show.hi=NA,
#                        round.dec=1,
#                        shade.col=plot.colour,
#                        main="",
#                        width=6, # WAS 3.5
#                        height=width,
#                        type="z",
#                        las=1,
#                        srt=0,
#                        cex.tickmarks=1,
#                        zlim.hi = 3.5, zlim.lo=-zlim.hi,
#                        axis.labels=NULL){
#   
#   # mu  is the mean of the distn
#   # sd  is the std dev of the distn
#   # xlab.name  is the  xlab  label
#   # new is TRUE by default: a new plot is drawn.  If FALSE, the plot is added to the current device 
#   # shade.lo.z  is the lower shade limit (in terms of z, not x)
#   # shade.hi.z  is the upper shade limit (in terms of z, not x)
#   # show.lo  is a LOGICAL for showing the lower x-score 
#   #   If it is a number, that number is placed at the lo position instead
#   # show.hi  is a LOGICAL for showing the lower x-score explicitly
#   #   If it is a number, that number is placed at the lo position instead
#   # zlim.lo  /zlim.hi  is the lower (upper) limit of z on which to draw
#   # round.dec  is the number of decimals to round to on the shown x-axis
#   #    (full precision used in calculations)
#   # type  is the the type of course, generally "z" or "t", placed as a label on the horizontal axis
#   # las: The  las  parameter in par, for labelling horizontal axis
#   # shade.col  is the shading colour, defaulting to "wheat" (see ?colours)
#   # main  is the main title to use
#   # width  and  height  specify the width and height of the x11 device window
#   
#   #if ( is.na(shade.lo.z) ) {
#   #	warning(" shade.lo.z  must be given.")
#   #}
#   #if (  is.na(shade.hi.z) ) {
#   #	warning(" shade.hi.z  must be given.")
#   #}
#   
#   if ( new ) {
#     #   quartz(width=width,height=height, bg="white")
#     par(mar=c(2, 0, 2, 0) + 0.1  )
#   }
#   
#   if ( is.na(shade.lo.z) ) {
#     shade.lo.z <- (shade.lo.x - mu)/sd
#   }
#   if ( is.na(shade.hi.z) ) {
#     shade.hi.z <- (shade.hi.x - mu)/sd
#   }
#   if (is.na(shade.lo.x) ) {
#     shade.lo.x <- shade.lo.z * sd + mu
#   }
#   if (is.na(shade.hi.x) ) {
#     shade.hi.x <- shade.hi.z * sd + mu
#   }
#   
#   
#   hor <- seq(zlim.lo, zlim.hi, length=250) # z-scores
#   nc <- dnorm(hor, 0, 1) # Normal curve
#   extra <- 0.25 # extra space at ends
#   spacer <- -0.05 # space to other x-axis
#   text.loc <- c(-3, -2, -1, 0, 1, 2, 3) # In terms of z
#   
#   
#   if (new) {
#     plot( nc ~ hor, 
#           axes=FALSE,
#           ylim=c(-0.1, 0.4),
#           xlim=c(zlim.lo-2*extra , zlim.hi+2*extra),
#           lwd=2,
#           xlab="",
#           ylab="",
#           main=main,
#           type="l")
#   }
#   
#   lines( c(zlim.lo-extra, zlim.hi+extra) , c(0,0), lwd=2 )
#   #arrows(0, spacer, 3.75, spacer, length=0.15, angle=20, lwd=2)
#   
#   #lines( c(zlim.lo-extra, zlim.hi+extra) , c(spacer, spacer), lwd=2 )
#   #arrows(0, 0, 3.75, 0, length=0.15, angle=20, lwd=2)
#   
#   lines( c(0,0.4) ~ c(0, 0), lwd=2 )
#   
#   # text(zlim.hi+1.5*extra, spacer, adj=0,"z")
#   #text(zlim.hi-extra, 2*spacer, pos=1, adj=0,xlab.name)
#   title(sub=xlab.name, line=0)
#   
#   #text(zlim.hi+1.5*extra, 0, adj=0,xlab.name)
#   text(zlim.hi+extra, 0, pos=3, adj=0, "z")
#   
#   # Label horizontal axis
#   if ( is.null(axis.labels)){
#     text( text.loc, 0, 
#           pos=1, 
#           cex=cex.tickmarks,
#           srt=srt,
#           labels=as.character(text.loc) )
#   } else {
#     text( text.loc, 0, 
#           pos=1, 
#           cex=cex.tickmarks,
#           srt=srt,
#           labels=axis.labels )
#   }
#   #  text( text.loc, 0, pos=1, labels=as.character(text.loc), las=las )
#   #text( text.loc, spacer, pos=1, 
#   #   labels=as.character(round(text.loc*sd + mu, round.dec)) )
#   
#   
#   lines(c(shade.lo.z, shade.lo.z), c(0, dnorm(shade.lo.z,0,1)), lwd=2)
#   lines(c(shade.hi.z, shade.hi.z), c(0, dnorm(shade.hi.z,0,1)), lwd=2)
#   
#   if ( !is.na(show.lo) ) {
#     if (is.logical(show.lo) ){
#       if ( show.lo ) {
#         lines( c(shade.lo.z, shade.lo.z), c(0, dnorm(shade.lo.z,0,1)))
#         text(shade.lo, -0.11, as.character(shade.lo.z) )
#         #	      text(shade.lo, spacer-150, as.character(shade.lo.z) )
#       }
#     } else { # Not logical:  a value/character is supplied
#       lines( c(shade.lo.z, shade.lo.z), c(0, dnorm(shade.lo.z,0,1)))
#       #      text(shade.lo, spacer-0.05, as.character(show.lo) )
#       #      text(shade.lo, -0.11, as.character(show.lo) )
#     }
#   }
#   
#   if ( !is.na(show.hi) ) {
#     if (is.logical(show.hi) ){
#       if( show.hi ) {
#         lines( c(shade.hi.z, shade.hi.z), c(0, dnorm(shade.hi.z,0,1)))
#         #text(shade.hi.z, -0.11, as.character(shade.hi.z) )
#       }
#     } else {
#       lines( c(shade.hi.z, shade.hi.z), c(0, dnorm(shade.hi.z,0,1)))
#       #text(shade.hi.z, -0.11, as.character(show.hi) )
#     }
#   }
#   
#   # Shading
#   x.poly <- seq( max(zlim.lo, shade.lo.z), 
#                  min(zlim.hi, shade.hi.z), length=100)
#   y.poly <- dnorm( x.poly, 0, 1)
#   
#   x.p <- c( x.poly, rev(x.poly) )
#   y.p <- c( rep(0, length(x.poly)), rev(y.poly) )
#   polygon(x.p, y.p, col=shade.col )
#   
#   # Rug on horizontal axis
#   yrange <- max(nc) - 0
#   for (i in 1:length(text.loc)) {
#     lines( c(text.loc[i], text.loc[i]),
#            c(0, 0.05*yrange),
#            col="grey")
#   } 
# }
# 
