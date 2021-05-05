RD <- read.table("~/Documents/Teaching/Datasets/Books/Hand/Hand-R/reddeer.txt", header=TRUE)

plot(Weight ~ Age, data=RD,
     las=1,
     pch=19, 
     ylim=c(0, 5.5),
     xlim=c(4, 15),
     xlab="Age (in years)",
     ylab="Molar weight (in g)")

dev.copy2pdf(file="RedDeer-Scatter.pdf", width=4.5, height=3.5)


RD.lm <- lm(Weight ~ Age, data=RD)
abline( coef(RD.lm), lwd=2, col="red")

dev.copy2pdf(file="RedDeer-Scatter-Line.pdf", width=4.5, height=3.5)





plot(Weight ~ Age, data=RD,
     las=1,
     pch=19, 
     ylim=c(0, 5.5),
     xlim=c(4, 15),
     xlab="Age (in years)",
     ylab="Molar weight (in g)")

abline( coef(RD.lm), lwd=2, col="red")

pred.RD.lm <- predict( RD.lm )

for (i in (1:length(RD$Age))){
  lines( c(RD$Age[i], RD$Age[i]),
         c(RD$Weight[i], pred.RD.lm[i]) )
}

dev.copy2pdf(file="RedDeer-Scatter-Residuals.pdf", width=4.5, height=3.5)





  # RESIDUALS

plot(Weight ~ Age, data=RD,
     las=1,
     pch=19, 
     ylim=c(0, 5.5),
     xlim=c(4, 15),
     xlab="Age (in years)",
     ylab="Molar weight (in g)")

abline( coef(RD.lm), lwd=2, col="red")


PointFlag <- c(8, 22, 69)

for (i in (1:length(PointFlags))){
  lines( c(RD$Age[    PointFlag[i] ],     RD$Age[ PointFlag[i] ]),
         c(RD$Weight[ PointFlag[i] ], pred.RD.lm[ PointFlag[i] ]),
         col="red",
         lwd=2)
  points(Weight[ PointFlag[i] ] ~ Age[ PointFlag[i] ], data=RD, pch=19, col="red", cex=1.2)
  
      if (i == 1) dev.copy2pdf(file="RedDeer-Scatter-Residuals1.pdf", width=4.5, height=3.5)
      if (i == 2) dev.copy2pdf(file="RedDeer-Scatter-Residuals2.pdf", width=4.5, height=3.5)
      if (i == 3) dev.copy2pdf(file="RedDeer-Scatter-Residuals3.pdf", width=4.5, height=3.5)

}
