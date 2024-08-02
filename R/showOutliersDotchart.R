transparentGrey <- makeTransparent(grey(0.90))
angle <- 15

######################################



par( mar = c(4.5, 2.0, 4, 2.0) + 0.1)

data(Perm)
Perm.quantiles <- quantile(Perm$Perm)


### Sort out the outliers
x <- Perm$Perm
xsort <- sort( x , decreasing = TRUE)  
b.out <- boxplot(x, plot = FALSE)

b.out.noextreme <- b.out
b.out.noextreme$n <- b.out.noextreme$n - 2
b.out.noextreme$out <- numeric(0)
b.out.noextreme$group <- numeric(0)
b.out.noextreme$stats[5, 1] <- xsort[3]

b.out.nomild <- b.out
b.out.nomild$n <- b.out.nomild$n - 3
b.out.nomild$out <- numeric(0)
b.out.nomild$group <- numeric(0)

qx <- quantile(x)
iqrx <- qx[4] - qx[2]
mild <- qx[4] + 1.5 * iqrx
extreme <- qx[4] + 3 * iqrx

# FIND extreme obs
extreme.obs <-  sort(b.out$out)[2:3]
extreme.which <- which(x > extreme )
extreme.num <- length( x[extreme.obs] )

# FIND mild obs
mild.obs <- sort(b.out$out)[1]
mild.which <- which(x > mild )
mild.num <- length( x[mild.obs] )

x.nooutliers <- xsort[ -(1:3)]


### PLOT
stripchart( Perm$Perm,
            method = "jitter",
            main = "A dot chart of permeability:\nusing the IQR rule",
            las = 1,
            pch = 19,
            #col = "grey",
            axes = FALSE,
            ylim = c(-0.5, 2.2),
            xlim = c(0, 175),
            xlab = "Permeability (in s)")
axis(side = 1, 
     at = c(0, Perm.quantiles[2], 50, Perm.quantiles[4], 100, 150, 175),
     cex = 0.95,
     labels =  c(0,
                 expression(italic(Q)[1]), 
                 "",
                 expression(italic(Q)[3]),
                 100,
                 150,
                 175)
     )

lines( x = c( Perm.quantiles[2],
              Perm.quantiles[2] ),
       y = c(-1, 1.95),
       col = "grey",
       lty = 1,
       lwd = 4)
lines( x = c( Perm.quantiles[4],
              Perm.quantiles[4] ),
       y = c(-1, 1.95),
       col = "grey",
       lty = 1,
       lwd = 4)



### Add IQR
arrows(x0 = Perm.quantiles[2],
       x1 = Perm.quantiles[4],
       y0 = 1.75,
       y1 = 1.75,
       code = 3,
       lwd = 2,
       angle = angle,
       length = 0.1)
text(labels = "IQR",
     y = 1.75,
     cex = 1.25,
     x = mean( Perm.quantiles[c(2, 4)]),
     pos = 3)

### MILD OUTLIERS
arrows(x0 = Perm.quantiles[4],
       x1 = mild,
       y0 = 0.7,
       y1 = 0.7,
       code = 3,
       lwd = 2,
       angle = angle,
       length = 0.1)
text( x = mean( c(Perm.quantiles[4], 
                  mild)),
      y = 0.7,
      pos = 1,
      labels = expression(1.5~x~IQR))

polygon( y = c(-5, 10, 10, -5),
         x = c(mild, mild, extreme, extreme),
         border = NA, # No border
         col = transparentGrey )
abline( v = c(mild, extreme),
         lwd = 2,
         col = "grey")
text(x = mean( c(mild, extreme) ),
     y = 1.75,
     labels = "Mild\noutlier")
arrows(x0 = mild.obs,
       x1 = mild.obs,
       y0 = 1.4,
       y1 = 1.1,
       angle = 15,
       length = 0.1)

### EXTREME OUTLIERS
arrows(x0 = Perm.quantiles[4],
       x1 = extreme,
       y0 = 0,
       y1 = 0,
       lwd = 2,
       code = 3,
       angle = angle,
       length = 0.1)
text( x = mean( c(Perm.quantiles[4], 
                  extreme)),
      y = 0,
      pos = 1,
      labels = expression(3~x~IQR~"  "))
text(x = mean( extreme.obs ),
     y = 1.75,
     labels = "Extreme\noutliers")

arrows(x0 = mean( extreme.obs ) + c(-4, 4),
       x1 = extreme.obs + c(4, -4),
       y0 = 1.4,
       y1 = 1.15,
       angle = 15,
       length = 0.1)


