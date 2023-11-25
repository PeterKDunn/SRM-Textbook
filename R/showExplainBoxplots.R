
angle <- 15

# Centre: The boxplot
plot( x = c(0, 6),
      y = c(-1 , 5),
      type = "n",
      xlab = "",
      ylab = "",
      axes = FALSE)




out <- boxplot( list(Younger = CBRyounger, 
              Older = CBRolder), 
         main = "Boxplot of the chest-beating\nrate of gorillas",
         las = 1,
         pch = 19,
         plot = FALSE,
         col = plot.colour,
         ylim = c(-0.15, 4.5),
         ylab = "Chest beating rate (per 10 hrs)")
bxp(out,
    add = TRUE,
    at = c(2.5, 3.5),
    xlim = c(0, 6),
    ylim = c(-1 , 5),
    pch = 19,
    boxfill = grey(0.9),
    outcol = grey(0.7),
    type = "n",
    xlab = "",
    ylab = "",
    main = "Chest-beating rate of gorillas",
    axes = FALSE)

# Now add fake box/axes
greyCol <- grey(0.3)
polygon( x = c(2, 2, 4, 4),
         y = c(-0.3, 5, 5, -0.3),
         border = greyCol)

# y-"Ticks"
segments( x0 = 2,
          x1 = 1.95,
          y0 = 0, 
          y1 = 0,
          col = greyCol)
segments( x0 = 2,
          x1 = 1.95,
          y0 = 1, 
          y1 = 1,
          col = greyCol)
segments( x0 = 2,
          x1 = 1.95,
          y0 = 2, 
          y1 = 2,
          col = greyCol)
segments( x0 = 2,
          x1 = 1.95,
          y0 = 3, 
          y1 = 3,
          col = greyCol)
segments( x0 = 2,
          x1 = 1.95,
          y0 = 4, 
          y1 = 4,
          col = greyCol)
text( x = 2,
      y = 0:4,
      pos = 2,
      labels = 0:4,
      col = greyCol)

# x-Ticks
segments( x0 = 2.5,
          x1 = 2.5,
          y0 = -0.3, 
          y1 = -0.4,
          col = greyCol)
segments( x0 = 3.5,
          x1 = 3.5,
          y0 = -0.3, 
          y1 = -0.4,
          col = greyCol)
text(x = 2.5,
     y = -0.4,
     pos = 1,
     labels = "Younger",
     col = greyCol)
text(x = 3.5,
     y = -0.4,
     pos = 1,
     labels = "Older",
     col = greyCol)

###############

### LEFT: Younger gorillas explanation
CBR.quantiles <- quantile(CBRyounger)
arrows( x0 = 1,
        x1 = 2.2,
        y0 = CBR.quantiles[1],
        y1 = CBR.quantiles[1],
        angle = angle,
        length = 0.1,
        lwd = 2)
text(x = 1,
     y = CBR.quantiles[1],
     labels = "Min. value",
     pos = 2)

arrows( x0 = 1,
        x1 = 2.05,
        y0 = CBR.quantiles[2],
        y1 = CBR.quantiles[2],
        angle = angle,
        length = 0.1,
        lwd = 2)
text(x = 1,
     y = CBR.quantiles[2],
     labels = expression(italic(Q)[1]),
     pos = 2)

arrows( x0 = 1,
        x1 = 2.05,
        y0 = CBR.quantiles[3] + 0.5,
        y1 = CBR.quantiles[3],
        angle = angle,
        length = 0.1,
        lwd = 2)
text(x = 1,
     y = CBR.quantiles[3] + 0.5,
     labels = "Median",
     pos = 2)

arrows( x0 = 1,
        x1 = 2.05,
        y0 = CBR.quantiles[4],
        y1 = CBR.quantiles[4],
        angle = angle,
        length = 0.1,
        lwd = 2)
text(x = 1,
     y = CBR.quantiles[4],
     labels = expression(italic(Q)[3]),
     pos = 2)

arrows( x0 = 1,
        x1 = 2.2,
        y0 = CBR.quantiles[5],
        y1 = CBR.quantiles[5],
        angle = angle,
        length = 0.1,
        lwd = 2)
text(x = 1,
     y = CBR.quantiles[5],
     labels = "Max.value",
     pos = 2)



###############

### RIGHT: Older gorillas explanation
CBR.quantiles <- quantile(CBRolder)
arrows( x0 = 5,
        x1 = 3.8,
        y0 = -0.2,
        y1 = CBR.quantiles[1],
        angle = angle,
        length = 0.1,
        lwd = 2)
text(x = 5,
     y = -0.2,
     labels = "Min. value",
     pos = 4)

arrows( x0 = 5,
        x1 = 3.95,
        y0 = 0.65,
        y1 = CBR.quantiles[2],
        angle = angle,
        length = 0.1,
        lwd = 2)
text(x = 5,
     y = 0.65,
     labels = expression(italic(Q)[1]),
     pos = 4)

arrows( x0 = 5,
        x1 = 3.95,
        y0 = 1.4,
        y1 = CBR.quantiles[3],
        angle = angle,
        length = 0.1,
        lwd = 2)
text(x = 5,
     y = 1.4,
     labels = "Median",
     pos = 4)

arrows( x0 = 5,
        x1 = 3.95,
        y0 = 2,
        y1 = CBR.quantiles[4],
        angle = angle,
        length = 0.1,
        lwd = 2)
text(x = 5,
     y = 2,
     labels = expression(italic(Q)[3]),
     pos = 4)

almostMax <- sort(CBRolder)[10]
arrows( x0 = 5,
        x1 = 3.8,
        y0 = 3.3,
        y1 = almostMax,
        angle = angle,
        length = 0.1,
        lwd = 2)
text(x = 5,
     y = 3.3,
     labels = "Max, apart\n from outlier",
     pos = 4)

arrows( x0 = 5,
        x1 = 3.6,
        y0 = 5.,
        y1 = CBR.quantiles[5],
        angle = angle,
        length = 0.1,
        lwd = 2)
text(x = 5,
     y = 5.,
     labels = "Outlier",
     pos = 4)

