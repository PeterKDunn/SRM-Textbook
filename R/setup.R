library("kableExtra")  # For tables
library("oz")          # For Australia maps in graphics chapter
library("ggplot2")     # Used for plots of Australia
library("NHANES")      # or NHANES data
library("knitr")
library("diagram")     # TRYING this for diagrams
library("DT")          # For displaying tables
library("webshot")     # screen shot of HTML animations
library("plot3D")
library("latticeExtra")
library("leaflet")
library("plotrix")     # Pie charts I think
library("scales")
library("dygraphs")
library("GLMsData")    # For some data sets
library("slickR")
library("plotly")
library("viridis")
library("dplyr")
library("webex") # For inline exercises
library("gifski") # Trying for animations: https://bookdown.org/yihui/rmarkdown-cookbook/animation.html
library("plotfunctions") # For adding images (e.g. icons) to diagrams
#library("exams")


# set global chunk options
options(formatR.arrow=TRUE,width=90)

blueTransparent <- rgb(0, 0, 1, 
                       alpha = 0.2, 
                       maxColorValue = 1)
plot.colour <- blueTransparent

blueTransparent2 <- rgb(0, 0, 0.25, 
                        alpha = 0.2, 
                        maxColorValue = 1)
plot.colour2 <- blueTransparent2

blueTransparent0 <- rgb(0, 0, 1, 
                        alpha = 0.8, 
                        maxColorValue = 1)
plot.colour0 <- blueTransparent0

makeTransparent <- function(someColor, alpha = 100)
{
  newColor<-col2rgb( someColor )
  apply(newColor, 
        2, 
        function(curcoldata){ rgb(red = curcoldata[1], 
                                  green = curcoldata[2],
                                  blue = curcoldata[3],
                                  alpha = alpha, 
                                  maxColorValue = 255)
        }
  )
}

# Environment defaults
foldLaTeXText <- "The answer is given in the online book."


knitr::opts_chunk$set(fig.pos = "hbtp")   # Place tables HERE and so on


# knitr:::is_latex_output()
# knitr:::is_html_output()
# 
# This example from: https://stackoverflow.com/questions/41745170/how-to-do-different-things-in-r-in-bookdown-if-output-is-html-or-latex
# 
# if( knitr:::is_latex_output() ) {
#     xlatex ...
# } else {
#     DT...
# }
# 






# 
# plot.norm <- function(mu, sd, xlab.name="Variable",
#                       new=TRUE,
#                       shade.lo.x=NA, shade.hi.x=NA,
#                       shade.lo.z=NA, shade.hi.z=NA,
#                       show.lo=NA, show.hi=NA,
#                       round.dec=1,
#                       shade.col="wheat",
#                       main="",
#                       width=6, # WAS 3.5
#                       height=width,
#                       type="z",
#                       srt=0,
#                       cex.tickmarks=1,
#                       las=1,
#                       xlim.hi = NA, xlim.lo = NA,
#                       zlim.hi = 3.5, zlim.lo=-zlim.hi,
#                       axis.labels=NULL){
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
#     par(mar=c(2,0,2,0) + 0.1  )
#   }
#   
#   if (!is.na(xlim.hi) ){
#     zlim.hi <- (xlim.hi-mu)/sd
#   }
#   if (!is.na(xlim.lo) ){
#     zlim.lo <- (xlim.lo-mu)/sd
#   }
#   
#   hor <- seq(zlim.lo, zlim.hi, length=250) # z-scores
#   nc <- dnorm(hor, 0, 1) # Normal curve
#   extra <- 0.25 # extra space at ends
#   spacer <- -0.05 # space to other x-axis
#   text.loc.z <- c(-3, -2, -1, 0, 1, 2, 3) 		# Where to place x-axis labels: In terms of z
#   text.loc.x <- round(mu + text.loc.z * sd, round.dec) 		# Where to place x-axis labels: In terms of x 
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
#   # Horizontal axis
#   lines( c(zlim.lo-extra, zlim.hi+extra), 
#          c(0,0),
#          lwd=2 )
#   
#   # Add arrow to axis
#   arrows(0, 0, 3.75, 0, 
#          length=0.15, 
#          angle=20, 
#          lwd=2)
#   
#   # Add line corresponding to the mean (z=0)
#   lines( c(0,0.4) ~ c(0, 0), 
#          lwd=2,
#          col="grey")
#   
#   # Titles
#   title(sub=xlab.name, 
#         line=0)
#   
#   # Label axis;  type  is usually "t" or "z" or is blank (i.e. type="")
#   text(zlim.hi+extra, 0, 
#        pos=3, 
#        adj=0, 
#        type)
#   
#   # Label horizontal axis
#   if ( is.null(axis.labels)){
#     text( text.loc.z, 0, 
#         pos=1, 
#         cex=cex.tickmarks,
#         srt=srt,
#         labels=as.character(text.loc.x) )
#   } else {
#     text( text.loc.z, 0, 
#           pos=1, 
#           cex=cex.tickmarks,
#           srt=srt,
#           labels=axis.labels )
#   }
#   
#   # Add lines to demarcate shading
#   lines(c(shade.lo.z, shade.lo.z), c(0, dnorm(shade.lo.z,0,1)), lwd=2)
#   lines(c(shade.hi.z, shade.hi.z), c(0, dnorm(shade.hi.z,0,1)), lwd=2)
#   
#   # What to shade?
#   if ( !is.na(show.lo) ) {
#     if (is.logical(show.lo) ){
#       if ( show.lo ) {
#         lines( c(shade.lo.z, shade.lo.z), c(spacer, dnorm(shade.lo.x,0,1)))
#         text(shade.lo.z, -0.11, as.character(shade.lo.x) )
#       }
#     } else { # Not logical:  a value/character is supplied
#       lines( c(shade.lo.z, shade.lo.z), c(spacer, dnorm(shade.lo.x,0,1)))
#       text(shade.lo.z, -0.11, as.character(show.lo) )
#     }
#   }
#   
#   if ( !is.na(show.hi) ) {
#     if (is.logical(show.hi) ){
#       if( show.hi ) {
#         lines( c(shade.hi.z, shade.hi.z), c(spacer, dnorm(shade.hi.x,0,1)))
#         text(shade.hi.z, -0.11, as.character(shade.hi.x) )
#       }
#     } else {
#       lines( c(shade.hi.z, shade.hi.z), c(spacer, dnorm(shade.hi.x,0,1)))
#       text(shade.hi.z, -0.11, as.character(show.hi) )
#     }
#   }
#   
#   # Add Shading
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
#   for (i in 1:length(text.loc.z)) {
#     lines( c(text.loc.z[i], text.loc.z[i]),
#            c(0, 0.05*yrange),
#            col="grey")
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
#                        shade.col="wheat",
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
#     par(mar=c(2,0,2,0) + 0.1  )
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
# #  text( text.loc, 0, pos=1, labels=as.character(text.loc), las=las )
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
# 
# 




##############################################################
##############################################################
##############################################################
##############################################################
#source("SixSteps.R")
