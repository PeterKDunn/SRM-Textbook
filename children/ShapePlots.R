### Example *shapes*

### Trying these for a carousel using slickR


set.seed(110110)

xx <- c( rchisq(300, 
                df = 2), 7,7,8,7,7,7,8,7,7,6)

hist( scales::rescale(xx, to = c(0, 5)), 
      xlab = "Values", 
      ylab = "Number of obs.",
      main = "Skewed right",
      axes = FALSE,
      col = "wheat", 
      las = 1)
axis(side = 2, 
     las = 1)
box()
dev.print(png, filename="ShapeExampleA.png", width=5, height=6,  units="in", res=100)




xx <- c( rchisq(300, df=1), 2, 2, 1, 1, 2, 0, 0)

xx <- max(xx) - xx
hist( scales::rescale(xx, to=c(0, 5)), 
      xlab="Values", ylab="Number of obs.",
      main="Skewed left",
      axes=FALSE,
      col="wheat", las=1)
axis(side=2, las=1)
box()
dev.print(png, filename="ShapeExampleB.png", width=5, height=6,  units="in", res=100)




xx <- rnorm(500, mean=10)
hist( scales::rescale(xx, to=c(0, 10)), 
      xlab="Values", ylab="Number of obs.",
      main="Approx. symmetric",
      axes=FALSE,
      col="wheat", las=1)
axis(side=2, las=1)
box()
dev.print(png, filename="ShapeExampleC.png", width=5, height=6,  units="in", res=100)





xx1 <- rnorm(500,mean=0, sd=1)
xx2 <- rnorm(250,mean=4, sd=1)
xx <- c( xx1[xx1>0], xx2)


hist( scales::rescale(xx, to=c(0, 10)),  
      right=TRUE,
      axes=FALSE,
      col="wheat", las=1,
      xlab="Values",ylab="Number of obs.", main="Bimodal distribution")
axis(side=2, las=1)
box()


dev.print(png, filename="ShapeExampleD.png", width=5, height=6,  units="in", res=100)


