# Define the six steps to use repeatedly
SixSteps2 <- function( Flag = 0, # 0 means to flag nothing 
                      Text = NA, 
                      Labs = "Long", 
                      Arrows = TRUE, 
                      seed = NA, ...){
  # FLAG is the box flagged for adding additional text; a digits from 1 to 6
  # We count from the top down, so Flag=1 corresponds to Step 1: Ask
  #
  # TEXT is the extra text that it contains
  #
  # if seed is NA (=the defaut), the items are labelled in the correct order.
  # Otherwise, the seed is used to generate the labels in a random order

    Labels.Long <- c(
      "Ask the question",
      "Design the study",
      "Collect the data",
      "Classify and summarise the data",
      "Analyse the data",
      "Report the results")

    Labels.Short <- c("Ask",
                      "Design",
                      "Collect",
                      "Describe",
                      "Analyse",
                      "Report")

  ## TMP
  ImageAsk <- ifelse(Flag == 1, 
                     "icons/SixSteps/iconmonstr-help-5-240.png",
                     "icons/SixSteps/iconmonstr-help-6-240.png")
  ImageDesign <- ifelse(Flag == 2,
                        "icons/SixSteps/iconmonstr-brick-3-240.png",
                        "icons/SixSteps/iconmonstr-brick-4-240.png")
  ImageCollect <- ifelse(Flag == 3, 
                         "icons/SixSteps/iconmonstr-flask-21-240.png",
                         "icons/SixSteps/iconmonstr-flask-1-240.png")
  ImageClassifySummarise <- ifelse(Flag == 4, 
                                   "icons/SixSteps/iconmonstr-chart-1-240.png",
                                   "icons/SixSteps/iconmonstr-chart-2-240.png")
  ImageAnalyse <- ifelse(Flag == 5, 
                         "icons/SixSteps/iconmonstr-calculator-1-240.png",
                         "icons/SixSteps/iconmonstr-calculator-2-240.png")
  ImageReport <- ifelse(Flag == 6, 
                         "icons/SixSteps/iconmonstr-pencil-square-filled-240.png",
                         "icons/SixSteps/iconmonstr-pencil-square-lined-240.png")
  
  imageList <- c(ImageAsk,
                 ImageDesign,
                 ImageCollect,
                 ImageClassifySummarise,
                 ImageAnalyse,
                 ImageReport)

  
  # SETTINGS
  boxGap <- 5
  boxWidth <- 2.5
  boxHeight <- 2.5
  
  edgeBottomGap <- 1.5 
  edgeTopGap <- edgeBottomGap * 3 
  edgeGap <- edgeBottomGap

  arrowToImageGap <- 0.25
  
  textHeight <- 2.25
  textToImagegap <- 2.0
  
  plotWidth  <- (2 * edgeGap) + (6 * boxWidth) + (5 * boxGap)
  plotHeight <- edgeTopGap + edgeBottomGap + textToImagegap + (1 * boxHeight) + (textHeight)
  

  # How much to enlarge chosen image
  enlargeFactor <- rep(0.8, 6)
  if (Flag > 0 ) enlargeFactor[Flag] <- 1.2
  
  
  # CANVAS
  par( mar = c(0.15, 0.15, 0.15, 0.15))
  
  
  ### SETUP
  shape::emptyplot(xlim = c(0, plotWidth), # No change
                   ylim = c(0, plotHeight),
                   asp = 1) # ELSE  asp=1 or requested
  
  pos <- array(NA, dim = c(6, 2)) # One for each of the six steps
  
 
  # DEFINE box *midpoints*
  boxY <- plotHeight - edgeTopGap - (boxHeight/2)
  pos[1, ] <- c(edgeGap + (0.5 * boxWidth), boxY )
  pos[2, ] <- c(edgeGap + boxWidth + boxGap + (0.5 * boxWidth), boxY )
  pos[3, ] <- c(edgeGap + 2 * (boxWidth + boxGap) + (0.5 * boxWidth), boxY )
  pos[4, ] <- c(edgeGap + 3 * (boxWidth + boxGap) + (0.5 * boxWidth), boxY )
  pos[5, ] <- c(edgeGap + 4 * (boxWidth + boxGap) + (0.5 * boxWidth), boxY )
  pos[6, ] <- c(edgeGap + 5 * (boxWidth + boxGap) + (0.5 * boxWidth), boxY )
  
  
  # DRAW ARROWS FIRST, then over plot with images
  for (i in 1:5){ # FIVE arrow needed between SIX boxes

    # If the FROM box is enlarge, shorten that arrow side a bit
    fromArrow <- pos[i, 1] + (boxWidth/ 2) * enlargeFactor[1] + arrowToImageGap
    if ( i == Flag ) fromArrow <- fromArrow + 2
    
    # If the TO box is enlarge, shorten that arrow side a bit
    toArrow <- pos[i + 1, 1] - (boxWidth / 2) * enlargeFactor[1] - arrowToImageGap
    if ( (i + 1 ) == Flag ) toArrow <- toArrow - 2
      
    # Draw arrow
    diagram::straightarrow(from = c( fromArrow,
                                     pos[i, 2] ),
                           to   = c( toArrow,
                                     pos[i + 1, 2] ) )
  }

  
  # DRAW BOXES
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
                            bty = "n", # Removes box
                            add = TRUE)
  }
  
  # Show small text
  for (i in 1:6) {
    text(y = plotHeight - (edgeTopGap / 2) * 1.25,
         x = pos[i, 1],
         labels = Labels.Short[i],
         col = ifelse(i == Flag, "black", grey(0.2)),
         cex = ifelse(i == Flag, 1, 0.8) )
  }
  
  
  # SHOW ARROW from chosen image to the text
  if (Flag > 0 ) {
    arrows(x0 = pos[Flag, 1],
           x1 = pos[Flag, 1],
#           y0 = plotHeight - edgeTopGap - (boxHeight * enlargeFactor), 
           y0 = 0 + edgeBottomGap + textHeight + textToImagegap - 0.2 * (boxHeight/2), 
           y1 = 0 + edgeBottomGap + textHeight,
           angle = 15,
           length = 0.2,
           lwd = 3)


    # SHOW TEXT UNDER THE CHOSEN
    displayText <- ifelse( is.na(Text), 
                           ifelse(Labs == "Long", 
                                  Labels.Long[Flag],
                                  Labels.Short[Flag] ),
                           ifelse(Labs == "Long", 
                                  paste0( Labels.Long[Flag], ": ", Text),
                                  paste0( Labels.Short[Flag], ": ", Text ))
    )
    diagram::textrect( mid = c( plotWidth/2, 
                                edgeGap + (textHeight / 2)),
                       rady = textHeight/2,
                       radx = plotWidth/2 - 2 * edgeGap - 5,
                       lab = displayText,
                       box.col = "slategray1",
                       lcol = "slategray1",
                       shadow.size = 0)
  }
}

#SixSteps2(2)