
xbar <- 3.2
se <- 0.5 # So sd = 2.5

CI <- c(xbar - 2 * se, 
        xbar + 2 * se )

### MN: 3.5
### VAR: sum( ((1:6) - 3.5)^2 * (1/6)) = 2.916667
### So se(x-bar) = 2.916667/sqrt(25) = 0.58333
muvec <- seq(1.5, 5, 
            by = 0.5)
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
par( mar = c(1, 1, 1, 1) / 4)
plot( x = c(-2.5, 14),
      y = c(-12.5, 4),
      axes = FALSE, xlab = "", ylab="",
      type = "n")

HeightOfEachNormalDist <- 1.5 # Includes some space to allow a gap between the distribution
                            # The height of the distn itself is about 0.8

xLeft <- 0 # Lower x limits to plot with normal
xRight <- 6.75 # Upper x limits to plot with normal

# Plot normal distributions


for (i in 1:length(muvec)){
  out <- plotNormal( mu = muvec[i], 
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
              lo = muvec[i] - 2 * se,
              hi = muvec[i] + 2 * se,
              col = plot.colour)
  
  points(x = muvec[i],
         y = -(i - 1) * HeightOfEachNormalDist,
         cex = 0.9,
         col = "black",
         pch = ifelse(Answers[i] == "Yes", 19, 4) )
  
  # Add value of mu
  text(-1, 
       -(i - 1) * HeightOfEachNormalDist + (HeightOfEachNormalDist/2),
       cex = 0.9,
       bquote(mu==.(muvec[i])))
  
  # Answers to "reasonableness" question
  text(7, 
       -(i - 1) * HeightOfEachNormalDist + (HeightOfEachNormalDist/2),
       cex = 0.9,
       Answers[i],
       col = coloursAnswers[i] )
}

# Mark observed value of x-bar, and CI
lines( x = c(xbar, xbar),
       y = c(-10.5, 1),
       lty = 1,
       lwd = 2,
       col = "grey")
points(x = xbar,
       y = 1,
       pch = 25, # Down triangle,
       bg = "black") # Triangle fill colour"
text(x = xbar,
     y = 1,
     pos = 3,
     cex = 0.9,
     labels = bquote(bar(italic(x))==.(xbar)))


# CI polygon
greyTranslucent <- rgb(200, 
                       200, 
                       200, 
                       max = 255, 
                       alpha = 125, 
                       names = "greyTranslucent")
polygon( x = c( CI[1], CI[1], CI[2], CI[2]),
         y = c(-10.5, 0.5, 0.5, -10.5),
         border = NA, # No borders
         col = greyTranslucent)

arrows(x0 = CI[1],
       x1 = CI[2],
       y0 = -11,
       y1 = -11,
       code = 3, # Arrow both ends
       angle = 15,
       length = 0.1)
text(x = xbar,
     y = -11,
     pos = 1,
     labels = "95% CI")


# "Titles"
text(x = -1,
     y = 3,
     labels = expression(atop(Possible,
                     values~of~mu)) )
text(x = 3.4,
     y = 3,
     labels = expression(atop(Values~of~bar(italic(x))~produced, 
                     from~this~value~of~mu)))
text(x = 11.5,
     y = 3,
     labels = expression(atop(Is~it~reasonable~"for"~this~value~of~mu, 
                     to~produce~the~observed~value~of~bar(italic(x))*"?")))



### Bracket the possible values leading to x-bar

shrinkBracket <- 0.5 # The small amount by which to bring the central brackets in a bit to avoid overlapping

lines( x = c(8.4, 8.7, 8.7, 8.4),
       y = c(-HeightOfEachNormalDist - shrinkBracket,
             -HeightOfEachNormalDist - shrinkBracket,
             -(length(muvec) - 3) * HeightOfEachNormalDist + shrinkBracket,
             -(length(muvec) - 3) * HeightOfEachNormalDist + shrinkBracket),
       lwd = 1)

# The tiny bit poking right to the meaning of the bracket
heightOfBracketEdge <- mean( c(0, -(length(muvec) - 2) * HeightOfEachNormalDist ))
lines( x = c(8.7, 9.0),
       y = c(heightOfBracketEdge,
             heightOfBracketEdge),
       lwd = 1)
text(x = 11.5,
     y = heightOfBracketEdge,
     cex = 0.9,
     expression(atop(These~values~of~mu~could,
                     reasonably~have~produced~bar(italic(x)))))

### Bracket the not possible values leading to x-bar
# The up-bracket
lines( x = c(8.4, 8.7),
       y = c(-HeightOfEachNormalDist,
             -HeightOfEachNormalDist),
       lwd = 1, 
       col = "grey")
arrows( x0 = 8.7, 
        x1 = 8.7,
        y0 = -HeightOfEachNormalDist,
        y1 =  HeightOfEachNormalDist - shrinkBracket,
        angle = 15,
        length = 0.15,
        col = "grey")


# The down-bracket
lines( x = c(8.4, 8.7),
       y = c(-(length(muvec) - 3) * HeightOfEachNormalDist ,
             -(length(muvec) - 3) * HeightOfEachNormalDist),
       lwd = 1,
       col = "grey")
arrows( x0 = 8.7, 
        x1 = 8.7,
        y0 = -(length(muvec) - 3) * HeightOfEachNormalDist,
        y1 =  -(length(muvec) - 1) * HeightOfEachNormalDist,
        angle = 15,
        length = 0.15,
        col = "grey")

#-(length(pvec) - 3) * HeightOfEachNormalDist - 2* shrinkBracket,
#-(length(pvec) - 3) * HeightOfEachNormalDist + shrinkBracket),

# Label the brackets
text(x = 12,
     y = heightOfBracketEdge - 3 * HeightOfEachNormalDist,
     cex = 0.9,
     col = grey(0.3),
     expression(atop(These~values~of~mu~could~bold(not),
                     reasonably~have~produced~bar(italic(x)))))
text(x = 12,
     y = heightOfBracketEdge + 3 * HeightOfEachNormalDist,
     cex = 0.9,
     col = grey(0.3),
     expression(atop(These~values~of~mu~could~bold(not),
                     reasonably~have~produced~bar(italic(x)))))





#grid();axis(side=1); axis(side=2)
