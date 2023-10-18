
n <- 25
xbar <- 3.2
se <- 0.5

xValues <- seq(1, 6,
               by = 1)

muCandidates <- seq(2, 5, 
                   by = 0.25)
seCandidates <- 
seCandidates <- rep( se,
                     length(muCandidates) )


# Sample CI
lo <- xbar - (2 * se)
hi <- xbar + (2 * se)



# Canvas
par(mar = c(0.5, 0.5, 0.5, 0.5))
plot(x = c(-1.5, 8.5),
     y = c(-3, 10), # y = 0 corresponds to the horizontal axis
     axes = FALSE,
     xlab = "",
     ylab = "",
     type = "n")

# Bottom (x) axis
lines(x = c( min(xValues), max(xValues) ),
      y = c(0, 0))
text(x = xValues,
     y = rep(0, length(xValues)) - 0.35,
     pos = 1,
     labels = xValues)

# Add 'tickmarks'
for (i in 1:length(xValues)){
  segments(x0 = xValues[i],
           x1 = xValues[i],
           y0 = 0,
           y1 = -0.4)
}

betweenCIs <- 1/2

CIlo <- CIhi <- array( NA, 
                       dim = length(muCandidates))

for (i in (1:length(muCandidates))){
  mu <- muCandidates[i]
  se <- seCandidates[i]
  
  CIlo[i] <- mu - (2 * se)
  if (CIlo[i] < 1) CIlo[i] <- 1
  
  CIhi[i] <- mu + (2 * se)
  if (CIhi[i] > 6) CIhi[i] <- 6
  
  inside <- ifelse ( (xbar  > CIlo[i]) & (xbar < CIhi[i]),
                     TRUE,   # xbar in the interval
                     FALSE)  # xbar NOT in the interval
  
  yHeight <- i * betweenCIs
  
  arrows(x0 = CIlo[i],
         x1 = CIhi[i],
         y0 = yHeight,
         y1 = yHeight,
         col = ifelse(inside, "black", "grey"),
         code = 3, # Cap both ends
         angle = 90,
         length = 0.05)
  
  points( x = mu,
          y = yHeight,
          col = ifelse(inside, "black", "grey"),
          pch = ifelse(inside, 19, 4) )
  
}
plotTop <- yHeight

# Add helpful vertical lines
#lines(x = c(phat,  phat),
#      y = c(0, yHeight),
#       lty = 2)


arrows(x0 = lo,
       x1 = lo,
       y0 = (i + 1) * betweenCIs,
       y1 = 0,
       lty = 2,
       angle = 15,
       length = 0)
arrows(x0 = hi,
       x1 = hi,
       y0 = (i + 1) * betweenCIs,
       y1 = 0,
       lty = 2,
       angle = 15,
       length = 0)



arrows(x0 = lo,
       x1 = hi,
       y0 = (i + 1) * betweenCIs,
       y1 = (i + 1) * betweenCIs,
       lwd = 2,
       code = 3, # Cap both ends
       angle = 90,
       length = 0.05)
text(x = xbar,
     y = (i + 1) * betweenCIs,
     pos = 3,
     labels = expression( atop(CI*":"~Values~of~mu~"in"~this~range,
                               could~reasonably~produce~bar(italic(x))) ) )


# Explanatory text
explanatoryLinesIndent <- 0.02
bracketLength <- 0.1

bottom <- 0

LowRight <- 1.5 # Between the lines where too low, and just right
RightHigh <- 9.5 # Between the lines where just right, and too high

top <- length(muCandidates)


# Bottom
edge <- 0.6
text(x = -0.70,
     y = betweenCIs *  mean( c(betweenCIs,
                               LowRight) ),
     cex = 0.9,
     col = "grey",
     labels = expression( atop(This~interval~bold(does),
                               bold(not)~contain~bar(italic(x)))) )

lines( x = c( edge + bracketLength,
              edge,
              edge,
              edge + bracketLength),
       y = betweenCIs * c(betweenCIs,
                          betweenCIs,
                          LowRight,
                          LowRight),
       col = "grey")


# Top
edge <- 6.25
text(x = 7.5,
     y = betweenCIs * mean( c(RightHigh,
                              top) ),
     cex = 0.9,
     col = "grey",
     labels = expression( atop(These~intervals~bold(do),
                               bold(not)~contain~bar(italic(x)))) )

lines( x = c( edge - bracketLength,
              edge,
              edge,
              edge - bracketLength),
       y = betweenCIs * c(RightHigh,
                          RightHigh,
                          top,
                          top),
       col = "grey")

# Middle
edge <- 5.5
text(x = 6.75,
     y = betweenCIs * mean( c(LowRight,
                              RightHigh) ),
     cex = 0.9,
     col = "black",
     labels = expression( atop(These~intervals~bold(do),
                               contain~bar(italic(x)))) )

lines( x = c( edge - bracketLength,
              edge,
              edge,
              edge - bracketLength),
       y = betweenCIs * c(LowRight,
                          LowRight,
                          RightHigh,
                          RightHigh),
       col = "black")




# Add p-hat
points(x = xbar,
       y = -0.15,
       pos = 1,
       pch = 17)
text(x = xbar,
     y = -1.55,
     pos = 1,
     labels = bquote(bar(italic(x))==.(xbar) ))
arrows(x0 = xbar,
       x1 = xbar,
       y0 = -1.5,
       y1 = 0,
       angle = 15,
       length = 0)
lines( x = c(xbar, xbar),
       y = c(0, length(muCandidates) * betweenCIs),
       col = "grey",
       lty = 2)

