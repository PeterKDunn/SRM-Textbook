addShots <- function(x = 0, y = 0, radius = 1, n = 20, seed = 27469){
  set.seed(seed)
  
  xx <- runif(n, 
              min = x - radius, 
              max = x + radius)
  yy <- runif(n, 
              min = -sqrt( radius^2 - (xx - x)^2) + y, 
              max =  sqrt( radius^2 - (xx - x)^2) + y ) 
  
  points( xx, 
          yy,
          cex = 1.2,
          pch = 21, 
          col = "black", 
          bg = blueSolid)
  
  list(x = xx, y = yy)
  
}

drawTarget <- function(){
  plot( x = c(-1.01, 1.01),
        y = c(-1.01, 1.01),
        xlab = "",
        ylab = "",
        type = "n",
        axes = FALSE,
        asp = 1)        #asp = 1 means "aspect ratio = 1", so circles look like circles
  
  plotrix::draw.circle(x = 0, 
                       y = 0,
                       radius  =  1,
                       lwd = 2,
                       col = "transparent",
                       border = "black")
  plotrix::draw.circle(x = 0, 
                       y = 0,
                       radius  =  0.8,
                       lwd = 2,
                       col = "transparent",
                       border = "grey")
  plotrix::draw.circle(x = 0, 
                       y = 0,
                       radius  =  0.6,
                       lwd = 2,
                       col = "transparent",
                       border = "grey")
  plotrix::draw.circle(x = 0, 
                       y = 0,
                       radius  =  0.4,
                       lwd = 2,
                       col = "transparent",
                       border = "grey")
  plotrix::draw.circle(x = 0, 
                       y = 0,
                       radius  =  0.2,
                       lwd = 2,
                       col = "transparent",
                       border = "grey")
}

drawBullsEye <- function(){
  points(0, 0,
         pch = 19, 
         col = "black")
}