
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
      axes = FALSE, 
      xlab = "", 
      ylab="",
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
       lty = 1,
       lwd = 2,
       col = "grey")

# "Titles"
text(-0.5,
     10,
     expression(atop(Possible,
                     values~of~italic(p))) )
text(0.5,
     10,
     expression(atop(Values~of~hat(italic(p))~produced, 
                     from~this~value~of~italic(p))))
text(2.25,
     10,
     expression(atop(Is~it~reasonable~"for"~this~value~of~italic(p), 
                     to~produce~the~observed~value~of~hat(italic(p))*"?")))


text(phat,
     -42,
     bquote(hat(italic(p))==.(phat)))


### Bracket the possible values leading to p-hat

shrinkBracket <- 1 # The small amount by which to bring the central brackets in a bit to avoid overlapping
# The bracket for values that could reasonably produce p-hat
lines( x = c(1.5, 1.6, 1.6, 1.5),
       y = c(-HeightOfEachNormalDist - shrinkBracket,
             -HeightOfEachNormalDist - shrinkBracket,
             -(length(pvec) - 3) * HeightOfEachNormalDist + shrinkBracket,
             -(length(pvec) - 3) * HeightOfEachNormalDist + shrinkBracket),
       lwd = 1)

# The tiny bit poking right to the meaning of the bracket
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



# The tiny bit poking right to the meaning of the bracket
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



### Bracket the not possible values leading to p-hat
# The up-bracket
lines( x = c(1.5, 1.6),
       y = c(-HeightOfEachNormalDist,
             -HeightOfEachNormalDist),
       lwd = 1, 
       col = "grey")
arrows( x0 = 1.6, 
        x1 = 1.6,
        y0 = -HeightOfEachNormalDist,
        y1 =  HeightOfEachNormalDist,
        angle = 15,
        length = 0.15,
        col = "grey")


# The down-bracket
lines( x = c(1.5, 1.6),
       y = c(-(length(pvec) - 3) * HeightOfEachNormalDist ,
             -(length(pvec) - 3) * HeightOfEachNormalDist),
       lwd = 1,
       col = "grey")
arrows( x0 = 1.6, 
        x1 = 1.6,
        y0 = -(length(pvec) - 3) * HeightOfEachNormalDist,
        y1 =  -(length(pvec) - 1) * HeightOfEachNormalDist,
        angle = 15,
        length = 0.15,
        col = "grey")

#-(length(pvec) - 3) * HeightOfEachNormalDist - 2* shrinkBracket,
#-(length(pvec) - 3) * HeightOfEachNormalDist + shrinkBracket),


# The tiny bit poking right to the meaning of the bracket
heightOfBracketEdge <- mean( c(0, -(length(pvec) - 2) * HeightOfEachNormalDist ))
lines( x = c(1.6, 1.7),
       y = c(heightOfBracketEdge,
             heightOfBracketEdge),
       lwd = 1)

# Label the brackets
text(x = 2.5,
     y = heightOfBracketEdge - 3 * HeightOfEachNormalDist,
     cex = 0.9,
     col = grey(0.3),
     expression(atop(These~values~of~italic(p)~could~bold(not),
                     reasonably~have~produced~hat(italic(p)))))
text(x = 2.5,
     y = heightOfBracketEdge + 3 * HeightOfEachNormalDist,
     cex = 0.9,
     col = grey(0.3),
     expression(atop(These~values~of~italic(p)~could~bold(not),
                     reasonably~have~produced~hat(italic(p)))))


