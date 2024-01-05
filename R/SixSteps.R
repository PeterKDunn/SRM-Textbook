

# Define the six steps to use repeatedly
SixSteps <- function( Flag = NA, 
                      Text = NA, 
                      Labs = "Long", 
                      Arrows = TRUE, 
                      seed = NA, ...){
  # FLAG is the box flagged for adding additional text.
  # We count from the top down, so Flag=1 corresponds to Step 1: Ask
  #
  # TEXT is the extra text that it contains
  #
  # if seed is NA (=the defaut), the items are labelled in the correct order.
  # Otherwise, the seed is used to generate the labels in a random order
  
  
  # Colours
  col.Flag <- "slategray4"
  col.Default <- "slategray1"  
  
  
  #  blueTransparent <- rgb(0, 0, 1, alpha=0.2, maxColorValue = 1)
  #  plot.colour <- blueTransparent
  #  col.Default <- blueTransparent 
  
  
  BoxWidth <- 1      # Width of a box
  BoxHeight <- 0.4  # Height of a standard box (one line of text)
  BoxGap <- 0.4     # Gap *between* boxed
  
  # To use  Text  in expressions, we need to use tildes rather than spaces
  Labels.Long <- c(
    "Ask~the~question",
    "Design~the~study",
    "Collect~the~data",
    "Classify*','~summarise~the~data",
    "Analyse~the~data",
    "Report~the~results")
  
  Labels.Short <- c("Ask",
                    "Design",
                    "Collect",
                    "Describe",
                    "Analyse",
                    "Report")
  
  if ( !is.na(seed) ){
    reSort <- sample(6)
    Labels.Long <- Labels.Long[reSort]
    Labels.Short <- Labels.Short[reSort]
  }
  
  if (Labs=="Short") Labels <- Labels.Short
  if (Labs=="Long") Labels <-  Labels.Long
  if (Labs=="None") Labels <- rep("", 6)
  if (Labs=="Random") Labels <- Labels.Long[ sample(1:length(Labels.Long))]
  if (Labs=="ShortWhenWithText") {
    Labels <- Labels.Long
    if ( !is.na(Text) ) {
      Labels[Flag] <- Labels.Short[Flag]
    }
  }
  
  # To use  Text  in expressions, we need to replace the spaces with tildes
  if (is.na(Flag) ) Flag <- 0
  

    # Some fooling about to make the main step in bold.
  if ( !(Labs=="None")){ # So if we are adding labels...
    for (j in (1:6)){    # Treat each step in the six-step process one at a time..
      Labels[j] <- paste( "expression(bold(", Labels[j],"))")
    }
  }
  
  
  
  
  par( mar = c(0, 0, 0, 0) + 0.1)
  plot( c(-BoxWidth/2, BoxWidth/2),
        c(-BoxHeight/2, 7 * BoxHeight + 6 * BoxGap),
        type = "n",
        xlab = "",
        ylab = ",",
        axes = FALSE)
  
  Box.TopCorners <- (2:7) * BoxHeight + (0:5) * BoxGap  # NOTE: Box.TopCorners[1] is the lowest. So reverse
  Box.TopCorners <- rev(Box.TopCorners)                 # NOW: Box.TopCorners[1] is the *top* box, which is Step 1
  Box.BottomCorners <- Box.TopCorners - BoxHeight
  
  # Now adjust if one of the boxes is two lines of text high
  if ( Flag > 0 ) {# If a box is flagged...
    if (  !is.na(Text) ) {   # *AND(* there is text to put there....
      if ( Flag == 6 ){ 
        Box.TopCorners[ 6 ] <- Box.TopCorners[ 6]
      } else {
        Box.TopCorners[ (Flag + 1):6] <- Box.TopCorners[ (Flag + 1):6] - BoxHeight
      }
      Box.BottomCorners[ Flag:6] <- Box.BottomCorners[ Flag:6 ] - BoxHeight
    }
  }
  
  
  DrawBox <- function(Box.TCorner, 
                      Box.BCorner, 
                      BoxW = BoxWidth, 
                      which.box, 
                      flag = FALSE, 
                      Locations = Locations){
    
    polygon( c(-BoxW/2, BoxW/2, BoxW/2, -BoxW/2),
             c(Box.TCorner, Box.TCorner, Box.BCorner, Box.BCorner),
             col = col.Default, # All boxes same colour
             lwd = 4, # Thick borders
             border = ifelse(flag, col.Flag, NA) ) # Thick, dark borders on flagged boxes
  }
  
  DrawLine <- function(Top, Bottom){
    
    arrows(0, Top,
           0, Bottom,
           length = 0.15,
           lwd = 2,
           angle = 15)  
  }
  
  for (i in (1:6)){
    if (Arrows) if (i > 1 ) DrawLine( Box.BottomCorners[i - 1], Box.TopCorners[i])
    
    if ( i == Flag){
      DrawBox(Box.TopCorners[i], Box.BottomCorners[i], BoxWidth, 1, TRUE)
    } else{
      DrawBox(Box.TopCorners[i], Box.BottomCorners[i], BoxWidth, 1, FALSE)
    }
  }
  
  # Add main text (the names of each step) into boxes
  Text.StepsLocation <- Box.TopCorners - BoxGap/2 
  for (i in (1:length(Labels))){
    Text.StepsLocation.Thisone <- Text.StepsLocation[i]
    text.col <- grey(0.3)
    if (i == Flag ) text.col <- "black"
    text.string <- paste("text(0, Text.StepsLocation.Thisone, ", Labels[i], ", col=text.col)")
   # cat(text.string,"  |. <<<\n")
    eval( parse(text = text.string))
    #    text(0, Loc, rev(Labels)[i])
  }
  
  # Add the additional text
  Text.AddedTextLocation <- Box.TopCorners[Flag] - BoxHeight * 1.33
  text(0, Text.AddedTextLocation, Text)
  
}

#SixSteps(4)