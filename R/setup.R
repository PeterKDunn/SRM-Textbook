library("SRMData")     # Textbook data files: install.packages("~/Documents/Git-Projects/SRMData_0.1.0.tar.gz", repos=NULL)
library("kableExtra")  # For tables
#library("ozmaps")      # For Australia maps in graphics chapter
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
library("slickR")
library("webexercises") # For inline exercises
library("gifski") # Trying for animations: https://bookdown.org/yihui/rmarkdown-cookbook/animation.html
library("plotfunctions") # For adding images (e.g. icons) to diagrams
library("MASS")
library("cowplot")
library("dygraphs")
library("slickR")
#library("qrcode")
#library("exams")
library("readr") # For "El Nino"


### Load other useful functions
source("R/NormalDistributions.R")
source("R/pad.R")
source("R/SixSteps.R")  
source("R/prepareSideBySideTable.R")



# set global chunk options
options(formatR.arrow = TRUE, width = 90)

# Environment defaults
knitr::opts_chunk$set(fig.pos = "hbtp",     # Place tables HERE and so on
                      tidy = TRUE)          # Tidy R code


# Chunk options: Options must all be on one line
knitr::opts_chunk$set(
  cache = TRUE,
  echo = FALSE,
  warning = FALSE,
  message = FALSE
)

# Set tables so that NA cells are not printed as NA, but left blank
options(knitr.kable.NA = '')





### FUNCTIONS ###

###
findStdError <- function(x, na.rm = TRUE) {
  sd(x, na.rm = TRUE) / sqrt(length(x) - sum(is.na(x)))
}

###
realLength <- function(x, na.rm = TRUE) {
  length(x) - sum(is.na(x))
}

###
### From: https://stackoverflow.com/questions/8047668/transparent-equivalent-of-given-color
makeTransparent <- function(someColor, alpha = 100) {
  newColor <- col2rgb(someColor)
  apply(newColor, 2, function(curcoldata) {
    rgb(
      red = curcoldata[1],
      green = curcoldata[2],
      blue = curcoldata[3],
      alpha = alpha,
      maxColorValue = 255
    )
  })
}


