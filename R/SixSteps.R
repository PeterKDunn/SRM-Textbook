# Define the six steps to use repeatedly
SixSteps <- function( Flag = 0, # 0 means to flag nothing 
                      Text = NA, 
                      Labs = "Long", 
                      Arrows = TRUE, 
                      upDirectory = TRUE,
                      seed = NA, ...){
  # FLAG is the box flagged for adding additional text; a digits from 1 to 6
  # We count from the top down, so Flag=1 corresponds to Step 1: Ask
  #
  # TEXT is the extra text that it contains
  #
  # if seed is NA (the default), the items are labelled in the correct order.
  # Otherwise, the seed is used to generate the labels in a random order
  
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
  
  ## TMP
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
  
  
  # SETTINGS
  # How much to enlarge chosen image
  enlargeFactor <- rep(0.50, 6)
  if (Flag > 0 ) enlargeFactor[Flag] <- 0.70
  
  # How much to enlarge chosen box
  enlargeBoxFactor <- rep(0.60, 6)
  if (Flag > 0 ) {
    enlargeBoxFactor[Flag] <- 0.80

    edgeBottomGap <- 1.1 * max( abs(diff(enlargeBoxFactor)) )
    edgeTopGap <- 1.1 * max( abs( diff(enlargeBoxFactor)) )
    edgeGap <- 1.6 * edgeBottomGap
    
  } else {
    edgeBottomGap <- 0.1 
    edgeTopGap <- 0.1
    edgeGap <- 0.5
    
  }

  boxGapHorizontal <- 1.75
  boxGapVertical <- 2.5
  boxWidth <- 2.5
  boxHeight <- 2.5
  
  
  arrowToImageGap <- 0.55
  
  textHeight <- 1.05
  smallTextHeight <- 0.1
  textToImagegap <- 0.6
  
  plotWidth  <- (2 * edgeGap) + 
                (3 * boxWidth ) + 
                (2 * boxGapHorizontal)
  plotHeight <- edgeTopGap + 
                edgeBottomGap + 
                (2 * boxHeight) + 
                (2 * smallTextHeight) + 
                (1 * boxGapVertical)
  
  
  # CANVAS
  par( mar = c(0.05, 0.05, 0.05, 0.05),
       fin = c(2.25, 2.25) * 1.5)
  
  
  ### SETUP
  shape::emptyplot(xlim = c(0, plotWidth),
                   ylim = c(0, plotHeight),
                   asp = 1) # ELSE  asp=1 or requested
  
  pos <- array(NA, dim = c(6, 2)) # One for each of the six steps
  
  
  # DEFINE box *midpoints*
  boxX <- c(edgeGap +                          (0.5 * boxWidth),
            edgeGap + (1 * boxGapHorizontal) + (1.5 * boxWidth),
            edgeGap + (2 * boxGapHorizontal) + (2.5 * boxWidth),
            edgeGap + (2 * boxGapHorizontal) + (2.5 * boxWidth),
            edgeGap + (1 * boxGapHorizontal) + (1.5 * boxWidth),
            edgeGap +                          (0.5 * boxWidth))
  boxY <- c( plotHeight - edgeTopGap - (0.5 * boxWidth),
             plotHeight - edgeTopGap - (0.5 * boxWidth),
             plotHeight - edgeTopGap - (0.5 * boxWidth),
             edgeBottomGap + (0.5 * boxWidth),
             edgeBottomGap + (0.5 * boxWidth),
             edgeBottomGap + (0.5 * boxWidth))

  for (i in 1:6){
    pos[i, ] <- c( boxX[i],
                   boxY[i] )
  }
  
  
  # DRAW ARROWS FIRST, then over plot with images
  arrPos <- c(0.5, 0.5, 
              0.45, # A bit lower, to allow for small text
              0.5, 0.5) 
  for (i in 1:5){ # FIVE arrow needed between SIX boxes
    
    fromArrow <- pos[i, 1]
    toArrow   <- pos[i + 1, 1]

    diagram::straightarrow(from = c( pos[i, 1],
                                     pos[i, 2] ),
                           to   = c( pos[i + 1, 1],
                                     pos[i + 1, 2] ),
                           arr.pos = arrPos[i] )
  }
  
  # Draw arrow from box 6 to 1... in a lighter shade
  diagram::straightarrow(from = c( pos[6, 1],
                                   pos[6, 2] ),
                         to   = c( pos[1, 1],
                                   pos[1, 2] ),
                         lcol = "grey",
                         lty = 3,
                         arr.pos = 0.55) # A bit higher, to allow for small text

  
  
  # COVER WITH WHITE BOXES
  for (i in (1:6)){
    polygon( x = c(pos[i, 1] - (boxWidth/2 * enlargeBoxFactor[i]),
                   pos[i, 1] - (boxWidth/2 * enlargeBoxFactor[i]),
                   pos[i, 1] + (boxWidth/2 * enlargeBoxFactor[i]),
                   pos[i, 1] + (boxWidth/2 * enlargeBoxFactor[i])),
             y = c(pos[i, 2] - (boxHeight/2 * enlargeBoxFactor[i]),
                   pos[i, 2] + (boxHeight/2 * enlargeBoxFactor[i]) + 4 * smallTextHeight,
                   pos[i, 2] + (boxHeight/2 * enlargeBoxFactor[i]) + 4 * smallTextHeight,
                   pos[i, 2] - (boxHeight/2 * enlargeBoxFactor[i])),
             border = "white", #ifelse( i == Flag, "black", "white"),
             col = "white")
  }
  
  # DRAW IMAGES
  Deltax <- boxWidth / 2
  Deltay <- boxHeight / 2 
  
  for (i in 1 : 6 ) { #SIX steps}
    
    xLo <- pos[i, 1] - (Deltax * enlargeFactor[i] )
    xHi <- pos[i, 1] + (Deltax * enlargeFactor[i] ) 
    yLo <- pos[i, 2] - (Deltay * enlargeFactor[i] )
    yHi <- pos[i, 2] + (Deltay * enlargeFactor[i] )
    
    
    
    plotfunctions::plot_image(img =  imageList[i],
                              type = "png",
                              keep.ratio = TRUE,
                              xrange = c( xLo, xHi),
                              yrange = c( yLo, yHi),
                              bty = ifelse(i == Flag, 
                                           "o",  # Keep box
                                           "n"), # Removes box
                              add = TRUE)
  }
  
  # Show small text
  for (i in 1:6) {
    text(y = pos[i, 2] + (boxHeight / 2) * enlargeBoxFactor[i] + smallTextHeight,
         x = pos[i, 1],
         labels = Labels.Short[i],
         col = ifelse(i == Flag, "black", grey(0.3)),
         cex = ifelse(i == Flag, 1, 0.9) )
  }
  
  
  # SHOW chosen image text
  if (Flag > 0 ) {
    # SHOW TEXT IN MIDDLE
    displayText <- ifelse( is.na(Text),
                           Labels.Short[Flag],
                           Labels.Short[Flag] 
                           #ifelse(Labs == "Long", 
                            #      Labels.Long[Flag],
                             #     Labels.Short[Flag] ),
                           #ifelse(Labs == "Long", 
                            #      paste0( Labels.Long[Flag], ": ", Text),
                             #     paste0( Labels.Short[Flag], ": ", Text ))
    )
    diagram::textrect( mid = c( plotWidth/2, 
                                plotHeight/2 ),
                       radx = (plotWidth /2 ) - (boxWidth / 2) * 1.5,
                       rady = (textHeight/2) + (edgeGap),
                       lab = Text,
                       box.col = gray(0.9),
                       lcol = gray(0.9),
                       cex = 0.95,
                       shadow.size = 0)
  }
  #box()
}

#SixSteps(3, "Some text here")

