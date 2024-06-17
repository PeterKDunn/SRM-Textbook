
### COLOURS: B&W in LaTex, colour in HTML
# HTML colours
if (knitr::is_html_output()) {
  numCols <- 30
  someDefaultColoursTransparent <- viridis::viridis(numCols, alpha = 0.4)
  colourLocation <- round(seq(1, numCols, length = 10))
  # In order: NA, Explanatory, Chance, Design, Extraneous, NA
  ResponseColourTransparent <- someDefaultColoursTransparent[colourLocation[3]]
  ChanceColourTransparent <- someDefaultColoursTransparent[colourLocation[4]]
  ExplanatoryColourTransparent <- someDefaultColoursTransparent[colourLocation[5]]
  DesignColourTransparent <- someDefaultColoursTransparent[colourLocation[6]]
  ExtraneousColourTransparent <- someDefaultColoursTransparent[colourLocation[7]]
  GroupColourTransparent <- someDefaultColoursTransparent[colourLocation[8]]
  IndividualColourTransparent <- someDefaultColoursTransparent[colourLocation[9]]
  BlockColourTransparent <- someDefaultColoursTransparent[colourLocation[10]]
  
  
  
  # Convert to equiv solid, manually...
  ResponseColour <- rgb(187, 188, 208, maxColorValue = 256)
  ChanceColour <- rgb(187, 183, 205, maxColorValue = 256)
  ExplanatoryColour <- rgb(186, 195, 210, maxColorValue = 256)
  DesignColour <- rgb(185, 206, 211, maxColorValue = 256)
  ExtraneousColour <- rgb(198, 230, 203, maxColorValue = 256)
  GroupColour <- rgb(223, 240, 190, ### FIX!
                     maxColorValue = 256)
  IndividualColour <- rgb(187, 217, 210, ### FIX!
                          maxColorValue = 256)
  BlockColour <- rgb(253, 245, 187, ### FIX!
                     maxColorValue = 256)
  
}

# LaTeX colours
if (knitr::is_latex_output()) {
  numCols <- 30
  someDefaultColoursTransparent <- grey( (0:numCols)/numCols, alpha = 0.4)
  colourLocation <- round(seq(1, numCols, length = 10))
  # In order: NA, Explanatory, Chance, Design, Extraneous, NA
  ResponseColourTransparent <- someDefaultColoursTransparent[colourLocation[3]]
  ChanceColourTransparent <- someDefaultColoursTransparent[colourLocation[4]]
  ExplanatoryColourTransparent <- someDefaultColoursTransparent[colourLocation[5]]
  DesignColourTransparent <- someDefaultColoursTransparent[colourLocation[6]]
  ExtraneousColourTransparent <- someDefaultColoursTransparent[colourLocation[7]]
  GroupColourTransparent <- someDefaultColoursTransparent[colourLocation[8]]
  IndividualColourTransparent <- someDefaultColoursTransparent[colourLocation[9]]
  BlockColourTransparent <- someDefaultColoursTransparent[colourLocation[10]]
  
  
  
  # Convert to equiv solid, manually...
  someDefaultColours <- grey( (0:numCols)/numCols )
  colourLocation <- round(seq(1, numCols, length = 10))
  # In order: NA, Explanatory, Chance, Design, Extraneous, NA
  ResponseColour <- someDefaultColours[colourLocation[3]]
  ChanceColour <- someDefaultColours[colourLocation[4]]
  ExplanatoryColour <- someDefaultColours[colourLocation[5]]
  DesignColour <- someDefaultColours[colourLocation[6]]
  ExtraneousColour <- someDefaultColours[colourLocation[7]]
  GroupColour <- someDefaultColours[colourLocation[8]]
  IndividualColour <- someDefaultColours[colourLocation[9]]
  BlockColour <- someDefaultColours[colourLocation[10]]
}




numCols <- 30
someDefaultColoursTransparent <- grey( (0:numCols)/numCols, alpha = 0.4)
colourLocation <- round(seq(1, numCols, length = 10))
# In order: NA, Explanatory, Chance, Design, Extraneous, NA
ResponseColourTransparent <- someDefaultColoursTransparent[colourLocation[3]]
ChanceColourTransparent <- someDefaultColoursTransparent[colourLocation[4]]
ExplanatoryColourTransparent <- someDefaultColoursTransparent[colourLocation[5]]
DesignColourTransparent <- someDefaultColoursTransparent[colourLocation[6]]
ExtraneousColourTransparent <- someDefaultColoursTransparent[colourLocation[7]]
GroupColourTransparent <- someDefaultColoursTransparent[colourLocation[8]]
IndividualColourTransparent <- someDefaultColoursTransparent[colourLocation[9]]
BlockColourTransparent <- someDefaultColoursTransparent[colourLocation[10]]



# Convert to equiv solid, manually...
someDefaultColours <- grey( (0:numCols)/numCols )
colourLocation <- round(seq(1, numCols, length = 20))
# In order: NA, Explanatory, Chance, Design, Extraneous, NA
ResponseColour <- someDefaultColours[colourLocation[13]]
ChanceColour <- someDefaultColours[colourLocation[14]]
ExplanatoryColour <- someDefaultColours[colourLocation[15]]
DesignColour <- someDefaultColours[colourLocation[16]]
ExtraneousColour <- someDefaultColours[colourLocation[17]]
GroupColour <- someDefaultColours[colourLocation[18]]
IndividualColour <- someDefaultColours[colourLocation[19]]
BlockColour <- someDefaultColours[colourLocation[20]]




# TEST COLOURS:
#
# plot( x = c(0, 1.6),
#       y = c(0, 1) )
# polygon( x = c(0, 0, 0.2, 0.2),
#          y = c(0, 1, 1, 0),
#          col = ResponseColourTransparent)
# polygon( x = c(0, 0, 0.2, 0.2) + 0.2,
#          y = c(0, 1, 1, 0),
#          col = ChanceColourTransparent)
# polygon( x = c(0, 0, 0.2, 0.2) + 0.4,
#          y = c(0, 1, 1, 0),
#          col = ExplanatoryColourTransparent)
# polygon( x = c(0, 0, 0.2, 0.2) + 0.6,
#          y = c(0, 1, 1, 0),
#          col = DesignColourTransparent)
# polygon( x = c(0, 0, 0.2, 0.2) + 0.8,
#          y = c(0, 1, 1, 0),
#          col = GroupColourTransparent)
# polygon( x = c(0, 0, 0.2, 0.2) + 1.0,
#          y = c(0, 1, 1, 0),
#          col = IndividualColourTransparent)
# polygon( x = c(0, 0, 0.2, 0.2) + 1.2,
#          y = c(0, 1, 1, 0),
#          col = ExtraneousColourTransparent)
# polygon( x = c(0, 0, 0.2, 0.2) + 1.4,
#          y = c(0, 1, 1, 0),
#          col = BlockColourTransparent)

# 
# plot( x = c(0, 1.6),
#       y = c(0, 1) )
# polygon( x = c(0, 0, 0.2, 0.2),
#          y = c(0, 1, 1, 0),
#          col = ResponseColour)
# polygon( x = c(0, 0, 0.2, 0.2) + 0.2,
#          y = c(0, 1, 1, 0),
#          col = ChanceColour)
# polygon( x = c(0, 0, 0.2, 0.2) + 0.4,
#          y = c(0, 1, 1, 0),
#          col = ExplanatoryColour)
# polygon( x = c(0, 0, 0.2, 0.2) + 0.6,
#          y = c(0, 1, 1, 0),
#          col = DesignColour)
# polygon( x = c(0, 0, 0.2, 0.2) + 0.8,
#          y = c(0, 1, 1, 0),
#          col = GroupColour)
# polygon( x = c(0, 0, 0.2, 0.2) + 1.0,
#          y = c(0, 1, 1, 0),
#          col = IndividualColour)
# polygon( x = c(0, 0, 0.2, 0.2) + 1.2,
#          y = c(0, 1, 1, 0),
#          col = ExtraneousColour)
# polygon( x = c(0, 0, 0.2, 0.2) + 1.4,
#          y = c(0, 1, 1, 0),
#          col = BlockColour)



### OTHER COLOURS
blueSolid <- rgb(214, 215, 252, maxColorValue = 256)
plotSolid <- blueSolid

plotDark <- rgb(0, 0, 1, maxColorValue = 1)

blueTransparent <- rgb(0, 0, 1, alpha = 0.2, maxColorValue = 1)
blueTransparent0 <- rgb(0, 0, 1, alpha = 0.8, maxColorValue = 1)
blueTransparent2 <- rgb(0, 0, 0.25, alpha = 0.2, maxColorValue = 1)

### MOVED LATER, as it is too early to work here (I guess, the output not yet set)
plot.colour <-  grey(0.75)
plot.colour0 <-  grey(0.5)
plot.colour2 <-  grey(0.75)

if (knitr::is_html_output()) {
  plot.colour <- blueTransparent
  plot.colour0 <- blueTransparent0
  plot.colour2 <- blueTransparent2
}


