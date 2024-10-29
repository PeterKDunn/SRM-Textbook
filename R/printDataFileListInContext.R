###
###  Automate where data() files are, and hence where data is used
###



### DO NOT SEARCH FOR THEM in answers chapter!!!

### Col 1 is the data file name.
### Col 2 is the library it comes from




### SET UP 

# splitFiles <- c(20, 
#                 45, # End of page 1
#                 80, 
#                 124,# End of page 2
#                 143, 
#                 1540)
splitFiles <- c(20, 
                46, # End of page 1
                76, 
                108,# End of page 2
                143, 
                1540)
# Where to split the data file, for page 1, to create two columns. 
# So if e.g., split = 20, we will have 20 files listed, then move to col 2, then another 20 files listed.
#
# them move on to a new column environment
# 
# OR: give HOW MANY are in each col






######################################################
findDataFileMentions <- function(){
  
  ### TWO SITUAIONS:
  ### 1. Explicit data() calls in chapters.
  ### 2. Pointers to use specific data files, as mentioned in the exercises
  
  
  ### FIRST: Explicit calls to data() in Chapters
  # Find which chapters contain data()  calls
  
  dataFilesPerChapter <- system2("grep", 
                                 args = " 'data(' *.Rmd", 
                                 stdout = TRUE)
  
  ### 2. Pointers to use specific data files, as mentioned in the exercises
  # Find Exercises that point to a data set; e.g.: [*Dataset*: `NHANES`]. 
  
  dataFilesPerChapterExercises <- system2("grep", 
                                          args = " '\\*Dataset\\*' *.Rmd",
                                          stdout = TRUE)
  
  ### Consolidate
  dataFiles <- sort(c(dataFilesPerChapter, dataFilesPerChapterExercises))
  
  ### Now remove all mentioned of datafiles in the Answers:
  dataFilesInAnswersChapter <- grepl("App-Answers", dataFiles)
  dataFiles <- dataFiles[ !dataFilesInAnswersChapter ]

  return(dataFiles)
}



######################################################
cleanDataFileCalls  <- function(dataFiles){
  
  ###
  # Remove comments, trailing text, etc
  # Deal with things typically used to call data files
  
  # 1. Remove commented-out data calls
  
  # Determine if the string  <!--  appears
  numDataCalls <- length(dataFiles)
  commentedOut <- array( FALSE, 
                         dim = numDataCalls)
  
  # DO NOT remove  ### Exercise  however!
  
  for (i in 1:numDataCalls){

    removeAfterComments <- grepl("#", 
                                 dataFiles[i])

    keepInThisCase <- grepl('### Exercise',
                            dataFiles[i])

    if (removeAfterComments & !keepInThisCase){
      dataFiles[i] <- strsplit(dataFiles[i], "#")[[1]][1] 
    }
  }

  
  for (i in 1:numDataCalls){ # For each line in the data-call files...
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
  
  
  ###
  # Remove comments that may be present after the data call; eg:
  #      data(FRED) # trust this data file exists?
  
  # Remove the lines commented out
  dataFiles <- dataFiles[ !commentedOut ]
  
  return(dataFiles)
  
}



######################################################
classifyDataMentionsTypes <- function(dataFiles){
  
  # Find whether mentioned in the chapter, or in an exercise
  # NOT sure I HAVE THIS CORRRECT!!!
  
  # Extract Chapter numbers
  # Get first two characters from each entry. These are the chapter numbers
  chapNumbersList <- sapply( dataFiles,  
                             function(x) substr(x, 1, 2),
                             USE.NAMES = FALSE) # Remove files names, used as names
  
  
  # Now extract the data files names
  numDataCalls <- length(dataFiles)
  
  fileUsed <- fileUsedRaw <- array( dim = numDataCalls)
  # fileUsedRaw has *just* the data file name.
  # fileUsed also has the indications of whether an exercise, or built-in R dataset  
  
  
  for (i in 1:numDataCalls){
    
    # First remove chapter info
    dataCall <- strsplit(dataFiles[i], "Rmd:")[[1]][2] 
    # So now just things like:
    #   data(fred) 
    # or 
    #  [*Dataset*:`fred`]
    
    
    # We can have two different things, depending if call in the chapter, or if listed in exercise
    # Now if the first character is  [  then it is in an exercise; otherwise, an actual data call
    
    # BUT! An exercise may begin with [*Dataset*: Dataset] but then later also (probably) has the  data(Dataset).
    # This means the dataset is listed twice, as the first is flagged as a dataset mention explicitly, but the second is not...
    # They are actually both for the same exercise. But there will be two entries: 
    #    Dataset (Exercise)
    #    Dataset
    # when really I just want the first.
    #
    # How do I deal with this...?
    # Maybe in the source, I can use data(Dataset)###Exercise (spaces were removed above)
    # which is very manual... but easier than anything else I can think of.
    
    # Then: one approach is to look for the string  ### Exercise  and replace this with 
    
    # Maybe also: If we have a  data(Dataset)###Exercise  call, but no associated [*Dataset*: `Dataset`]  we can flag and/or suggest adding it
    
    if (grepl('###Exercise', dataCall)) { # If we see the string  ###Exercise...

      dFileStem <- unlist( strsplit( dataCall, 
                                     "###")) # Split where ### is found: Returns somethiungs like  data(fred); we just want the  fred, so split again
      dFileStem <- unlist( strsplit( dFileStem, 
                                     "\\("))[2] # Split where  (  is found. This returns  fred).
      dFileStem <- substr( dFileStem, 
                           start = 1,
                           stop = nchar(dFileStem) - 1 )
      
      # So now rename it to look like an exercise
      dataCall <- paste0("[*Dataset*:`",
                         dFileStem[1],
                         "`]")

    }

    
    # Now, onto the real action after dealing with that
    if ( substr( dataCall, 1, 1) == "[") { # Then probably an exercises (OR SOME EXAMPLES???)
      
      lengthDataCall <- nchar(dataCall)
      fileUsed[i] <- substr(dataCall,
                            start = 12,
                            stop = lengthDataCall - 1)
      fileUsedRaw[i] <- fileUsed[i]
      
      # Append note that data file used in an exercise
      fileUsed[i] <- paste(fileUsed[i], " (Exercise)")
      
    } else { # Then probably just a call in passing, e.. in an example
      
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
                           "(in **NHANES** package)" )
    }
    
    
    
    # Now, sometimes two brackets may occur: NHANES (Exercise) (package NHANES); replace with semicolon
    # To find, and fix
    fileUsed[i] <- gsub("\\) \\(", 
                        "; ",
                        fileUsed[i])
  }
  
  # Return TWO things: List of chapter numbers and the names (both outputs same length)
  return( list(chapNumbers = chapNumbersList, 
               fileNames = fileUsed))
}



### REMOVE THE `  ` 



######################################################
sortDataFilesByChapter <- function(dataFiles, chapterNumbers){
  # Create a  list()  with an entry for each chapter, giving a vector of data file names 
  
  # Group data files by chapter, in a list
  listDataFilesByChapter <- lapply(unique(chapterNumbers), 
                                   function(chap) {
                                     unique(dataFiles[chapterNumbers == chap] ) # unique to remove repeats
                                   })
  names(listDataFilesByChapter) <- paste("Chapter ", 
                                         unique(chapterNumbers), sep = " ")
  
  # Alphabetical order
  listDataFilesByChapter <- lapply(listDataFilesByChapter, sort)
  #cat("--------------------------------------------------------------------- RESULT\n")
  #print(listDataFilesByChapter)
  
  
  return(listDataFilesByChapter)
}





######################################################
addHyperLinks <- function(fileNames){
  
  # fileNames is a *list*, with entries like "fileNames$Chap07" containing all the data fies for that chapter.
  
  # If html format, add a link to the file in the Data directory
  for (i in (1:length(fileNames))){ # For each data file listed
    
    backTickLocation <- unlist(gregexpr('`', fileNames[i]))
    bt2 <- backTickLocation[2]
    
    # Locate first back tick: Add  [  before
    fileUsed[i] <- paste0("[", fileNames[i])
    
    # Locate second back tick: Insert  ](Data/file.csv)
    fileUsed[i] <- paste0(substr(fileNames[i], 
                                 start = 1,
                                 stop = (bt2 + 1)), # Plus 1 as we have already added leading
                          "](Data/",
                          substr(fileNames[i],
                                 start = 3,
                                 stop = bt2), 
                          ".csv)",
                          substr(fileNames[i],
                                 start = bt2 + 2,
                                 stop = nchar(fileNames[i])) )
    
  }
  
  return(fileNames)
  
}


######################################################
writeDataFileList <- function(fileNames, 
                              splitFiles, # Where to break columns
                              addLinks = FALSE){ # In HTML only, add links 
  
  # Prep: define useful bits
  numberOfDataFiles <- sum(unlist(lapply(fileNames, length)))
  
  splitLineNumbers <- c(1,
                        splitFiles,
                        numberOfDataFiles)
  lengthSplitLineNumbers <- length(splitLineNumbers)
  
  startLeftColumns <- splitLineNumbers[ seq(1, lengthSplitLineNumbers, by = 2)]
  startRightColumns <- splitLineNumbers[ 1 + seq(1, lengthSplitLineNumbers, by = 2)]
  
  endLeftColumns <- startRightColumns - 1
  endRightColumns <- c(startLeftColumns - 1, 
                       numberOfDataFiles)
  startRightColumns <- startRightColumns[1 : (length(startRightColumns) - 1)]
  
  startPage <- startLeftColumns 
  endPage <- endRightColumns
  
  numberOfPages <- length(splitFiles) / 2
  numberOfChapters <- length(fileNames)
  
  numberFilesPerChapter <- unlist(lapply(fileNames, 
                                         length))
  startChapter <- cumsum( c(1, numberFilesPerChapter) )
  startChapter <- startChapter[1 : (length(startChapter) - 1 )]
  names(startChapter) <- names(numberFilesPerChapter)

  # Get chapter numbers for each data file
  chapterNumbers <- names(unlist(lapply(fileNames, 
                                        length)))
  #cat("chapterNumbers =", chapterNumbers, "\n")
  chapterNumbersForEachDataFile <- rep(chapterNumbers, 
                                       unlist(lapply(fileNames, length)))
  #cat("A: chapterNumbersForEachDataFile = ", chapterNumbersForEachDataFile, "\n")
  #chapterNumbersForEachDataFile <- substr(chapterNumbersForEachDataFile,
  #                                        start = 5,
  #                                        stop = 6)
  #cat("B: chapterNumbersForEachDataFile = ", chapterNumbersForEachDataFile, "\n")

  # Remove leading zeros
  leadingZeros <- substr(chapterNumbersForEachDataFile, 1, 1) == "0"
  for (i in 1:length(leadingZeros)){
    if (leadingZeros[i]){
       substr(chapterNumbersForEachDataFile[i],
              start = 1,
              stop = 1) <- " " # Replace with a space
    }
  }
  
#  cat("Number of data files", numberOfDataFiles, "\n")
  for (i in 1:numberOfDataFiles){

    # Only need the two columns for LaTeX; it looks silly in HTML
    if ( !addLinks ) {
      if ( i %in% startPage){
        # START PAGE with column set-up info for the whole PAGE
        cat(':::::: {.cols data-latex=\"[T]\"}\n')
        cat("::: {.col data-latex=\"{0.48\\textwidth}\"}\n")
      }
    }    

    if (i %in% startChapter){
      cat("\n\\medskip\\goodbreak\n**",
          sub("^0+", "", chapterNumbersForEachDataFile[i]), # Remove any leading zeros
          "**\n\n",
          sep = "")
    }
    
    # PRINT DATA FILE INFO
    # ADD HYPERLINKS if requested (i.e., HTML)
    if (addLinks) { 
      fileNameWithLinks <- unlist(fileNames)[i]

      # Add hyperlink to data: `file` (Exercise) ->  [`file`](Data/file.csv) (Exercise)
      backTickLocation <- unlist(gregexpr('`', 
                                          fileNameWithLinks))
      bt2 <- backTickLocation[2]
      
      # Locate first back tick: Add  [  before
      fileNameWithLinks <- paste0("[", fileNameWithLinks)
      
      # Locate second back tick: Insert  ](Data/file.csv)
      fileNameWithLinks <- paste0(substr(fileNameWithLinks,
                                         start = 1,
                                         stop = (bt2 + 1)), # Plus 1 as we have already added leading
                                  "](Data/",
                                  substr(fileNameWithLinks,
                                         start = 3,
                                         stop = bt2), 
                                  ".csv)",
                                  substr(fileNameWithLinks,
                                         start = bt2 + 2,
                                         stop = nchar(fileNameWithLinks)) )
      # Print 
      cat( "* ",
           fileNameWithLinks,
           "\n") 
      
    } else {
      # Just print 
      cat( "* ",
           unlist(fileNames)[i],
           "\n") 
    }
    
    # Only need the two columns for LaTeX; it looks silly in HTML
    if ( !addLinks ) {
      if ( i %in% startRightColumns){
        cat('::: \n')
        cat('::: {.col data-latex=\"{0.03\\textwidth}\"} \n')
        cat('\\ \n') 
        ## <!-- an empty Div (with a white space), serving as
        ## a column separator -->
        cat(':::\n')
        cat('::: {.col data-latex=\"{0.48\\textwidth}\"}\n')
      }
    }
    
    # Only need the two columns for LateX; it looks silly in HTML
    if ( !addLinks ) {
      if (i %in% endRightColumns ){ 
        cat(':::\n')
        cat('::::::\n')
      }
    }
    

  }
}

######################################################
### DO THE EXTRACTION ###
dFiles <- findDataFileMentions() # A list text of the *lines* that contains mentions of data files
dFiles1 <- cleanDataFileCalls(dFiles) # Remove trailing text and comments
out <- classifyDataMentionsTypes(dFiles1) # Find whether mentioned in the chapter, or in an exercise
chapNum <- out$chapNumbers
dFiles2 <- out$fileNames
dFiles3 <- sortDataFilesByChapter(dFiles2, chapNum) # Create a  list()  with an entry for each chapter, giving a vector of data file names 

writeDataFileList(dFiles3, # WRITE
                  splitFiles, 
                  addLinks = is_html_output() )
######################################################

