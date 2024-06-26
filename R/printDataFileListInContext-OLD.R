###
###  Automate where data() files are, and hence where data is used
###



### DO NOT SEARCH FOR THEM in answers chapter!!!

### Col 1 is the data file name.
### Col 2 is the library it comes from


splitFiles <- matrix( c(16, 38, # col 1 is the first col, col 2 is where to stop for second col, before moving to whole new environment
                        71, 102,
                        127, 159),
                      nrow = 3,
                      byrow = TRUE )
# Where to split the data file, for page 1, to create two columns. 
# So if e.g., split = 20, we will have 20 files listed, then move to col 2, then another 20 files listed.
#
# them move on to a new column environment
# 
# OR: give HOW MANY are in each col


### TWO SITUAIONS:
### 1. Explicit data() calls in chapters.
### 2. Pointers to use specific data files, as mentioned in the exercises


### FIRST: Explicit calls to data() in Chapters
# Find which chapters contain data()  calls
dataFilesPerChapter <- system2("grep", 
                               args = " 'data(' *.Rmd", 
                               stdout = TRUE)


# findDataFileMentions()
# sortDataMentionsByChapter()
# cleanDataFileCalls() # Remove comments, trailing text, etc
# sortDataFilesByChapter()
# addHyperLinks()
# printDataF

### 2. Pointers to use specific data files, as mentioned in the exercises
# Find Exercises that point to a data set; e.g.: [*Dataset*: `NHANES`]. 
dataFilesPerChapterExercises <- system2("grep", 
                                        args = " '\\*Dataset\\*' *.Rmd",
                                        stdout = TRUE)

dataFiles <- sort(c(dataFilesPerChapter, dataFilesPerChapterExercises))


### SORT BY TYPE (Data, then Exercises) *WITHIN* CHAPTERS


# Deal with things typically used to call data files
# Remove commented-out data calls
# Determine if the string  <!--  appears
numDataCalls <- length(dataFiles)
commentedOut <- array( FALSE, 
                       dim = numDataCalls)

for (i in 1:numDataCalls){
  # First, remove all blank space
  dataFiles[i] <- gsub(" ", 
                       "", 
                       dataFiles[i] )
  
  # Then, remove all quote marks, such as in data("Fred")
  dataFiles[i] <- gsub('"', 
                       "", 
                       dataFiles[i] )
  
  # Now find commented-out data() calls
  commentedOut[i]  <- grepl("<!-- data", 
                            dataFiles[i]) | 
    grepl("<!--data", 
          dataFiles[i]) | 
    grepl("<!--  data", 
          dataFiles[i])  
}


fred <- dataFiles

# Remove comments that may be present after the data call; eg:
#      data(FRED) # trust this data file exists?

for (i in 1:numDataCalls){
  removeAfterComments <- grepl("#", 
                               dataFiles[i])
  if (removeAfterComments){
    dataFiles[i] <- strsplit(dataFiles[i], "#")[[1]][1] 
  }
}

dataFiles <- dataFiles[ !commentedOut ]

mary <- dataFiles

# Find actual data used:
numDataCalls <- length(dataFiles)
fileUsed <- fileUsedRaw <- array( dim = numDataCalls)
# fileUsedRaw has *just* the data fie name.
# fileUsed also has the indications of whether an exercise, or built-in R dataset  


for (i in 1:numDataCalls){
  # We can have two different things, depending if call in the chapter, or if listed in exercise
  # So first remove chapter info
  dataCall <- strsplit(dataFiles[i], "Rmd:")[[1]][2]
  
  
  # Now if the first character is  [  then it is in an exercise; otherwise, an actual data call
  if ( substr( dataCall, 1, 1) == "[") {
    
    lengthDataCall <- nchar(dataCall)
    fileUsed[i] <- substr(dataCall,
                          start = 12,
                          stop = lengthDataCall - 1)
    fileUsedRaw[i] <- fileUsed[i]
    fileUsed[i] <- paste(fileUsed[i], " (Exercise)")
  } else {
    
    lengthDataCall <- nchar(dataCall)
    fileUsed[i] <- substr(dataCall,
                          start = 6,
                          stop = lengthDataCall - 1)
    fileUsed[i] <- paste0("`", fileUsed[i], "`")
    fileUsedRaw[i] <- fileUsed[i]
  }
  
  # Flag special cases
  if (substr(fileUsed[i], 2, 6) == "faith") { #faithful data set
    fileUsed[i] <- paste(fileUsed[i],
                         "(in **R**)" )
  }
  if (substr(fileUsed[i], 2, 6) == "NHANE") { #faithful data set
    fileUsed[i] <- paste(fileUsed[i],
                         "(*NHANES*)" )
  }
  
  
  
  # Now, sometimes two brackets may occur: NHANES (Exercise) (package NHANES); replace with semicolon
  # To find, and fix
  fileUsed[i] <- gsub("\\) \\(", 
                      "; ",
                      fileUsed[i])
}


# Get first two characters from each entry. These are the chapter numbers
chapNumbersList <- sapply( dataFiles,  
                           function(x) substr(x, 1, 2),
                           USE.NAMES = FALSE) # Remove files names, used as names

filesPerChapter <- table(chapNumbersList)
startNewChapter <- cumsum( c(1, filesPerChapter) )


### fileUsed should be the list of what we want to print
# Now order, with Exercises at end (and rest alpha?)
for (j in 1 : (length(filesPerChapter) ) ) { # For each chapter with data used
  
  startSort <- startNewChapter[j]
  stopSort <-  startNewChapter[j] - 1 
  
  if ( j == length(filesPerChapter)) stopSort <- as.numeric(chapNumbersList[ length(chapNumbersList)] )
  
  # Sort the files within chapter

  filesUsedThisChapter    <- fileUsed[startSort : stopSort]    <- sort(fileUsed[startSort : stopSort])
  filesUsedThisChapterRaw <- fileUsedRaw[startSort : stopSort] <- sort(fileUsedRaw[startSort : stopSort])
  
  # Remove duplicates WITHIN CHAPTERS
  filesUsedThisChapter <- filesUsedThisChapter[ !duplicated(filesUsedThisChapter) ]
  filesUsedThisChapterRaw <- filesUsedThisChapterRaw[ !duplicated(filesUsedThisChapterRaw) ]

  martha <- filesUsedThisChapter
  
  
}


# Now add link to data file if we are creating html
# If html format, add a link to the file in the Data directory
if (knitr::is_html_output()) { # Add hyperlink to data: `file` (Exercise) ->  [`file`](Data/file.csv) (Exercise)
  for (i in (1:length(fileUsed))){ # For each data file listed
    
    backTickLocation <- unlist(gregexpr('`', fileUsed[i]))
    bt2 <- backTickLocation[2]
    
    # Locate first back tick: Add  [  before
    fileUsed[i] <- paste0("[", fileUsed[i])
    
    # Locate second back tick: Insert  ](Data/file.csv)
    fileUsed[i] <- paste0(substr(fileUsed[i], 
                                 start = 1,
                                 stop = (bt2 + 1)), # Plus 1 as we have already added leading
                          "](Data/",
                          substr(fileUsed[i],
                                 start = 3,
                                 stop = bt2), 
                          ".csv)",
                          substr(fileUsed[i],
                                 start = bt2 + 2,
                                 stop = nchar(fileUsed[i])) )
    
  }
}









# Start with column set-up info
cat(':::::: {.cols data-latex=\"[T]\"}\n')
cat("::: {.col data-latex=\"{0.46\\textwidth}\"}\n")



for (i in 1:numDataCalls) {
  
  # Do not want to display those used in Answers Chapter  
  answersChapNumber <- 53
  if ( chapNumbersList[i] < 53){
    
    # Check if we need to start a new chapter:
    if (i %in% startNewChapter){
      cat("\n\\medskip\n**Chapter ",
          sub("^0+", "", chapNumbersList[i]), # Remove any leading zeros
          "**\n\n")
    }
    
    
    if (i %in% splitFiles[, 1]){
      
      cat('::: \n')
      cat('::: {.col data-latex=\"{0.06\\textwidth}\"} \n')
      cat('\\ \n') 
      ## <!-- an empty Div (with a white space), serving as
      ## a column separator -->
      cat(':::\n')
      cat('::: {.col data-latex=\"{0.46\\textwidth}\"}\n')
      
    }
    if (i %in% (splitFiles[, 2]) ) {
      
      # After two columns of length, close off the col environment
      # End with column set-up info
      cat(':::\n')
      cat('::::::\n')
      
      cat(':::::: {.cols data-latex=\"[T]\"}\n')
      cat("::: {.col data-latex=\"{0.46\\textwidth}\"}\n")
      
    }
    
    
    # Print the data files used in said chapter:
    
    # first, find where data file name actually starts:
    # Print the data file used in said chapter:
    cat( "* ",
         fileUsed[i],
         "\n") 
  }
  
}


# End with column set-up info
cat(':::\n')
cat('::::::\n')

