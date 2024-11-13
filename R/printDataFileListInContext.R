###
###  Automate where data() files are, and hence where data is used
###



### DO NOT SEARCH FOR THEM in answers chapter!!!

### Col 1 is the data file name.
### Col 2 is the library it comes from

### SET UP 







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
classifyDataMentionsTypes <- function(dataFiles, 
                                      inLaTeX){
  
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
    
    # Maybe also: If we have a  data(Dataset) ### Exercise  call, but no associated [*Dataset*: `Dataset`]  we can flag and/or suggest adding it
    
    if (grepl('###Exercise', dataCall)) { # If we see the string  ###Exercise...
      
      dFileStem <- unlist( strsplit( dataCall, 
                                     "###")) # Split where ### is found: Returns something   like  data(fred); we just want the  fred, so split again
      dFileStem <- unlist( strsplit( dFileStem, 
                                     "\\("))[2] # Split where  (  is found. This returns  fred).
      dFileStem <- substr( dFileStem, 
                           start = 1,
                           stop = nchar(dFileStem) - 1 )
      
      # So now rename it to look like an exercise in what follows
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
      if (inLaTeX) {
        fileUsed[i] <- paste(fileUsed[i],
                             "(in \textbf{R})" )        
      } else {
        fileUsed[i] <- paste(fileUsed[i],
                             "(in **R**)" )
      }
    }
    if (substr(fileUsed[i], 2, 6) == "NHANE") { # NHANES data set
      if (inLaTeX) {
        fileUsed[i] <- paste(fileUsed[i],
                             "(in \\textbf{NHANES} package)" )
      } else {
        fileUsed[i] <- paste(fileUsed[i],
                             "(in **NHANES** package)" )
      }
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
  
  # Now also sort, to have Exercise *after* the in-chapter exercises
  numberChapters <- length( listDataFilesByChapter) # The length of the list listDataFilesByChapter
  for (i in 1:numberChapters){ # For each chapter:
    #cat("----\n CHAPTER", i, "\n")
    thisChaptersList <- listDataFilesByChapter[[i]]
    #cat("* The file", thisChaptersList, "\n")

    sortByExercise <- grepl("\\(Exercise", 
                            thisChaptersList) # Find which elements have "(Exercise" in them)
    out <- sort( sortByExercise,
                 index.return = TRUE)$ix
    listDataFilesByChapter[[i]] <- listDataFilesByChapter[[i]][ out ]
    
  # Each list element of  listDataFilesByChapter  now organised by non-Exercise data sets first, 
  # then all the exercise data set
  # So we separate the two (Exercise; non-Exercise) and sort separately, then rejoin

    thisChaptersList <- listDataFilesByChapter[[i]]
    #cat("+ The file", thisChaptersList, "\n")
    isExercise <- grepl("Exercise", 
                        thisChaptersList)
    if ( sum(isExercise) > 0 ){
      ExerciseOnly <- order( thisChaptersList[ isExercise ])
    } else {
      ExerciseOnly <- NULL
    }
    if ( sum(!isExercise) > 0 ){
      NonExerciseOnly <- order( thisChaptersList[ !isExercise ])
    } else {
      NonExerciseOnly <- NULL
    }
    # Recombine, in order
    #cat("\n@ The file", listDataFilesByChapter[[i]] , "\n")
    #cat(c( NonExerciseOnly, 
    #       length(NonExerciseOnly) + ExerciseOnly) )
    listDataFilesByChapter[[i]] <- listDataFilesByChapter[[i]][c( NonExerciseOnly, 
                                                                  length(NonExerciseOnly) + ExerciseOnly) ]
    #cat("\n- The file", listDataFilesByChapter[[i]] , "\n")
  }
  
   return(listDataFilesByChapter)
}





######################################################
prepareFileName <- function(fileName, inLaTeX){
  
  # fileNames is a single file name, with entries like "`NMiner` (Exercise)" (note the back-ticks!)
  # Only the fiule bame shoud be in tt font, not the stuff after it!

  backTickLocation <- unlist(gregexpr('`', 
                                      fileName))
  bt1 <- backTickLocation[1]
  bt2 <- backTickLocation[2]
  
  if (inLaTeX) {
    fileNameTmp <- fileName
    # Locate back-ticks

    fileNameTmp <- paste0("\\texttt{", 
                          substr(fileNameTmp, 
                                 start = bt1 + 1,
                                 stop = bt2 - 1),
                          "}")
  # Now add anything that followed the last back tick
    fileName <- paste0( fileNameTmp,
                        substr(fileName,
                               start = bt2 + 1,
                               stop = nchar(fileName))
    )
  } else {
    
    # Locate first back tick: Add  [  before
    fileUsed[i] <- paste0("[", fileName)
    
    # Locate second back tick: Insert  ](Data/file.csv)
    fileUsed[i] <- paste0(substr(fileName, 
                                 start = 1,
                                 stop = (bt2 + 1)), # Plus 1 as we have already added leading
                          "](Data/",
                          substr(fileName,
                                 start = 3,
                                 stop = bt2), 
                          ".csv)",
                          substr(fileName,
                                 start = bt2 + 2,
                                 stop = nchar(fileName)) )
    
  }
  
  return(fileName)
  
}


######################################################
writeDataFileList <- function(fileNames, 
                              inLaTeX = FALSE,
                              addLinks = !inLaTeX){ # In HTML only, add links 
  
  # Prep: define useful bits
  numberOfDataFiles <- sum(unlist(lapply(fileNames, length)))
  
  numberOfChapters <- length(fileNames)
  
  numberFilesPerChapter <- unlist(lapply(fileNames, 
                                         length))
  startChapter <- cumsum( c(1, numberFilesPerChapter) )
  startChapter <- startChapter[1 : (length(startChapter) - 1 )]
  names(startChapter) <- names(numberFilesPerChapter)
  
  # Get chapter numbers for each data file
  chapterNumbers <- names(unlist(lapply(fileNames, 
                                        length)))
  chapterNumbersForEachDataFile <- rep(chapterNumbers, 
                                       unlist(lapply(fileNames, length)))

  # Start two-column mode in LaTeX only:
  # Only need the two columns for LaTeX; it looks silly in HTML
  if ( inLaTeX ) {
    # START PAGE with column set-up info for the whole PAGE
    cat("\\begin{multicols}{2}\\raggedcolumns\n")
  }    
  
  for (i in 1:length(numberFilesPerChapter) ) { # For each chapter:
    
    if ( i > 1 ){ # No need to close if we haven't had a minipage start yet
      # After all the files are listed, close the  minipage  in LaTeX before starting on the next chapter's list
      cat("\\end{itemize}",
          "\\end{minipage}\n",
          "\\medskip")
    }
    
    cat("\n\n\\begin{minipage}{\\textwidth}\n")
    
    # Start bold
    if( inLaTeX ){
      cat("\\textbf{")
    } else {
      cat("**")
    }
    # Print chapter number in this bolding environment, after removing any leading zeros on the chapter number
    cat( sub("^0+",  # Remove any leading zeros
             "", 
             chapterNumbers[i]) 
         )
    # End bold
    if (inLaTeX) {
      cat("}\n")
    } else {
      cat("**\n")
    }
    
    # Begin the itemize environment
    if (inLaTeX) cat("\\begin{itemize}\\tightlist\n")
    
    # PRINT DATA FILE INFO
    # ADD HYPERLINKS if requested (i.e., HTML)
    if ( i > 1 ) {
      startHere <- sum(numberFilesPerChapter[1 : (i- 1)] ) + 1 
      endHere <- sum(numberFilesPerChapter[1:i] )
    } else {
      startHere <- 1
      endHere <- numberFilesPerChapter[1]
    }

    isPreviousExercise <- TRUE
    isCurrentExercise <- FALSE
    # Now print each file name
    for (j in startHere : endHere) { # For each data file in the current chapter:

      # detect if it contains an "Exercise" or not
      isPreviousExercise <- isCurrentExercise
      isCurrentExercise <- grepl("Exercise",
                                 unlist(fileNames)[j])
      isStartOfExercises <- isCurrentExercise & (!isPreviousExercise)
      
      if (inLaTeX) {  
          # Just print 
          if (isStartOfExercises) cat("\n\\medskip\n") # Little space before exercises start
          
          cat( "\\item\n ",
               prepareFileName( unlist(fileNames)[j],
                                inLaTeX = TRUE),
               "\n") 
        } else { # HTML needs hyperlinks added, so complicated
          cat( "* \n",
               prepareFileName( unlist(fileNames)[j],
                                inLaTeS = FALSE),
               "\n") 
          
        #   
        #   
        # fileNameWithLinks <- unlist(fileNames)[i]
        # 
        # # Add hyperlink to data: `file` (Exercise) ->  [`file`](Data/file.csv) (Exercise)
        # backTickLocation <- unlist(gregexpr('`', 
        #                                     fileNameWithLinks))
        # bt2 <- backTickLocation[2]
        # 
        # # Locate first back tick: Add  [  before
        # fileNameWithLinks <- paste0("[", fileNameWithLinks)
        # 
        # # Locate second back tick: Insert  ](Data/file.csv)
        # fileNameWithLinks <- paste0(substr(fileNameWithLinks,
        #                                    start = 1,
        #                                    stop = (bt2 + 1)), # Plus 1 as we have already added leading
        #                             "](Data/",
        #                             substr(fileNameWithLinks,
        #                                    start = 3,
        #                                    stop = bt2), 
        #                             ".csv)",
        #                             substr(fileNameWithLinks,
        #                                    start = bt2 + 2,
        #                                    stop = nchar(fileNameWithLinks)) )
        # # Print 
        # cat( "* ",
        #      fileNameWithLinks,
        #      "\n") 
        
      } 
    }
  }
  # Close two-column mode in LaTeX only
  if ( inLaTeX ) {
    cat("\\end{itemize}\n",
        "\\end{minipage}\n",
        "\\end{multicols}\n")
  } 
  
}



######################################################
### DO THE EXTRACTION ###
dFiles <- findDataFileMentions() # A list text of the *lines* that contains mentions of data files
dFiles1 <- cleanDataFileCalls(dFiles) # Remove trailing text and comments
out <- classifyDataMentionsTypes(dFiles1,
                                 inLaTeX = TRUE ) # is_latex_output() # Find whether mentioned in the chapter, or in an exercise
chapNum <- out$chapNumbers
dFiles2 <- out$fileNames
dFiles3 <- sortDataFilesByChapter(dFiles2, 
                                  chapNum) # Create a  list()  with an entry for each chapter, giving a vector of data file names 

writeDataFileList(dFiles3, # WRITE
                  inLaTeX  = TRUE, #is_latex_output(),
                  addLinks = FALSE) # is_html_output() )
######################################################

