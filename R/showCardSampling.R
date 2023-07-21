showCardSampling <- function(i, numSamples, numCardsPerSample){
  
  # i  is the card number
  # FOR THIS VALUE OF i, DETERMINE WHERE TO STOP:
  doThisManySamples <- ( (i - 1) %/% numCardsPerSample ) + 1
  # So, if i = 1 to 10, we will get  doThisManySample to be one: The first "sample pack"
  balanceOfCards <- (i - 1) %/% numCardsPerSample
  
  ### CARDS ARE OF SIZE 500 x 726
  asp.cards <- 726/500 # Aspect ratio: Height over Width
  
  ### LOAD CARD IMAGES
  fileList  <- list.files("Cards", 
                          full.names = TRUE)
  fileList2 <- list.files("Cards", 
                          full.names = FALSE) # No path name
  
  # NOTE: I have removed the jokers from the files 
  
  numFiles <- length(fileList) - 1 
  # Should be 52 - 1 = 51, as we don't select the card showing on the pack
  
  # Parameter calculator
  gapCalc <- function(numCardSets, ratio = 0.05) {
    # numCardSets: How many sets of cards to be shown
    # ratio: The ratio of gap between cards, to card width.
    #        So default means gap is 0.2 the size of the width of cards being shown
    cardWidth <- 4 / ( numCardSets + (numCardSets - 1) * ratio)
    list( cardWidth = cardWidth, 
          gapWidth = ratio * cardWidth)
  }
  
  out <- gapCalc(numSamples)
  
  samplePackWidth <- out$cardWidth
  sampleGapWidth <- out$gapWidth
  
  # Set up canvas
  par(mar = c(0.05, 0.05, 0.05, 0.05)) 
  plot( x = c(-2.1, 2.1), 
        y = c(-2.25, 1.5), 
        type = "n",
        xlab = "",
        asp = 1, #asp.cards,
        ylab = "",
        axes = FALSE)
  
  # INDICATE FULL PACK AT TOP OF SCREEN:
  # Show whole pack at top of canvas
  #imPack  <- png::readPNG(fileList[ numFiles])
  
  # Now create the top pack, but offsetting a series of 10 cards.
  # Since we do not see the actual card, it doesn't matter what the hidden cards are,
  # so we use the BLANK card.
  #jitterPack <- -0.01
  #for (iii in 1:10) { # That is, we draw a stack of 10 cards
  #  jitterThis <- jitterPack * (iii - 1)
  
  #}
  
  # Add some explanation text about the Population
  text(0, 0.9,
       "In the pack (the 'population'), 50% of cards are red",
       cex = 1.1)
  text( 0, 0.19,
        paste("Take", 
              numSamples, 
              "samples of", 
              numCardsPerSample, 
              "cards each\n(starting with a full deck each time)"),
        col = grey(0.2), 
        cex = 1.1)
  
  pileNumber <- 1
  selection <- sample(1:numFiles, 
                      min(i, numCardsPerSample), 
                      replace = FALSE) # The cards to get in first pile
  selection.number <- 0
  
  # Percentage-red setup text
  #countRed <- 0
  #text( -2.1 , -2.1,
  #      "% red:", 
  #      pos = 2 )
  
  ### Set seed: DO NOT set outside this function!
  seedvalue <- 9238324
  set.seed(seedvalue)
  
  # GET ALL CARDS NOW!
  # We need to get  i  cards, but need each "pile" to be done separately.
  cardsList <- array( dim = numSamples * numCardsPerSample)
  redPercentage <- array( dim = numSamples)
  countRed <- 0
  
  for (k in 1:numSamples){ # For each pile...
    #for (k in numSamples){ # For each pile...      
    # Resample the cards to got for this pile
    cardsForThisPile <- (numCardsPerSample * (k - 1) + 1) : (numCardsPerSample*k)
    cardsList[ cardsForThisPile ] <- sample.int(numFiles, 
                                                numCardsPerSample, 
                                                replace = FALSE) 
    
    # And may as well count the number of red cards while we are here...
    countRed[k] <- sum ( grepl("diamonds", 
                               fileList[ cardsList[ cardsForThisPile ] ], 
                               fixed = TRUE ) | 
                           grepl("hearts",   
                                 fileList[cardsList[ cardsForThisPile ] ], 
                                 fixed = TRUE ) ) 
  }
  # We now have the list of cards from start to end. 
  # So now we just select what we need as we need them.
  
  
  ###
  ### SO NOW, DISPLAY THE CARDS:
  ###
  
  jitterCards <- 1 # how much to offset the cards in any one pile
  pileCount <- 1
  jitterCount <- 0
  cardNumberInThePile <- 0
  
  for (k in 1:i){ # We need to sample  i  cards; i  is the card number
    
    cardNumberInThePile <- cardNumberInThePile + 1
    
    if (k >= ((pileCount * numCardsPerSample) + 1) ) { # NEW PILE STARTS
      
      cardNumberInThePile <- 0
      
      # At the end of this pile, report the percentage red, and reset the jitter
      text( -1.75 + (pileCount - 0.5) + sampleGapWidth, -2.1,
            paste(round( countRed[pileCount] / numCardsPerSample * 100), 
                  "% red",
                  sep = ""),
            pos = 2)
      
      # Move to next pile
      pileCount <- pileCount + 1 # Move to next pile, so start the random selection again:
      
      # And restart the offset for displaying the cards
      jitterCount <- 0
    }
    
    # Locate card corners:
    jitterCount <- jitterCount + 1
    
    leftX <- -2 + (pileCount - 1) + sampleGapWidth 
    rightX <- leftX + samplePackWidth 
    
    botY <- -1.8 
    topY <-  botY + asp.cards * (rightX - leftX) 
    
    thisImage  <- png::readPNG(fileList[ cardsList[ k ] ] )
    
    rasterImage(thisImage,  
                leftX, 
                botY, 
                rightX, 
                topY,
                angle = jitterCards * (cardNumberInThePile - (numCardsPerSample / 2)))
    
  }
  # Add the percentage red after the last pile is printed
  if (i == (pileCount * numCardsPerSample) ) {
    text( -1.75 + (pileCount - 0.5) + sampleGapWidth, -2.1,
          paste(round( countRed[pileCount] / numCardsPerSample * 100), 
                "% red", 
                sep = ""),
          pos = 2)
  }
}
