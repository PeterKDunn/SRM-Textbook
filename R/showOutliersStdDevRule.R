transparentGrey <- makeTransparent(grey(0.90))


######################################



par( mar = c(4.5, 2.0, 4, 2.0) + 0.1)

data(Perm)
Perm.quantiles <- quantile(Perm$Perm)

meanPerm <- mean(Perm$Perm)
sdPerm <- sd(Perm$Perm)



### Sort out the outliers
locationOfOutliers <- (meanPerm + 3 * sdPerm)
sdOutliers <- (Perm$Perm >  locationOfOutliers)


### PLOT
stripchart( Perm$Perm,
            method = "jitter",
            jitter = 0.2,
            main = "A dot chart of permeability:\nusing the standard deviation rule",
            las = 1,
            pch = 19,
            #col = "grey",
            axes = FALSE,
            ylim = c(0, 2.25),
            xlim = c(0, 175),
            xlab = "Permeability (in s)")

polygon( x = c(locationOfOutliers,
               locationOfOutliers,
               180,
               180),
         y = c(-1, 
               2, 
               2, 
               -1),
         col = transparentGrey,
         border = NA)


lines(x = c(meanPerm,
            meanPerm),
      y = c(0, 2),
      lwd = 2)
text(x = meanPerm, 
     y = 2,
     pos = 3,
     labels = paste("Mean:", round(meanPerm, 1)) )


lines(x = c(locationOfOutliers,
            locationOfOutliers),
      y = c(0, 2),
      lwd = 2)
arrows(x0 = meanPerm,
       x1 = locationOfOutliers,
       y0 = 1.7,
       y1 = 1.7,
       angle = 15,
       length = 0.1)
text(x = mean( c(meanPerm,
                 locationOfOutliers)),
     y = 1.7,
     #pos = 3,
     cex = 0.95,
     labels = "Three std. devs\nfrom the mean" )
text(x = locationOfOutliers,
     y = 2,
     pos = 3,
     labels = round(locationOfOutliers, 1))


text(x = mean(sort(Perm$Perm,
              decreasing = TRUE)[1:2]),
     y = 0.25,
     pos = 1,
     cex = 0.95,
     labels = "Identified as outliers")
arrows(x0 = sort(Perm$Perm,
                 decreasing = TRUE)[2] + 5,
       x1 = sort(Perm$Perm,
                 decreasing = TRUE)[2],
       y0 = 0.25,
       y1 = 0.75,
       angle = 15,
       length = 0.1)
arrows(x0 = sort(Perm$Perm,
                 decreasing = TRUE)[1] - 5,
       x1 = sort(Perm$Perm,
                 decreasing = TRUE)[1],
       y0 = 0.25,
       y1 = 0.75,
       angle = 15,
       length = 0.1)

axis(side = 1, 
     at = seq(0, 175, by = 25),
     cex = 0.95
     )

