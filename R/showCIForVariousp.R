# ### ADD FIRST NORMAL
# out1 <- plotNormal(mu = 0, 
#                    sd = 1,
#                    ylim = c(-0.50, 0.45),
#                    showXaxis = FALSE,
#                    main = expression(
#                      atop( bold(Sample)*":"~Values~of~hat(italic(p))~likely~to~be,
#                            produced~with~the~given~value~of~italic(p) )
#                    ) )
# text(3.1, 0, 
#      expression( hat(italic(p)) ),
#      cex = 0.95,
#      adj = c(0.5, -0.25) )
# 
# shadeNormal(out1$x,
#             out1$y,
#             lo = -2,
#             hi = 2,
#             col = plot.colour)
# ### ADD KNOWN
# points( x = 0,
#         y = -0.40,
#         pch = 19)
# text(x = 0,
#      y = -0.40,
#      expression(bold(Population)*":"~Value~of~italic(p)~known),
#      pos = 1)
# 
# 
# ## ADD SAMPLES
# points( x = c(-2, -0.5, 0.9, 1.2, 1.6),
#         y = rep(0, 5),
#         pch = 19,
#         cex = 0.7)
# arrows(x0 = 0,
#        x1 = -2,
#        y0 = -0.40,
#        y1 = 0,
#        angle = 15,
#        length = 0.10)
# arrows(x0 = 0,
#        x1 = -0.5,
#        y0 = -0.40,
#        y1 = 0,
#        angle = 15,
#        length = 0.10)
# arrows(x0 = 0,
#        x1 = 0.9,
#        y0 = -0.4,
#        y1 = 0,
#        angle = 15,
#        length = 0.10)
# arrows(x0 = 0,
#        x1 = 1.2,
#        y0 = -0.40,
#        y1 = 0,
#        angle = 15,
#        length = 0.10)
# 
# arrows(x0 = 0,
#        x1 = 1.6,
#        y0 = -0.40,
#        y1 = 0,
#        angle = 15,
#        length = 0.10)
# polygon( x = c(-4, 4, 4, -4),
#          y = c(-0.15, -0.15, -0.25, -0.25),
#          border = NA, # No borders
#          col =  "#FFFFFFD9")
# 
# text(x = 0,
#      y = -0.2,
#      expression(Various~samples~give~different~estimates~of~italic(p)) )
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
#       "95% sampling interval")
# 





### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### 

### ADD SECOND NORMAL
p <- 0.5
phat <- 0.44
se <- 0.1
pvec <- seq(0.1, 0.8, 
            by = 0.1)
Answers <- c("No",
             "No",
             rep("Yes", 4),
             "No",
             "No")
if (knitr::is_html_output()){
  coloursAnswers <- ifelse(Answers == "No", 
                           "red",
                           "green")
} else {
  coloursAnswers <- ifelse(Answers == "No", 
                           grey(0.6),
                           "black")
}


# Canvas
par( mar = c(1, 1, 1, 1)/4)
plot( x = c(-1, 3.15),
      y = c(-45, 20),
      axes = FALSE, xlab = "", ylab="",
      type = "n")

HeightOfEachNormalDist <- 5.25 # Includes some space to allow a gap between the distribution
                            # The height of the distn itself is about 4

xLeft <- -0.25
xRight <- 1.2

# Plot normal distributions


for (i in 1:length(pvec)){
  out <- plotNormal(mu = pvec[i], 
                     sd = se,
#                     ylim = c(-10, 2),
                     xlim.lo = xLeft, 
                     xlim.hi = xRight,
                     showXaxis = FALSE,
                     add = TRUE,
                     showHorizontalArrow = FALSE,
                     verticalOffset = -(i - 1) * HeightOfEachNormalDist)
  shadeNormal(out$x,
              out$y,
              lo = pvec[i] - 2 * se,
              hi = pvec[i] + 2 * se,
              col = plot.colour)
  
  points(x = pvec[i],
         y = -(i - 1) * HeightOfEachNormalDist,
         cex = 0.8,
         pch = 19)
  
  # Add value of p
  text(-0.5, 
       -(i - 1) * HeightOfEachNormalDist + (HeightOfEachNormalDist/2),
       cex = 0.9,
       bquote(italic(p)==.(pvec[i])))
  # Answers to "reasonableness" question
  text(1.3, 
       -(i - 1) * HeightOfEachNormalDist + (HeightOfEachNormalDist/2),
       cex = 0.9,
       Answers[i],
       col = coloursAnswers[i] )
  
}

# Mark observed value of p-hat
lines( x = c(phat, phat),
       y = c(-40, 7),
       lty = 2,
       lwd = 2,
       col = "grey")

# "Titles"
text(-0.5,
     10,
     expression(atop(Possible,
                     values~of~italic(p))) )
text(2.25,
     10,
     expression(atop(Is~it~reasonable~"for"~this~value~of~italic(p), 
                     to~produce~the~observed~value~of~hat(italic(p))*"?")))
text(0.5,
     10,
     expression(atop(Values~of~hat(italic(p))~produced, 
                     from~this~value~of~italic(p))))

text(phat,
     -42,
     bquote(hat(italic(p))==.(phat)))

# Bracket the possible values
lines( x = c(1.5, 1.6, 1.6, 1.5),
       y = c(-HeightOfEachNormalDist,
             -HeightOfEachNormalDist,
             -(length(pvec) - 3) * HeightOfEachNormalDist ,
             -(length(pvec) - 3) * HeightOfEachNormalDist ),
       lwd = 1)

heightOfBracketEdge <- mean( c(0, -(length(pvec) - 2) * HeightOfEachNormalDist ))
lines( x = c(1.6, 1.7),
       y = c(heightOfBracketEdge,
             heightOfBracketEdge),
       lwd = 1)
text(x = 2.5,
     y = heightOfBracketEdge,
     cex = 0.9,
     expression(atop(These~values~of~italic(p)~could,
                     reasonably~have~produced~hat(italic(p)))))

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

