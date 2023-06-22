
xbar <- 2.8
se <- 0.03883
muvec <- seq(2.65, 2.95, 
            by = 0.05)
Answers <- c("No",
             "No",
             rep("Yes", 3),
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
plot( x = c(2.15, 4.05),
      y = c(-95, 20),
      axes = FALSE, xlab = "", ylab="",
      type = "n")

HeightOfEachNormalDist <- 14 # Includes some space to allow a gap between the distribution
                            # The height of the distn itself is about 4

xLeft <- 2.45 # Lower x limits to plot with normal
xRight <- 3.15 # Upper x limits to plot with normal

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
         cex = 0.8,
         pch = 19)
  
  # Add value of mu
  text(2.35, 
       -(i - 1) * HeightOfEachNormalDist + (HeightOfEachNormalDist/2),
       cex = 0.9,
       bquote(mu==.(muvec[i])))
  # Answers to "reasonableness" question
  text(3.2, 
       -(i - 1) * HeightOfEachNormalDist + (HeightOfEachNormalDist/2),
       cex = 0.9,
       Answers[i],
       col = coloursAnswers[i] )
  
}

# Mark observed value of x-bar
lines( x = c(xbar, xbar),
       y = c(-90, 7),
       lty = 2,
       lwd = 2,
       col = "grey")

# "Titles"
text(2.3,
     19,
     expression(atop(Possible,
                     values~of~mu)) )
text(2.8,
     19,
     expression(atop(Values~of~bar(italic(x))~produced, 
                     from~this~value~of~mu)))
text(3.6,
     19,
     expression(atop(Is~it~reasonable~"for"~this~value~of~mu, 
                     to~produce~the~observed~value~of~bar(italic(x))*"?")))

text(xbar,
     -95,
     bquote(bar(italic(x))==.(xbar)))

# Bracket the possible values
lines( x = c(3.25, 3.3, 3.3, 3.25),
       y = c(-HeightOfEachNormalDist,
             -HeightOfEachNormalDist,
             -(length(muvec) - 3) * HeightOfEachNormalDist ,
             -(length(muvec) - 3) * HeightOfEachNormalDist ),
       lwd = 1)

heightOfBracketEdge <- mean( c(0, -(length(muvec) - 2) * HeightOfEachNormalDist ))
lines( x = c(3.3, 3.35),
       y = c(heightOfBracketEdge,
             heightOfBracketEdge),
       lwd = 1)
text(x = 3.65,
     y = heightOfBracketEdge,
     cex = 0.9,
     expression(atop(These~values~of~mu~could,
                     reasonably~have~produced~bar(italic(x)))))


#grid();axis(side=1); axis(side=2)
