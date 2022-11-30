library("kableExtra")  # For tables
library("oz")          # For Australia maps in graphics chapter
library("ggplot2")     # Used for plots of Australia
library("NHANES")      # or NHANES data
library("knitr")
library("diagram")     # TRYING this for diagrams
library("DT")          # For displaying tables
library("webshot")     # screen shot of HTML animations
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
library("GLMsData")
library("MASS")
library("cowplot")
library("dygraphs")
library("slickR")
library("qrcode")
#library("exams")


# set global chunk options
options(formatR.arrow = TRUE,
        width = 90)

blueSolid <- rgb(0, 0, 1, 
                 alpha = 1, 
                 maxColorValue = 1)
plotSolid <- blueSolid

blueTransparent <- rgb(0, 0, 1, 
                       alpha = 0.2, 
                       maxColorValue = 1)
plot.colour <- blueTransparent

blueTransparent2 <- rgb(0, 0, 0.25, 
                        alpha = 0.2, 
                        maxColorValue = 1)
plot.colour2 <- blueTransparent2

blueTransparent0 <- rgb(0, 0, 1, 
                        alpha = 0.8, 
                        maxColorValue = 1)
plot.colour0 <- blueTransparent0

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

# Environment defaults
knitr::opts_chunk$set(fig.pos = "hbtp")   # Place tables HERE and so on


# Chunk options: Options must all be on one line
knitr::opts_chunk$set(
  cache = TRUE, echo = FALSE, warning = FALSE, message = FALSE
)

# Set tables so that NA cells are not printed as NA, but left blank
options(knitr.kable.NA = '')

# knitr:::is_latex_output()
# knitr:::is_html_output()
# 
# This example from: https://stackoverflow.com/questions/41745170/how-to-do-different-things-in-r-in-bookdown-if-output-is-html-or-latex
# 
# if( knitr:::is_latex_output() ) {
#     xlatex ...
# } else {
#     DT...
# }
# 

