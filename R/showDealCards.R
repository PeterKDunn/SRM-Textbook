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
  
  # Remove jokers: Commented out, as I just removed the jokers from the files 
  #redj <- match("red_joker.png", fileList2) # Needs to match just *file* name
  #blackj <- match("black_joker.png", fileList2)
  #fileList <- fileList[ -c(redj, blackj)] 
  
  numFiles <- length(fileList) - 1 
     # Should be 52 - 1 = 51, as we don't select the card showing on the pack (at top of screen)

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
    par(mar = rep(0.05, 4)) 
    plot( x = c(-2.1, 2.1), 
          y = c(-2.25, 1.5), 
          type = "n",
          xlab = "",
          asp = 1, #asp.cards,
          ylab = "",
          axes = FALSE)
    
    # INDICATE FULL PACK AT TOP OF SCREEN:
    # Show whole pack at top of canvas
    imPack  <- png::readPNG(fileList[ numFiles]) # Take last card to show at top
    
    # Now create the top pack, but offsetting a series of 10 cards.
    # Since we do not see the actual card, it doesn't matter what the hidden cards are,
    # so we use the BLANK card.
    jitterPack <- -0.01
    for (iii in 1:10) { # That is, we draw a stack of 10 cards
      jitterThis <- jitterPack * (iii - 1)

    }
    # Add some explanation text
    text(0, 1,
         "In the pack (the 'population'), 50% of cards are red",
         cex = 1.1)
    text( 0, 0,
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
    
    # Percentage red setup
    countRed <- 0
    text( -2.1 , -2.1,
          "% red:", 
          pos = 2 )
    
    ### Set seed: DO NOT set outside this function!
    seedvalue <- 9238324
    set.seed(seedvalue)
    
    # "DEAL" cards: That is, place all that are needed in a stack, 
    # and later we selected just those that are needed for the requested display
    cardOrder <- sample.int(numFiles,
                            numSamples * numCardsPerSample,
                            replace = FALSE)
    fileOrder <- fileList[cardOrder] # Files in "dealing" order

    
    ### Find top card in each pile; the only ones we need to show
    
    
    ### Do each pile: for (i in (1:numPiles)){ #draw pretend undercards (blanks); #draw top real card }
    numCompletePiles <- i %/% numCardsPerSample
    numInIncompletePile <- i %% numCardsPerSample
    cat("Number complete piles:", numCompletePiles, "\n")
    cat("Number in the incomplete piles:", numInIncompletePile, "\n")
    
    # For complete piles, show all the blank underscardsm, and show just the top card
    # Do same for incomplete piles, but just not as many undercards
    
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

      # Add arrows for the first pile
#      arrows(0, 0.45, -2 + (pileCount - 0.5) + sampleGapWidth, -0.56,
#             length = 0.1,
#             col = "grey",
#             angle = 15)

      cardNumberInThePile <- cardNumberInThePile + 1
      
      stopAndPrintInfo <- FALSE
      if (k == ((pileCount * numCardsPerSample) ) ) stopAndPrintInfo <- TRUE
      if (k == i) stopAndPrintInfo <- TRUE
      
      if (stopAndPrintInfo) { # END OF PILE
        # At the end of this pile, report the percentage red, and reset the jitter
        text( -2 + (pileCount - 0.5) + sampleGapWidth, -2.1,
              paste(round( countRed[pileCount] / numCardsPerSample * 100), 
                    "%", 
                    sep = ""),
              pos = 2)
        
      }
        
      if (k >= ((pileCount * numCardsPerSample) + 1) ) { # NEW PILE STARTS

        cardNumberInThePile <- 0


        # Move to next pile
        pileCount <- pileCount + 1 # Move to next pile, so start the random selection again:
       # cat("Moving to pile", pileCount,"\n")
        
        # And restart the offset for displaying the cards
        jitterCount <- 0
      
        # Add arrows for this *new* pile (so after increment)
#        arrows(0, 0.43, -2 + (pileCount - 0.5) + sampleGapWidth, -0.56,
#               length = 0.1,
#               col = "grey",
#               angle = 15)
        
      }
      
      jitterCount <- jitterCount + 1
      
      # Add the percentage red after the last pile is printed
      if (i == (pileCount * numCardsPerSample) ) {
        text( -2 + (pileCount - 0.5) + sampleGapWidth, -2.1,
              paste(round( countRed[pileCount] / numCardsPerSample * 100), 
                    "         % This is the second printing", 
                    sep = ""),
              pos = 2)
      }
      
      leftX <- -2 + (pileCount-1) + sampleGapWidth 
      rightX <- leftX + samplePackWidth 

      botY <- -1.8 
      topY <-  botY + asp.cards*(rightX - leftX) 
      
      thisImage  <- png::readPNG(fileList[ cardsList[ k ] ] )

      rasterImage(thisImage,  
                  leftX, 
                  botY, 
                  rightX, 
		  topY,
                  angle = jitterCards * (cardNumberInThePile - (numCardsPerSample / 2)))

    }

}


numSamples <- 5
numCardsPerSample <- 10
iteration <- 37

### CARDS ARE OF SIZE 500 x 726
# if (knitr::is_html_output()) {
#   for (iteration in 1:( (numSamples * numCardsPerSample) + 20)){

    iteration <- 70
     # Now pad by 10, so the images appears to "stop"
     iterationj <- min(iteration,
              numSamples * numCardsPerSample) # 1, 2, ..., 50, 50, 50, 50...
     
     showCardSampling(iterationj, 
                       numSamples = numSamples, 
                       numCardsPerSample = numCardsPerSample)
     points(-2.1, -2.25 + iteration/1000, 
            col = "white",
            cex = 0.5) # To keep getting a new plot, so the final plot holds to be looked at
     gc() # Try garbage collection to prevent "Cannot allocate vector of size" error
#   }
  
#}


numSamples <- 5
numCardsPerSample <- 10


showCardSampling(37, 
                                     numSamples = numSamples, 
                                     numCardsPerSample = numCardsPerSample)

