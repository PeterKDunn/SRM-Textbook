showCIrelationships <- function(type = "sampling"){ # Either  "sampling"  or  "confidence"


  normalTitle <- ifelse(type == "sampling",
                        expression(
                          atop( bold(Sample)*":"~Values~of~hat(italic(p))~likely~to~be,
                                produced~with~the~given~value~of~italic(p) )),
                        expression(
                          atop( bold(Population)*":"~Values~of~italic(p)~likely~to~have,
                                produced~the~given~value~of~italic(hat(p)) )) 
                        )
  
  
      ### ADD FIRST NORMAL
out1 <- plotNormal(mu = 0, 
                   sd = 1,
                   ylim = c(-0.50, 0.45),
                   showXaxis = FALSE,
                   main = normalTitle )

# Tick for mean
lines( x = c(0, 0),
       y = c(0, -0.05) )


# Axis label
text(x = 3.1, 
     y = 0, 
     label = ifelse( type == "sampling",
                     expression( Values~of~hat(italic(p)) ),
                     expression( Values~of~italic(p) ) ),
                     cex = 0.95,
     adj = c(0.5, -0.25) )

shadeNormal(out1$x,
            out1$y,
            lo = -2,
            hi = 2,
            col = plot.colour)
### ADD KNOWN
points( x = 0,
        y = -0.40,
        pch = 19)

whatIsKnown <- ifelse( type == "sampling",
                       expression(bold(Population)*":"~Value~of~italic(p)~known),
                       expression(bold(Sample)*":"~Value~of~hat(italic(p))~known)
                       )

text(x = 0,
     y = -0.40,
     label = whatIsKnown,
     pos = 1)


## ADD SAMPLES and ARROWS
points( x = c(-2, -0.5, 0.9, 1.2, 1.6),
        y = rep(0, 5),
        pch = 19,
        cex = 0.7)
arrows(x0 = 0,
       x1 = -2,
       y0 = -0.40,
       y1 = 0,
       angle = 15,
       length = 0.15,
       code = ifelse(type == "sampling",
                     2, 
                     1))
arrows(x0 = 0,
       x1 = -0.5,
       y0 = -0.40,
       y1 = 0,
       angle = 15,
       length = 0.15,
       code = ifelse(type == "sampling",
                     2, 
                     1))
arrows(x0 = 0,
       x1 = 0.9,
       y0 = -0.4,
       y1 = 0,
       angle = 15,
       length = 0.15,
       code = ifelse(type == "sampling",
                     2, 
                     1))
arrows(x0 = 0,
       x1 = 1.2,
       y0 = -0.40,
       y1 = 0,
       angle = 15,
       length = 0.15,
       code = ifelse(type == "sampling",
                     2, 
                     1))

arrows(x0 = 0,
       x1 = 1.6,
       y0 = -0.40,
       y1 = 0,
       angle = 15,
       length = 0.15,
       code = ifelse(type == "sampling",
                     2, 
                     1))

polygon( x = c(-4, 4, 4, -4),
         y = c(-0.15, -0.15, -0.25, -0.25),
         border = NA, # No borders
         col =  "#FFFFFFD9")

text(x = 0,
     y = -0.2,
     label = ifelse( type == "sampling",
                     expression(Various~samples~give~different~estimates~of~italic(p)),
                     expression(Various~values~of~italic(p)~may~have~produced~the~observed~value~of~hat(italic(p))) )
)


# ADD CI
arrows( x0 = -2,
        x1 = 2,
        y0 = 0.035,
        y1 = 0.035,
        length = 0.10,
        angle = 15,
        code = 3)
text( x = 0,
      y = 0.025,
      pos = 3,
      cex = 0.95,
      label = ifelse(type == "sampling", 
                     "95% sampling interval",
                     "95% confidence interval") )


}

# 
# 
# ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### 
# 
# ### ADD SECOND NORMAL
# out2 <- plotNormal(mu = 0, 
#                    sd = 1,
#                    ylim = c(-0.50, 0.45),
#                    showXaxis = FALSE,
#                    main = expression(
#                      atop( bold(Population)*":"~Values~of~italic(p)~that~may,
#                            have~produced~given~value~of~hat(italic(p)) )
#                    ) )
# text(0, 0.44, 
#      cex = 1.0,
#      expression(Any~one~bold(could)~be~the~actual~value~of~italic(p)*ldots) )
# 
# text(3.1, 0, 
#      expression( italic(p) ),
#      cex = 0.95,
#      adj = c(0.5, -0.25) )
# shadeNormal(out2$x,
#             out2$y,
#             lo = -2,
#             hi = 2,
#             col = plot.colour)
# 
# ### ADD KNOWN
# points( x = 0,
#         y = -0.40,
#         pch = 19)
# text(x = 0,
#      y = -0.40,
#      expression(bold(Sample)*":"~Value~of~hat(italic(p))~known),
#      pos = 1)
# 
# 
# ## ADD SAMPLES
# points( x = c(-1.7, -0.2, 0.3, 0.9, 1.9),
#         y = rep(0, 5),
#         pch = 19,
#         cex = 0.7)
# diagram::straightarrow( from = c(-1.7, 0),
#                         to = c(0, -0.4),
#                         segment = c(0, 0.85),
#                         lwd = 1,
#                         angle = 15,
#                         arr.length = 0.30,
#                         arr.pos = 0.85,
#                         arr.type = "simple")
# diagram::straightarrow( from = c(-0.2, 0),
#                         to = c(0, -0.4),
#                         segment = c(0, 0.85),
#                         lwd = 1,
#                         angle = 15,
#                         arr.length = 0.30,
#                         arr.pos = 0.85,
#                         arr.type = "simple")
# diagram::straightarrow( from = c(0.3, 0),
#                         to = c(0, -0.4),
#                         segment = c(0, 0.85),
#                         lwd = 1,
#                         angle = 15,
#                         arr.length = 0.30,
#                         arr.pos = 0.85,
#                         arr.type = "simple")
# 
# diagram::straightarrow( from = c(0.9, 0),
#                         to = c(0, -0.4),
#                         segment = c(0, 0.85),
#                         lwd = 1,
#                         angle = 15,
#                         arr.length = 0.30,
#                         arr.pos = 0.85,
#                         arr.type = "simple")
# diagram::straightarrow( from = c(1.9, 0),
#                         to = c(0, -0.4),
#                         segment = c(0, 0.85),
#                         lwd = 1,
#                         angle = 15,
#                         arr.length = 0.30,
#                         arr.pos = 0.85,
#                         arr.type = "simple")
# polygon( x = c(-4, 4, 4, -4),
#          y = c(-0.15, -0.15, -0.25, -0.25),
#          border = NA, # No borders
#          col =  "#FFFFFFD9")
# text(x = 0,
#      y = -0.2,
#      expression(Various~populations~could~give~this~value~of~hat(italic(p))) )
# 
# 
# # ADD CI
# arrows( x0 = -2,
#         x1 = 2,
#         y0 = 0.025,
#         y1 = 0.025,
#         length = 0.10,
#         angle = 15,
#         code = 3)
# text( x = 0,
#       y = 0.025,
#       pos = 3,
#       cex = 0.95,
#       "95% confidence interval")

