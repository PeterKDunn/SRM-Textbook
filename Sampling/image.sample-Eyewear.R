# Original images was: 5472 x 3648
#Width <- 2096
#Height <- 1552


#Copyright:
#  crazy-emotion-eyewear-2015-SMALLEST
#By 
#Gratisography (gratisography.com )



blueTransparent <- rgb(0, 0, 1, 
                       alpha = 0.2, 
                       maxColorValue = 1)
blueSolid <- rgb(0, 0, 1, 
                 alpha = 0.9, 
                 maxColorValue = 1)
plot.colour <- blueTransparent

##############################################################
# Need library(pixmap) to get the read.pnm function?  
library(pixmap)
# Can convert to jpg using sips on a Mac
library(convertGraph)
library(png)

# The size for the *shrunk* (SMALLEST) image (from 5472 x 3648)
#Width <- 2736
#Height <- 1824

# WHILE FIDDLING, MAKE THINGS QUICKER:
Width <- 1368
Height <-912
original_number_of_pixels <- Height * Width
cat("Number of pixels in the original image: ",
    original_number_of_pixels,
    "\n")

###
### SIMPLE RANDOM SAMPLE ###
###
cat(" --- SRS --- \n")
### Note: The % of *zeros* should match the % to show

# Create pixmap overlay, of white pixels and transparent pixels to overlay the image
px.sample.SRS <- function(pcent, fname, Height, Width){
  
  original_number_of_pixels <- Height * Width
  
  cat("SRS:",
      pcent,
      "%, with ",
      original_number_of_pixels * pcent,
      "pixels. \n")

  pcent <- pcent/100 # Convert % to a decimal
  
  set.seed(10000)
  
  num <- Width * Height # Image size: Number of pixels
                        # So we use a binomial: 0s and 1s randomly chosen from these pixels
  add <- rbinom(num, 1, 1-pcent)  # Take a random sample of pcent% of pixels.
                                  ### 1 means to select the pixel; 0 means to blank it out

  #cat("Sum of ones:", 
  #    sum(add),"\n")
  #cat("% of ones:", 
  #    sum(add) / (Height * Width) * 100,
  #    "\n---\n")

  img <- array( dim = c(Height, Width), 
                add) # This 0s and 1s, arranged as an array the same size as the image
  img.pm <- pixmapIndexed(data = img, 
                          nrow = Height, 
                          ncol = Width) #, col=c(NA,"#FFFFFF") )
  write.pnm(file = fname, 
            object = img.pm, 
            type = "pgm")
  return(img)
}


# Create the overlays
img.100 <- px.sample.SRS(0, 
                         "img100.pgm", 
                         Height = Height, 
                         Width = Width)
img.50 <- px.sample.SRS(50, 
                        "img50.pgm", 
                        Height = Height, 
                        Width = Width)
img.25 <- px.sample.SRS(25, 
                        "img25.pgm", 
                        Height = Height, 
                        Width = Width)
img.10 <- px.sample.SRS(10, 
                        "img10.pgm", 
                        Height = Height, 
                        Width = Width)
img.05 <- px.sample.SRS(05, 
                        "img5.pgm", 
                        Height = Height, 
                        Width = Width)
img.0p5 <- px.sample.SRS(0.5, 
                        "img0p5.pgm", 
                        Height = Height, 
                        Width = Width)
#img.01 <- px.sample(.01, "img1.pgm", Height=Height, Width=Width)

AspectRatio <- Height/Width
plotWidth <- 600
img <- read.pnm(file="crazy-emotion-eyewear-2015-SMALLEST.ppm")   


plot(img)   # Plot the image
box(lwd = 3)
test <- image( 1:Width, 
               1:Height, 
               t(img.100), 
               add = TRUE, 
               col = c("#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
dev.copy(png, 
         file = "crazy-emotion-eyewear-2015-SMALLEST-WHITE.png", 
         width = Width, 
         height = Height, 
         units = "px")
dev.off()

plot(img)   # Plot the image
box(lwd = 3)
test <- image( 1:Width, 
               1:Height, 
               t(img.0p5), 
               add = TRUE, 
               col = c(NA, "#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
dev.copy(png, 
         file = "crazy-emotion-eyewear-TEST.png", 
         width = Width, 
         height = Height, 
         units = "px")
dev.off()


plot(img)   # Plot the image
box(lwd = 3)
test <- image( 1:Width, 
               1:Height, 
               t(img.05), 
               add = TRUE, 
               col = c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
#title( paste( "Simple random sample: small number of pixels\n(", original_number_of_pixels * 0.05, "pixels)"), 
title( paste( "Simple random sample: small number of pixels)"), 
       col.main = blueTransparent, 
      cex.main = 4)
dev.copy(png, 
         file = "crazy-emotion-eyewear-2015-SMALLEST-R05.png", 
         width = Width, 
         height = Height, 
         units = "px")
dev.off()

plot(img)
box(lwd =3)
test <- image( 1:Width, 
               1:Height, 
               t(img.10), 
               add = TRUE, 
               col = c(NA,"#FFFFFF"))  # NA causes transparent pixels 
title("Simple random sample: medium-small number of pixels", 
      col.main = blueTransparent, 
      cex.main = 4)
dev.copy(png, 
         file = "crazy-emotion-eyewear-2015-SMALLEST-R10.png", 
         width = Width, 
         height = Height, 
         units = "px")
dev.off()

plot(img)
box(lwd = 3)
test <- image( 1:Width, 
               1:Height, 
               t(img.25), 
               add = TRUE, 
               col = c(NA,"#FFFFFF"))  # NA causes transparent pixels 
title("Simple random sample: medium-large number of pixels", 
      col.main = blueTransparent, 
      cex.main = 4)
dev.copy(png, 
         file = "crazy-emotion-eyewear-2015-SMALLEST-R25.png", 
         width = Width, 
         height = Height, 
         units = "px")
dev.off()

plot(img)
box(lwd = 3)
test <- image( 1:Width, 
               1:Height, 
               t(img.50), 
               add = TRUE, 
               col = c(NA,"#FFFFFF"))  # NA causes transparent pixels 
title("Simple random sample: large number of pixels", 
      col.main = blueTransparent, 
      cex.main = 4)
dev.copy(png, 
         file = "crazy-emotion-eyewear-2015-SMALLEST-R50.png", 
         width = Width, 
         height = Height, 
         units = "px")
dev.off()






###
### SYSTEMATIC RANDOM SAMPLE ###
###
cat(" --- Systematic --- \n")

### Note: The % of *zeros* should match the % to show


# Create pixmap overlay, of white pixels and transparent pixels to overlay the image
px.sample.systematic <- function(pcent, fname, Height, Width){
  
  
  pcent <- pcent/100 # Convert % to a decimal

  set.seed(10000)
  
  num <- Width * Height # Image size: Number of pixels
  # So we use a binomial: 0s and 1s randomly chosen from these pixels
  select.every <- 1/(pcent)
  
  select <- seq(1, num, by=select.every) ### 1 means to select the pixel; 0 means to blank it out
  add <- rep(1, length=num)
  add[select] <- 0
  cat("Systematic:", 
      pcent * 100, 
      "%, or selecting every ", 
      select.every,
      "th pixel;",
      original_number_of_pixels * pcent,
      "pixels. \n")
  
 
  
  #cat("Sum of ones:", sum(add),"\n")
  #cat("% of ones:", sum(add)/(Height*Width)*100,"\n---\n")

  img <- array( dim = c(Height, Width), add) # This 0s and 1s, arranged as an array the same size as the image
  img.pm <- pixmapIndexed(data = img, 
                          nrow = Height, 
                          ncol = Width) #, col=c(NA,"#FFFFFF") )
  write.pnm(file = fname, 
            object = img.pm, 
            type = "pgm")
  return(img)
}


# Create the overlays
img.50.sys <- px.sample.systematic(50, 
                                   "img50.pgm", 
                                   Height = Height, 
                                   Width = Width)
img.25.sys <- px.sample.systematic(25, 
                                   "img25.pgm", 
                                   Height = Height, 
                                   Width = Width)
img.10.sys <- px.sample.systematic(10, 
                                   "img10.pgm", 
                                   Height = Height, 
                                   Width = Width)
img.05.sys <- px.sample.systematic(05, 
                                   "img5.pgm", 
                                   Height = Height, 
                                   Width = Width)

AspectRatio <- Height/Width

img <- read.pnm(file="crazy-emotion-eyewear-2015-SMALLEST.ppm")   

plot(img)   # Plot the image
box(lwd = 3)
test <- image( 1:Width, 
               1:Height, 
               t(img.05.sys), 
               add = TRUE, 
               col = c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Systematic random sample: small number of pixels", 
      col.main = blueTransparent, 
      cex.main = 4)
dev.copy(png, 
         file="crazy-emotion-eyewear-2015-SMALLEST-R05-systematic.png", 
         width = Width, 
         height = Height, 
         units = "px")
dev.off()


plot(img)   # Plot the image
box(lwd = 3)
test <- image( 1:Width, 
               1:Height, 
               t(img.10.sys), 
               add = TRUE, 
               col = c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Systematic random sample: medium-small number of pixels", 
      col.main = blueTransparent, 
      cex.main = 4)
dev.copy(png, 
         file = "crazy-emotion-eyewear-2015-SMALLEST-R10-systematic.png", 
         width = Width, 
         height = Height, 
         units = "px")
dev.off()


plot(img)   # Plot the image
box(lwd = 3)
test <- image( 1:Width, 
               1:Height, 
               t(img.25.sys), 
               add = TRUE, 
               col = c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Systematic random sample: medium-large number of pixels", 
      col.main = blueTransparent, 
      cex.main = 4)
dev.copy(png, 
         file = "crazy-emotion-eyewear-2015-SMALLEST-R25-systematic.png", 
         width = Width, 
         height = Height, 
         units = "px")
dev.off()


plot(img)   # Plot the image
box(lwd = 3)
test <- image( 1:Width, 
               1:Height, 
               t(img.50.sys), 
               add = TRUE, 
               col = c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Systematic random sample: large number of pixels", 
      col.main = blueTransparent, 
      cex.main = 4)
dev.copy(png, 
         file = "crazy-emotion-eyewear-2015-SMALLEST-R50-systematic.png", 
         width = Width, 
         height = Height, 
         units = "px")
dev.off()









###
### CLUSTER RANDOM SAMPLE ###
###
cat(" --- Cluster --- \n")

### Select some (entire) columns.
###
### Note: The % of *zeros* should match the % to show


# Create pixmap overlay, of white pixels and transparent pixels to overlay the image
px.sample.cluster <- function(pcent, fname, Height, Width){
  
  pcent <- pcent/100 # Convert % to a decimal
  
  set.seed(10000)
  
  num <- Width * Height # Image size: Number of pixels
  
  add <- array( 0, dim=c(Height, Width))
  # Select the rows to use
  select.cols <- rbinom(Width, 1, 1-pcent)  # Take a random sample of pcent% of pixels.
  cat("Cluster: Selecting ", pcent*100, "% of cols.\n")

#  add[ ,  which(select.cols>0) ] <- 1
#  cat("Sum of ones:", sum(add),"\n")
#  cat("% of ones:", sum(add)/(Height*Width)*100,"\n")
#  cat("*** % of zeros:", sum(add==0)/(Height*Width)*100,"***\n---\n")
  
  img <- array( dim=c(Height, Width), add) # This 0s and 1s, arranged as an array the same size as the image
  img.pm <- pixmapIndexed(data = img, nrow=Height, ncol=Width) #, col=c(NA,"#FFFFFF") )
  write.pnm(file=fname, object=img.pm, type="pgm")
  return(img)
}


# Create the overlays
img.50.cluster <- px.sample.cluster(50, "img50.pgm", Height=Height, Width=Width)
img.25.cluster <- px.sample.cluster(25, "img25.pgm", Height=Height, Width=Width)
img.10.cluster <- px.sample.cluster(10, "img10.pgm", Height=Height, Width=Width)
img.05.cluster <- px.sample.cluster(05, "img5.pgm", Height=Height, Width=Width)
#img.01 <- px.sample(.01, "img1.pgm", Height=Height, Width=Width)

AspectRatio <- Height/Width
#quartz() #width=7, height=7 * AspectRatio)      
#par( mar=c(0,0,0,0))
img <- read.pnm(file="crazy-emotion-eyewear-2015-SMALLEST.ppm")   

plot(img)   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.05.cluster), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Cluster random sample: small number of pixels", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R05-cluster.png", width=Width, height=Height, units="px")
dev.off()


plot(img)   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.10.cluster), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Cluster random sample: medium-small number of pixels", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R10-cluster.png", width=Width, height=Height, units="px")
dev.off()


plot(img)   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.25.cluster), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Cluster random sample: medium-large number of pixels", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R25-cluster.png", width=Width, height=Height, units="px")
dev.off()


plot(img)   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.50.cluster), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Cluster random sample: large number of pixels", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R50-cluster.png", width=Width, height=Height, units="px")
dev.off()









###
### MULTISTAGE RANDOM SAMPLE ###
###
cat(" --- Multistage --- \n")

### Select some rows, then from each row a random selection.
###
### This will be tricky! If we want, say, medium-small number of pixels, how many rows do we pick, and then pixels from those rows?
###

### Note: The % of *zeros* should match the % to show

# Create pixmap overlay, of white pixels and transparent pixels to overlay the image
px.sample.multistage <- function(pcent, fname, Height, Width){
  
  # Suppose we want medium-small number of pixels.
  # We could select 20% of the rows, and 50% of the pixels in each row (20% * 50% = 10%, as required).
  # Or, we could select 50% of the rows, and 20% of the pixels in each row (50% * 20% = 10%, as required).
  # Or, of course, lots of other ways...??
  #
  # Let's split a bit: sqrt(0.10) = 0.316, so let's say 0.316 = 31.6% of rows.
  # Then, 10% / 31.6% = 0.316 or 31.6% of the pixels in those rows (that is, 31.6% * 31.6& = 10%, as required).
  #
  
  pcent <- pcent/100 # Convert % to a decimal
  pcent.rows <- floor( sqrt(pcent)*100 ) / 100
  pcent.withinrows <- pcent/pcent.rows
  
  
  set.seed(10000)
  
  num <- Width * Height # Image size: Number of pixels
  
  add <- array( 1, dim=c(Height, Width))

  
  # Select the cols to use
  select.rows <- rbinom(Height, 1, 1-pcent.rows)  # Take a random sample of pcent% of pixels.
  cat("Multistage: Selecting ", pcent.rows*100, "% of rows.\n")
  
#  cat("   These are the selected rows:", which(select.rows>0),"\n")
  
  
  
  
  #add[ which(select.rows>0),  ] <- 1
  
  # Then select pixels within each row, each row being done separately
  count <- 0
  for (j in which(select.rows==0)){
    count <- count + 1
    select.cols <- rbinom(Width, 1, 1-pcent.withinrows)
#    cat("            Selecting ", pcent.withinrows*100, "% of columns within row j=",j,".\n")
#
    add[j, which(select.cols==0)] <- 0
    if (count==1) {
#      cat(sum(select.cols),"\n")
#      cat(">>>>> j = ",j,"\n")
#      cat("select.cols:",which(select.cols==0),"\n")
#      cat("add[j,1:15] =", add[j,1:15],"\n")
    }
  }
#  cat("COUNT:",count," rows used\n")
#  cat("Number of rows of just zeros:", sum(rowSums(add)==0),"\n")
#  cat("Percentages of rows of just zeros:", round(sum(rowSums(add)==0)/Height*100),"\n---\n")
#  cat("Number of rows with any number of ones:", (sum(rowSums(add)>0)),"\n")
#  cat("Percentages of rows with any number of ones:", round(sum(rowSums(add)>0)/Height*100),"\n---\n")
  
#  cat("Sum of ones:", sum(add),"\n")
#  cat("% of ones:", sum(add)/(Height*Width)*100,"\n")
#  cat("*** % of zeros:", round(sum(add==0)/(Height*Width)*100),"***\n---\n")
 
  img <- array( dim=c(Height, Width), add) # This 0s and 1s, arranged as an array the same size as the image
  img.pm <- pixmapIndexed(data = img, nrow=Height, ncol=Width) #, col=c(NA,"#FFFFFF") )
  write.pnm(file=fname, object=img.pm, type="pgm")
  return(img)
}


# Create the overlays
img.50.ms <- px.sample.multistage(50, "img50.pgm", Height=Height, Width=Width)
img.25.ms <- px.sample.multistage(25, "img25.pgm", Height=Height, Width=Width)
img.10.ms <- px.sample.multistage(10, "img10.pgm", Height=Height, Width=Width)
img.05.ms <- px.sample.multistage(05,  "img5.pgm", Height=Height, Width=Width)
#img.01 <- px.sample(.01, "img1.pgm", Height=Height, Width=Width)

AspectRatio <- Height/Width
#quartz() #width=7, height=7 * AspectRatio)      
#par( mar=c(0,0,0,0))
img <- read.pnm(file="crazy-emotion-eyewear-2015-SMALLEST.ppm")   

plot(img)   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.05.ms), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Multi-stage random sample: small number of pixels", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R05-multistage.png", width=Width, height=Height, units="px")
dev.off()


plot(img)   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.10.ms), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Multi-stage random sample: medium-small number of pixels", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R10-multistage.png", width=Width, height=Height, units="px")
dev.off()


plot(img)   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.25.ms), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Multi-stage random sample: medium-large number of pixels", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R25-multistage.png", width=Width, height=Height, units="px")
dev.off()


plot(img)   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.50.ms), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Multi-stage random sample: large number of pixels", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R50-multistage.png", width=Width, height=Height, units="px")
dev.off()






###
### STRATIFIED RANDOM SAMPLE ###
###

cat(" --- Stratified --- \n")

###



# Pre-read the two images: Greenery and non-Greenery, to identify where the bits are to be sampled
img.Greenery <- read.pnm(file="crazy-emotion-eyewear-2015-SMALLEST-Greenery.ppm")   
img.NONGreenery <- read.pnm(file="crazy-emotion-eyewear-2015-SMALLEST-NONGreenery.ppm")   

# Create the overlays
img.50.str  <- px.sample.SRS(50, "img50.pgm", Height=Height, Width=Width)
img.25.str <- px.sample.SRS(25, "img25.pgm", Height=Height, Width=Width)
img.10.str <- px.sample.SRS(10, "img10.pgm", Height=Height, Width=Width)
img.05.str <- px.sample.SRS(05,  "img5.pgm", Height=Height, Width=Width)
#img.01 <- px.sample(.01, "img1.pgm", Height=Height, Width=Width)

AspectRatio <- Height/Width


plot(img.Greenery)   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.50.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Stratified random sample: large number of pixels: Greenery", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R50-stratified-GREENERY.png", width=Width, height=Height, units="px")
dev.off()

plot(img.NONGreenery)   # Plot the imagetest <- image( 1:Width, 1:Height, t(img.50.str.G), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.50.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Stratified random sample: large number of pixels: Person", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R50-stratified-NONGREENERY.png", width=Width, height=Height, units="px")
dev.off()

plot(img )   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.50.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
test <- image( 1:Width, 1:Height, t(img.50.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Stratified random sample: large number of pixels: Combined", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R50-stratified-COMBINED.png", width=Width, height=Height, units="px")
dev.off()



#quartz() #width=7, height=7 * AspectRatio)      
#par( mar=c(0,0,0,0))
plot(img.Greenery)   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.25.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Stratified random sample: medium-large number of pixels: Greenery", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R25-stratified-GREENERY.png", width=Width, height=Height, units="px")
dev.off()

plot(img.NONGreenery)   # Plot the imagetest <- image( 1:Width, 1:Height, t(img.50.str.G), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.25.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Stratified random sample: medium-large number of pixels: Person", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R25-stratified-NONGREENERY.png", width=Width, height=Height, units="px")
dev.off()

plot(img )   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.25.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
test <- image( 1:Width, 1:Height, t(img.25.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Stratified random sample: medium-large number of pixels: Combined", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R25-stratified-COMBINED.png", width=Width, height=Height, units="px")
dev.off()


#quartz() #width=7, height=7 * AspectRatio)      
#par( mar=c(0,0,0,0))
plot(img.Greenery)   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.10.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Stratified random sample: medium-small number of pixels: Greenery", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R10-stratified-GREENERY.png", width=Width, height=Height, units="px")
dev.off()

plot(img.NONGreenery)   # Plot the imagetest <- image( 1:Width, 1:Height, t(img.50.str.G), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.10.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Stratified random sample: medium-small number of pixels: Person", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R10-stratified-NONGREENERY.png", width=Width, height=Height, units="px")
dev.off()

plot(img )   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.10.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
test <- image( 1:Width, 1:Height, t(img.10.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Stratified random sample: medium-small number of pixels: Combined", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R10-stratified-COMBINED.png", width=Width, height=Height, units="px")
dev.off()




#quartz() #width=7, height=7 * AspectRatio)      
#par( mar=c(0,0,0,0))
plot(img.Greenery)   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.05.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Stratified random sample: small number of pixels: Greenery", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R05-stratified-GREENERY.png", width=Width, height=Height, units="px")
dev.off()

plot(img.NONGreenery)   # Plot the imagetest <- image( 1:Width, 1:Height, t(img.50.str.G), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.05.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Stratified random sample: small number of pixels: Person", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R05-stratified-NONGREENERY.png", width=Width, height=Height, units="px")
dev.off()

plot(img)   # Plot the image
box(lwd=3)
test <- image( 1:Width, 1:Height, t(img.05.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
test <- image( 1:Width, 1:Height, t(img.05.str), add=TRUE, col=c(NA,"#FFFFFF"))  # NA causes transparent pixels; overlay the Overlay!
title("Stratified random sample: small number of pixels: Combined", col.main=blueTransparent, cex.main=4)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLEST-R05-stratified-COMBINED.png", width=Width, height=Height, units="px")
dev.off()





###
### NON-RANDOM SAMPLE ###
###

cat(" --- Non-random --- \n")

###


##########
### NOW, load the non-random samples, to add the borders
img <- readPNG("crazy-emotion-eyewear-2015-SMALLER-NonR05.png")
plot( as.raster(img))   # Plot the image
box(lwd=3)
text(dim(img)[2]/2, dim(img)[1]/2, "Non-random:\n small sample of pixels", cex=5, col=blueTransparent)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLER-NonR05-boxed.png", width=Width, height=Height, units="px")
dev.off()

img <- readPNG("crazy-emotion-eyewear-2015-SMALLER-NonR10.png")
plot( as.raster(img))   # Plot the image
box(lwd=3)
text(dim(img)[2]/2, dim(img)[1]/2, "Non-random:\n medium-small number of pixels", cex=5, col=blueTransparent)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLER-NonR10-boxed.png", width=Width, height=Height, units="px")
dev.off()

img <- readPNG("crazy-emotion-eyewear-2015-SMALLER-NonR25-ALT.png")
plot( as.raster(img))   # Plot the image
box(lwd=3)
text(dim(img)[2]/2, dim(img)[1]/2, "Non-random:\n medium-large\n number of pixels", cex=5, col=blueTransparent)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLER-NonR25-ALT-boxed.png", width=Width, height=Height, units="px")
dev.off()

img <- readPNG("crazy-emotion-eyewear-2015-SMALLER-NonR50.png")
plot( as.raster(img))   # Plot the image
box(lwd=3)
text(dim(img)[2]/2, dim(img)[1]/2, "Non-random:\n large number\n of pixels", cex=5, col=blueTransparent)
dev.copy(png, file="crazy-emotion-eyewear-2015-SMALLER-NonR50-boxed.png", width=Width, height=Height, units="px")
dev.off()



