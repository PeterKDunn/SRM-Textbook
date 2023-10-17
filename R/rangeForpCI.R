
n <- 25
phat <- 11/25 # 11/25
se <- sqrt( phat * (1 - phat) / n )

xValues <- seq(0, 1,
               by = 0.1)

pCandidates <- seq(0.2, 0.8, 
                   by = 0.05)
seCandidates <- sqrt( pCandidates * (1 - pCandidates) / n)
seCandidates <- rep( sqrt( phat * (1 - phat) / n),
                     length(pCandidates) )


# Sample CI
lo <- phat - (2 * se)
hi <- phat + (2 * se)



# Canvas
par(mar = c(0.5, 0.5, 0.5, 0.5))
plot(x = c(-0.5, 1.5),
     y = c(-3, 10), # y = 0 corresponds to the horizontal axis
     axes = FALSE,
     xlab = "",
     ylab = "",
     type = "n")

# Bottom (x) axis
lines(x = c(0, 1),
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

CIlo <- CIhi <- array( dim = length(pCandidates))

for (i in (1:length(pCandidates))){
  p <- pCandidates[i]
  se <- seCandidates[i]
  
  CIlo[i] <- p - (2 * se)
  if (CIlo[i] < 0) CIlo[i] <- 0
  
  CIhi[i] <- p + (2 * se)
  if (CIhi[i] > 1) CIhi[i] <- 1
  
  inside <- ifelse ( (phat  > CIlo[i]) & (phat < CIhi[i]),
                     TRUE,   # phat in the interval
                     FALSE)  # phat NOT in the interval
  
  yHeight <- i * betweenCIs
  
  arrows(x0 = CIlo[i],
         x1 = CIhi[i],
         y0 = yHeight,
         y1 = yHeight,
         col = ifelse(inside, "black", "grey"),
         code = 3, # Cap both ends
         angle = 90,
         length = 0.05)
  
  points( x = p,
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
text(x = phat,
     y = (i + 1) * betweenCIs,
     pos = 3,
     labels = expression( atop(Values~of~italic(p)~"in"~this~range,
                               could~reasonably~produce~hat(italic(p))) ) )


# Explanatory text
explanatoryLinesIndent <- 0.02
bracketLength <- 0.02

bottom <- 0

LowRight <- 1.5 # Between the lines where too low, and just right
RightHigh <- 9.5 # Between the lines where just right, and too high

top <- length(pCandidates)


# Bottom
edge <- -0.05
text(x = -0.25,
     y = betweenCIs *  mean( c(betweenCIs,
                               LowRight) ),
     cex = 0.9,
     col = "grey",
     labels = expression( atop(This~interval~bold(does),
                               bold(not)~contain~hat(italic(p)))) )

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
edge <- 1.05
text(x = 1.26,
     y = betweenCIs * mean( c(RightHigh,
                              top) ),
     cex = 0.9,
     col = "grey",
     labels = expression( atop(These~intervals~bold(do),
                               bold(not)~contain~hat(italic(p)))) )

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
edge <- 0.90
text(x = 1.11,
     y = betweenCIs * mean( c(LowRight,
                              RightHigh) ),
     cex = 0.9,
     col = "black",
     labels = expression( atop(These~intervals~bold(do),
                               contain~hat(italic(p)))) )

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
points(x = phat,
       y = -0.15,
       pos = 1,
       pch = 17)
text(x = phat,
     y = -1.55,
     pos = 1,
     labels = bquote(hat(italic(p))==.(phat) ))
arrows(x0 = phat,
       x1 = phat,
       y0 = -1.5,
       y1 = 0,
       angle = 15,
       length = 0)
lines( x = c(phat, phat),
       y = c(0, length(pCandidates) * betweenCIs),
       col = "grey",
       lty = 2)

