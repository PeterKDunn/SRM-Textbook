### Example *shapes*

### Trying these for a carousel using slickR


set.seed(110110)
figWidth <- 4

xx <- c( rchisq(300, 
                df = 2), 
         7,7,8,7,7,7,8,7,7,6)

png(file ="ShapeExampleA-Carousel.png", 
    width = figWidth,
    height = 6,  
    units = "in", 
    res = 100)
hist( scales::rescale(xx, to = c(0, 5)), 
      xlab = "Values", 
      ylab = "Number of obs.",
      main = "A: Positively or\nright skewed",
      axes = FALSE,
      col = "wheat", 
      las = 1)
axis(side = 2, 
     las = 1)

box()
dev.off()




png(file = "ShapeExampleB-Carousel.png", 
    width = figWidth,
    height = 6,  
    units = "in", 
    res = 100)
xx <- c( rchisq(300, 
                df = 1), 
         2, 2, 1, 1, 2, 0, 0)

xx <- max(xx) - xx
hist( scales::rescale(xx, to = c(0, 5)), 
      xlab="Values", ylab="Number of obs.",
      main="B: Negatively or\nleft skewed",
      axes=FALSE,
      col="wheat", 
      las = 1)
axis(side = 2, 
     las = 1)

box()
dev.off()




png(file = "ShapeExampleC-Carousel.png", 
    width = figWidth,
    height = 6,  
    units = "in", 
    res = 100)
xx <- rnorm(500, mean=10)
hist( scales::rescale(xx, to = c(0, 10)), 
      xlab="Values", ylab="Number of obs.",
      main="C: Approx. symmetric",
      axes=FALSE,
      col="wheat", 
      las = 1)
axis(side = 2, 
     las = 1)

box()
dev.off()





png(file = "ShapeExampleD-Carousel.png", 
    width = figWidth,
    height = 6,  
    units = "in", 
    res = 100)
xx1 <- rnorm(500,
             mean = 0, 
             sd = 1)
xx2 <- rnorm(250,
             mean = 4, 
             sd = 1)
xx <- c( xx1[xx1 > 0], xx2)


hist( scales::rescale(xx, to = c(0, 10)),  
      right = TRUE,
      axes = FALSE,
      col = "wheat", 
      las = 1,
      xlab = "Values",
      ylab = "Number of obs.", 
      main = "D: Bimodal distribution")
axis(side = 2, 
     las = 1)

box()
dev.off()




png(file = "ShapeExampleE-Carousel.png", 
    width = figWidth,
    height = 6,  
    units = "in", 
    res = 100)

xx <- rchisq(300, df = 20)

hist( xx,  
      right = TRUE,
      axes = FALSE,
      col = "wheat", 
      las = 1,
      xlab = "Values",
      ylab = "Number of obs.", 
      main = "E: Slight positive\nor right skew")
axis(side = 2, 
     las = 1)

box()
dev.off()







png(file = "ShapeExampleF-Carousel.png", 
    width = figWidth,
    height = 6,  
    units = "in", 
    res = 100)
xx <- rchisq(300, df = 20)
xx <- max(xx) - xx

hist( xx,
      right = TRUE,
      axes = FALSE,
      col = "wheat", 
      las = 1,
      xlab = "Values",
      ylab = "Number of obs.", 
      main = "F: Slight negative\nor left skew")
axis(side = 2, 
     las = 1)

box()
dev.off()







png(file = "ShapeExampleG-Carousel.png", 
    width = figWidth,
    height = 6,  
    units = "in",
    res = 100)

xx <- runif(500,
            min = 0,
            max = 5)

hist( xx, 
      right = TRUE,
      axes = FALSE,
      col = "wheat", 
      breaks = seq(0, 5, by = 1),
      las = 1,
      xlab = "Values",
      ylab = "Number of obs.", 
      main = "G: Approx. symmetric")
axis(side = 2, 
     las = 1)

box()
dev.off()







