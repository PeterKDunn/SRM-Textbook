
n <- 25
phat <- 11/25 # 11/25
se <- sqrt( phat * (1 - phat) / n )

xValues <- seq(0, 1,
               by = 0.1)

pCandidates <- seq(0.1, 0.9, 
                   by = 0.05)
seCandidates <- sqrt( pCandidates * (1 - pCandidates) / n)
seCandidates <- rep( sqrt( pHat * (1 - pHat) / n),
                     length(pCandidates) )


# Sample CI
lo <- phat - (2 * se)
hi <- phat + (2 * se)



# Canvas
par(mar = c(0.5, 0.5, 0.5, 0.5))
plot(x = c(-0.5, 1.5),
     y = c(-5, 14), # y = 0 corresponds to the horizontal axis
     axes = FALSE,
     xlab = "",
     ylab = "",
     type = "n")

# Bottom (x) axis
lines(x = c(0, 1),
      y = c(0, 0))
text(x = xValues,
     y = rep(0, length(xValues)),
     pos = 1,
     labels = xValues)

# Add 'tickmarks'
for (i in 1:length(xValues)){
  segments(x0 = xValues[i],
           x1 = xValues[i],
           y0 = 0,
           y1 = -0.4)
}

# Add p-hat
points(x = phat,
       y = -3,
       pch = 17)
text(x = phat,
     y = -3.5,
     pos = 1,
     labels = bquote(hat(italic(p))==.(phat) ))


betweenCIs <- 1/2


for (i in (1:length(pCandidates))){
  p <- pCandidates[i]
  se <- seCandidates[i]
  
  CIlo <- p - (2 * se)
  if (CIlo < 0) CIlo <- 0
  
  CIhi <- p + (2 * se)
  if (CIhi > 1) CIhi <- 1

    #cat("CI: (", CIlo, "to", CIhi, ")\n")

  inside <- ifelse ( (phat  > CIlo) & (phat < CIhi),
                     TRUE,   # phat in the interval
                     FALSE)  # phat NOT in the interval

#cat("p:", p, "inside:", inside, "\n\n")

  yHeight <- i * betweenCIs
  
  arrows(x0 = CIlo,
         x1 = CIhi,
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
lines(x = c(phat,  phat),
      y = c(0, yHeight),
       lty = 2)


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
tooLow <- 1.5
tooHigh <- 8
justRight <- 4.5

text(x = -0.25,
     y = tooLow,
     cex = 0.9,
     col = "grey",
     labels = expression( atop(These~intervals~bold(do),
                               bold(not)~contain~hat(italic(p)))) )
lines( x = c(1.05 - explanatoryLinesIndent, 1.05),
       y = c(tooHigh - 1.25, tooHigh),
       col = "grey")
lines( x = c(1.05, 1.05 - explanatoryLinesIndent),
       y = c(tooHigh, tooHigh + 1.25),
       col = "grey")


text(x = 1.25,
     y = 8,
     cex = 0.9,
     col = "grey",
     labels = expression( atop(These~intervals~bold(do),
                               bold(not)~contain~hat(italic(p)))) )
lines( x = c(-0.05, -0.05 - explanatoryLinesIndent),
       y = c(tooLow - 0.75, tooLow),
       col = "grey")
lines( x = c(-0.05 - explanatoryLinesIndent, -0.05),
       y = c(tooLow, tooLow + 0.75),
       col = "grey")



text(x = 1.05,
     y = 4.0,
     cex = 0.9,
     labels = expression( atop(These~intervals~bold(do),
                               contain~hat(italic(p)))) )
lines( x = c(0.85, 0.85 + explanatoryLinesIndent),
       y = c(justRight- 1.75, justRight),
       col = "black")
lines( x = c(0.85 + explanatoryLinesIndent, 0.85),
       y = c(justRight, justRight + 1.75),
       col = "black")
