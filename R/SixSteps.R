# Define the six steps to use repeatedly
SixSteps <- function( Flag = 0, # 0 means to flag nothing 
                      Text = NA, 
                      Labs = "Long", 
                      Arrows = TRUE, 
                      upDirectory = TRUE,
                      seed = NA, ...){
  # Flag  is the box flagged for adding additional text; a digits from 1 to 6
  # We count from the top down, so Flag=1 corresponds to Step 1: Ask
  #
  # Text  is the extra text that it contains; can be a vector (e.g., c("Line 1", "Line 2"))
  #
  # if seed is NA (the default), the items are labelled in the correct order.
  # Otherwise, the seed is used to generate the labels in a random order
  
  
  ### LABELS
  Labels.Long <- c(
    "Ask the question",
    "Design the study",
    "Collect the data",
    "Classify and summarise the data",
    "Analyse the data",
    "Report the results")
  
  Labels.Short <- c("1. Ask",
                    "2. Design",
                    "3. Collect",
                    "4. Summarise",
                    "5. Analyse",
                    "6. Report")
  
  ## LOAD THE IMAGES
  imageLocations <- ifelse(upDirectory, 
                           "../icons/SixSteps/",
                           "icons/SixSteps/")
  ImageAsk <- ifelse(Flag == 1, 
                     paste0(imageLocations, "iconmonstr-help-5-240.png"),
                     paste0(imageLocations, "iconmonstr-help-6-240.png") )
  ImageDesign <- ifelse(Flag == 2,
                        paste0(imageLocations, "iconmonstr-construction-8-240.png"),
                        paste0(imageLocations, "iconmonstr-construction-35-240.png") )
  ImageCollect <- ifelse(Flag == 3, 
                         paste0(imageLocations, "iconmonstr-flask-21-240.png"),
                         paste0(imageLocations, "iconmonstr-flask-1-240.png") )
  ImageClassifySummarise <- ifelse(Flag == 4, 
                                   paste0(imageLocations, "iconmonstr-chart-1-240.png"),
                                   paste0(imageLocations, "iconmonstr-chart-2-240.png") )
  ImageAnalyse <- ifelse(Flag == 5, 
                         paste0(imageLocations, "iconmonstr-calculator-1-240.png"),
                         paste0(imageLocations, "iconmonstr-calculator-2-240.png") )
  ImageReport <- ifelse(Flag == 6, 
                        paste0(imageLocations, "iconmonstr-pencil-square-filled-240.png"),
                        paste0(imageLocations, "iconmonstr-pencil-square-lined-240.png") )
  
  imageList <- c(ImageAsk,
                 ImageDesign,
                 ImageCollect,
                 ImageClassifySummarise,
                 ImageAnalyse,
                 ImageReport)
  
  
  ### MISC
  if ( !is.na(seed)) {
    set.seed(seed)
    
    reorder <- sample(1:6)
    imageList <- imageList[ reorder ]
    
    Labels.Short <- Labels.Short[reorder]
    
    for (i in 1:6){
      Labels.Short[i] <- substr(Labels.Short[i], 
                                start = 4, 
                                stop = nchar(Labels.Short[i]))
    }

  }
  
  ### CANVAS PARAMETERS
  boxHeight <- 2.5 # Ht and Width of the boxes (i.e., the six IMAGES)
  boxWidth <- 2.5  # Make square!
                   # This is the ENLARGED size.
  shrinkBoxFactor <- 0.75
  
  gapHorizontal <- boxWidth  # Total gap between the edges of adjacent boxes
  gapVertical <- boxHeight * 1.4
  
  gapEdgeX <- 0.65  # gap between edge of images, and end of canvas
  gapEdgeY <- 1  # 
  
  gapTextHeight <- 0.3 # the height of the text 
  gapArrowBoxX <- 0.02 # gap between arrow and box
  gapArrowBoxY <- 0.02
  
  # Plotting limits
  xLo <- 0
  xHi <- gapEdgeX + (3 * boxWidth) + (2 * gapHorizontal) + gapEdgeX
  yLo <- 0
  yHi <- gapEdgeY + (2 * boxHeight) + (1 * gapVertical) + (2 * gapTextHeight) + gapEdgeY
    
  aspectRatio <- (yHi - yLo)/(xHi - xLo)
#cat("AR = ", aspectRatio,"\n")
#cat("X:", xLo, xHi, "\n")
#cat("Y:", yLo, yHi, "\n")
  
  
  # DEFINE box *midpoints*
  boxX <- c(gapEdgeX +                        (0.5 * boxWidth),  ## STEP 1
            gapEdgeX + (1 * gapHorizontal) + (1.5 * boxWidth),
            gapEdgeX + (2 * gapHorizontal) + (2.5 * boxWidth),
            gapEdgeX + (2 * gapHorizontal) + (2.5 * boxWidth),
            gapEdgeX + (1 * gapHorizontal) + (1.5 * boxWidth),
            gapEdgeX +                        (0.5 * boxWidth) ) ## STEP 6
  
  boxY <- c( gapEdgeY + gapVertical + (1.5 * boxHeight),  ## STEP 1
             gapEdgeY + gapVertical + (1.5 * boxHeight),
             gapEdgeY + gapVertical + (1.5 * boxHeight),
             gapEdgeY +               (0.5 * boxHeight),
             gapEdgeY +               (0.5 * boxHeight),
             gapEdgeY +               (0.5 * boxHeight) )  ## STEP 6
#  boxX <- boxX * aspectRatio
    
  #####################################################
  
  # SETTINGS
  
  # How much to enlarge each image
  boxShrinkage <- rep(shrinkBoxFactor, .6) # i.e. by default, all boxes are shrunk
  if (Flag > 0 ) boxShrinkage[Flag] <- 1  # Selected box is unshrunk size
  
  
  ### CANVAS AND BOX (IMAGE) LOCATIONS PARAMETERS
  pos <- array(NA, dim = c(6, 2)) # One for each of the six steps


  # CANVAS
  ### SETUP
  par( mar = c(0, 0, 0, 0),
       yaxs = "i",
       oma = c(0, 0, 0, 0) ) 

   plot(x = c(xLo, xHi), 
        y = c(yLo, yHi),
        xlim = c(xLo, xHi),
        ylim = c(yLo, yHi),
        #asp = aspectRatio,
        xlab = "", 
        ylab = "", 
        type = "n",
        axes = FALSE)

#grid()
#cat("x:", xLo, xHi, "\n")
#cat("y:", yLo, yHi, "\n")
#box(); axis(side=1); axis(side=2)
#abline(h = 0:10, col="red")


  # Plot each box/image
  for (i in 1:6){
    pos[i, ] <- c( boxX[i],
                   boxY[i] )
  }
  
  
  # DRAW ARROWS FIRST, then over plot with images
  if (Arrows) {
    arrowStartX <- c(boxX[1] + (boxWidth/2) + gapArrowBoxX,  # BOX 1 to box 2
                     boxX[2] + (boxWidth/2) + gapArrowBoxX,  # BOX 2 to box 3
                     boxX[3],                                # BOX 3 to box 4
                     boxX[4] - (boxWidth/2) - gapArrowBoxX,  # BOX 4 to box 5
                     boxX[5] - (boxWidth/2) - gapArrowBoxX,  # BOX 5 to box 6
                     boxX[6])
    arrowEndX <- c(boxX[2] - (boxWidth/2) - gapArrowBoxX,   # Box 1 to BOX 2
                   boxX[3] - (boxWidth/2) - gapArrowBoxX,   # Box 2 to BOX 3
                   boxX[4] ,                                # Box 3 to BOX 4
                   boxX[5] + (boxWidth/2) + gapArrowBoxX,   # Box 4 to BOX 5
                   boxX[6] + (boxWidth/2) + gapArrowBoxX,   # Box 5 to BOX 6
                   boxX[1])
    
    arrowStartY <- c(boxY[1],                                # BOX 1 to Box 2
                     boxY[2],                                # BOX 2 to Box 3
                     boxY[3] - (boxHeight/2) - gapArrowBoxY, # BOX 3 to Box 4
                     boxY[4],                                # BOX 4 to box 5
                     boxY[5],                                # BOX 5 to box 6
                     boxY[6] + (boxHeight/2) + gapArrowBoxY) # BOX 6 to Box 1
    arrowEndY <- c(boxY[2],                                # Box 1 to BOX 2
                   boxY[3],                                # Box 2 to BOX 3
                   boxY[4] + (boxWidth/2) + gapArrowBoxY,  # Box 3 to BOX 4
                   boxY[5],                                # Box 4 to BOX 5
                   boxY[6],                                # Box 5 to BOX 6
                   boxY[1] - (boxHeight/2) - gapArrowBoxY) # Box 6 to BOX 1
    


    for (i in 1:6){ # FIVE SOLID arrow needed between SIX boxes, for first circuit
      
      diagram::straightarrow(from = c( arrowStartX[i],
                                       arrowStartY[i] ),
                             to   = c( arrowEndX[i],
                                       arrowEndY[i] ),
                             # Draw box 6 to box 1 is lighter shade, and dashed
                             lcol = ifelse(i == 6, 
                                           "grey", 
                                           "black"),
                             lty = ifelse(i == 6, 3, 1),
                             lwd = 2,
                             arr.pos = 0.5 ) # Where to place the arrow head
    }
    }

  
  # COVER WITH WHITE BOXES
  for (i in (1:6)){
    polygon( x = c(boxX[i] - boxWidth/2 * aspectRatio,
                   boxX[i] + boxWidth/2 * aspectRatio,
                   boxX[i] + boxWidth/2 * aspectRatio,
                   boxX[i] - boxWidth/2 * aspectRatio),
             y = c(boxY[i] + boxHeight/2,
                   boxY[i] + boxHeight/2,
                   boxY[i] - boxHeight/2,
                   boxY[i] - boxHeight/2),
             border = "white", #ifelse( i == Flag, "black", "white"),
             col = "white")
  }
  
  # DRAW IMAGES
  for (i in 1 : 6 ) { #SIX steps}

    imageLocationX <-  c( boxX[i] - boxWidth/2 * aspectRatio * ifelse(Flag == i, 
                                                                      1, 
                                                                      shrinkBoxFactor),
                          boxX[i] + boxWidth/2 * aspectRatio * ifelse(Flag == i, 
                                                                      1, 
                                                                      shrinkBoxFactor))
    imageLocationY <- c( boxY[i] - boxHeight/2 * ifelse(Flag == i, 
                                                        1, 
                                                        shrinkBoxFactor),
                         boxY[i] + boxHeight/2 * ifelse(Flag == i, 
                                                        1, 
                                                        shrinkBoxFactor))
                 
    plotfunctions::plot_image(img =  imageList[i],
                              type = "png",
                              #keep.ratio = TRUE,
                              xrange = imageLocationX,
                              yrange = imageLocationY,
                              lwd = 2,
                              bty = ifelse(i == Flag, 
                                           "o",  # Keep box
                                           "n"), # Removes box
                              add = TRUE)
  }
  
  # Show small text for each icon
  for (i in 1:6) {
    if (i %in% (1:3)){ # At the top
      text(x = boxX[i],
           y = boxY[i] + boxHeight/2 + (2 * gapTextHeight),
           labels = Labels.Short[i],
           col = ifelse(i == Flag, "black", grey(0.3)),
           cex = ifelse(i == Flag, 1.2, 1.0) )
    } else { # At the bottom
      text(x = boxX[i],
           y = boxY[i] - boxHeight/2 - (2 * gapTextHeight),
           labels = Labels.Short[i],
           col = ifelse(i == Flag, "black", grey(0.3)),
           cex = ifelse(i == Flag, 1.2, 1.0) )
    }
    }
  
  
  # SHOW chosen image text
  if (Flag > 0 ) {
    # SHOW TEXT IN MIDDLE
    displayText <- ifelse( is.na(Text),
                           Labels.Short[Flag],
                           Labels.Short[Flag] 
    )
    
    # Text in centre of image
    diagram::textrect( mid = c( boxX[2], 
                                mean( c(boxY[2],
                                        boxY[5]) ) ),
                       radx = boxWidth/2 + gapHorizontal,
                       rady = gapVertical/2 - (2 * gapTextHeight),
                       lab = Text,
                       box.col = gray(0.9),
                       lcol = gray(0.9),
                       cex = 1.1,
                       shadow.size = 0)
  }
  #box()
}

#SixSteps(3, "Some text here")

