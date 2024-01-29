library("SRMData")     # Textbook data files: install.packages("~/Documents/Git-Projects/SRMData_0.1.0.tar.gz", repos=NULL)
library("kableExtra")  # For tables
library("ozmaps")      # For Australia maps in graphics chapter
library("NHANES")      # For NHANES data
library("knitr")
library("diagram")     # For diagrams
library("DT")          # For displaying tables
library("webshot")     # For screen shot of HTML animations
library("plot3D")
library("latticeExtra")
library("leaflet")
library("plotrix")     # Pie charts
library("scales")
library("png")
library("plotly")
library("viridis")
library("dplyr")
library("webexercises") # For inline exercises
library("gifski") # Trying for animations: https://bookdown.org/yihui/rmarkdown-cookbook/animation.html
library("plotfunctions") # For adding images (e.g. icons) to diagrams
library("MASS")
library("cowplot")
library("dygraphs")
library("slickR")
library("qrcode")
#library("exams")
library("readr") # For "El Nino" 


# set global chunk options
options(formatR.arrow = TRUE,
        width = 90)

# Environment defaults
knitr::opts_chunk$set(fig.pos = "hbtp")   # Place tables HERE and so on


# Chunk options: Options must all be on one line
knitr::opts_chunk$set(
  cache = FALSE, echo = FALSE, warning = FALSE, message = FALSE
)

# Set tables so that NA cells are not printed as NA, but left blank
options(knitr.kable.NA = '')



### COLOURS
someDefaultColoursTransparent <- viridis::viridis(8, 
                                                  alpha = 0.4)
# In order: NA, Explanatory, Chance, Design, Extraneous, NA
ResponseColourTransparent <- someDefaultColoursTransparent[1]
ChanceColourTransparent <- someDefaultColoursTransparent[2]
ExplanatoryColourTransparent <- someDefaultColoursTransparent[3]
DesignColourTransparent <- someDefaultColoursTransparent[4]
ExtraneousColourTransparent <- someDefaultColoursTransparent[5]
GroupColourTransparent <- someDefaultColoursTransparent[6]
IndividualColourTransparent <- someDefaultColoursTransparent[7]
BlockColourTransparent <- someDefaultColoursTransparent[8]

# Convert to equiv sold, manually...
ResponseColour <- rgb(185, 171, 191, 
                      maxColorValue = 256)
ChanceColour <- rgb(187, 183, 205, 
                    maxColorValue = 256)
ExplanatoryColour <- rgb(186, 195, 210, 
                         maxColorValue = 256)
DesignColour <- rgb(185, 206, 211, 
                    maxColorValue = 256)
ExtraneousColour <- rgb(198, 230, 203, 
                        maxColorValue = 256)
GroupColour <- rgb(223, 240, 190, ### FIX!
                   maxColorValue = 256)
IndividualColour <- rgb(187, 217, 210, ### FIX!
                        maxColorValue = 256)
BlockColour <- rgb(253, 245, 187, ### FIX!
                        maxColorValue = 256)



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


### OTHER COLOURS
blueSolid <- rgb(214, 215, 252, 
                 maxColorValue = 256)
plotSolid <- blueSolid

plotDark <- rgb(0, 0, 1,
                maxColorValue = 1)

blueTransparent <- rgb(0, 0, 1, 
                       alpha = 0.2, 
                       maxColorValue = 1)
blueTransparent0 <- rgb(0, 0, 1, 
                        alpha = 0.8, 
                        maxColorValue = 1)
blueTransparent2 <- rgb(0, 0, 0.25, 
                        alpha = 0.2, 
                        maxColorValue = 1)

### MOVED LATER, as t is too early to work here (I guess, the output not yet set)
plot.colour <-  grey(0.75) 
plot.colour0 <-  grey(0.5) 
plot.colour2 <-  grey(0.75) 

if ( knitr::is_html_output()) {
  plot.colour <- blueTransparent
  plot.colour0 <- blueTransparent0
  plot.colour2 <- blueTransparent2
}





### FUNCTIONS ###

###
findStdError <- function(x, na.rm = TRUE){
  sd(x, na.rm = TRUE) / sqrt( length(x) - sum(is.na(x)) )
}

###
realLength <- function(x, na.rm = TRUE){
  length(x) - sum(is.na(x))
}

###
### From: https://stackoverflow.com/questions/8047668/transparent-equivalent-of-given-color
makeTransparent <- function(someColor, alpha = 100){
  newColor <- col2rgb( someColor )
  apply(newColor, 
        2, 
        function(curcoldata){ rgb(red = curcoldata[1], 
                                  green = curcoldata[2],
                                  blue = curcoldata[3],
                                  alpha = alpha, 
                                  maxColorValue = 255)
        }
  )
}
