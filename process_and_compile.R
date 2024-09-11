# process_and_compile.R

# Set the working directory to the location where _main.tex is located
message( "* Current directory:", getwd() )

# 
system("cp -R _book/_main.tex .")

### All the image files seems to be in (e.g.)  _bookdown_files/01-Introduction_files
### So move them (and delete later)
message("* Copying image files")
system("cp -R _bookdown_files/01-Introduction_files .")
system("cp -R _bookdown_files/02-RQs_files .")
system("cp -R _bookdown_files/03-ResearchDesign-Overview_files .")
system("cp -R _bookdown_files/04-ResearchDesign-TypesOfDesigns_files .")
system("cp -R _bookdown_files/05-ResearchDesign-Ethics_files .")
system("cp -R _bookdown_files/06-ResearchDesign-Sampling_files .")
system("cp -R _bookdown_files/07-ResearchDesign-Internal_files .")
system("cp -R _bookdown_files/08-ResearchDesign-Limitations_files .")
system("cp -R _bookdown_files/09-Collect_files .")
system("cp -R _bookdown_files/10-DescribingVariables_files .")
system("cp -R _bookdown_files/11-SummaryQuant_files .")
system("cp -R _bookdown_files/12-SummaryQual_files .")
system("cp -R _bookdown_files/13-CompareQual_files .")
system("cp -R _bookdown_files/14-CompareWithin_files .")
system("cp -R _bookdown_files/15-CompareQuant_files .")
system("cp -R _bookdown_files/16-Connections-Two-Quant_files .")
system("cp -R _bookdown_files/17-SummaryComments_files .")
system("cp -R _bookdown_files/18-Tools-Probability_files .")
system("cp -R _bookdown_files/19-Tools-DecisionMaking_files .")
system("cp -R _bookdown_files/20-Tools-SamplingVariation_files .")
system("cp -R _bookdown_files/21-Tools-DistributionsAndModels_files .")
system("cp -R _bookdown_files/22-Inference-Intro_files .")
system("cp -R _bookdown_files/23-CIs-OneProportion_files .")
system("cp -R _bookdown_files/24-CIs-OneMean_files .")
system("cp -R _bookdown_files/25-CIs-More_files .")
system("cp -R _bookdown_files/26-CIs-MeanDifference_files .")
system("cp -R _bookdown_files/27-CIs-TwoMeans_files .")
system("cp -R _bookdown_files/28-CIs-OddsRatios_files .")
system("cp -R _bookdown_files/29-Sample-Size-Estimation_files .")
system("cp -R _bookdown_files/30-Testing-OneProportion_files .")
system("cp -R _bookdown_files/31-Testing-OneMean_files .")
system("cp -R _bookdown_files/32-Testing-More_files .")
system("cp -R _bookdown_files/33-Testing-MeanDifference_files .")
system("cp -R _bookdown_files/34-Testing-TwoMeans_files .")
system("cp -R _bookdown_files/35-Testing-OddsRatios_files .")
system("cp -R _bookdown_files/37-Correlation_files .")
system("cp -R _bookdown_files/38-Regression_files .")
system("cp -R _bookdown_files/39-Write_files .")
system("cp -R _bookdown_files/40-Read_files .")
system("cp -R _bookdown_files/51-App-Tables_files .")
system("cp -R _bookdown_files/53-App-Answers_files .")
system("cp -R _bookdown_files/56-App-Glossary_files .")
message("* Copying image files: DONE")


library(stringr)

# Function to modify the _main.tex file
modify_tex_file <- function(tex_file) {
  message("- USING MODEIFY FILE:")
  if (file.exists(tex_file)) {
    # Read the content of the .tex file
    tex_lines <- readLines(tex_file)

    # Replace all instances of "RQ. " with "RQ.\@ "
    #    tex_lines <- gsub("RQ  ", "XXXXXXXXXX ", tex_lines)
    tex_lines <- stringr::str_replace(string = readLines("_main.tex"), 
                                      pattern = "RQ\\.", 
                                      replacement = "RQ\\.\\\\@")
    tex_lines <- stringr::str_replace(string = tex_lines, 
                                      pattern = "AIS\\.", 
                                      replacement = "AIS\\.\\\\@")
    tex_lines <- stringr::str_replace(string = tex_lines, 
                                      pattern = "USA\\.", 
                                      replacement = "USA\\.\\\\@")
    tex_lines <- stringr::str_replace(string = tex_lines, 
                                      pattern = "C\\.", 
                                      replacement = "C\\.\\\\@")
    tex_lines <- stringr::str_replace(string = tex_lines, 
                                      pattern = "F and M\\.", 
                                      replacement = "F and M\\.\\\\@")
    tex_lines <- stringr::str_replace(string = tex_lines, 
                                      pattern = "NA\\.", 
                                      replacement = "NA\\.\\\\@")
    
    tex_lines <- stringr::str_replace(string = tex_lines, 
                                      pattern = "et al\\.", 
                                      replacement = "et\\ al\\.\\\\@")

    # Write the modified content back to the .tex file
    writeLines(tex_lines, tex_file )
    writeLines(tex_lines, paste0(tex_file, "HIDEME") )
    
    message("* Modified the .tex file: ", tex_file)
  } else {
    message("* The .tex file does not exist: ", tex_file)
  }
}

# Path to the _main.tex file
tex_file <- "_main.tex"  # Update if necessary

# Modify the .tex file
modify_tex_file(tex_file)

# Compile the modified .tex file to PDF using xelatex
message("* Compiling")
system("cp _main.tex _book/_main.tex")
system(paste("xelatex", shQuote(tex_file)))
system(paste("xelatex", shQuote(tex_file)))  # Run xelatex twice for proper referencing

# Move to _book
system("mv _main.pdf _book/_main.pdf")

### REMOVE THE COPIED FILES
message("* Deleting image files")
system("rm -R ./01-Introduction_files")
system("rm -R ./02-RQs_files")
system("rm -R ./03-ResearchDesign-Overview_files")
system("rm -R ./04-ResearchDesign-TypesOfDesigns_files")
system("rm -R ./05-ResearchDesign-Ethics_files")
system("rm -R ./06-ResearchDesign-Sampling_files")
system("rm -R ./07-ResearchDesign-Internal_files")
system("rm -R ./08-ResearchDesign-Limitations_files")
system("rm -R ./09-Collect_files")
system("rm -R ./10-DescribingVariables_files")
system("rm -R ./11-SummaryQuant_files")
system("rm -R ./12-SummaryQual_files")
system("rm -R ./13-CompareQual_files")
system("rm -R ./14-CompareWithin_files")
system("rm -R ./15-CompareQuant_files")
system("rm -R ./16-Connections-Two-Quant_files")
system("rm -R ./17-SummaryComments_files")
system("rm -R ./18-Tools-Probability_files")
system("rm -R ./19-Tools-DecisionMaking_files")
system("rm -R ./20-Tools-SamplingVariation_files")
system("rm -R ./21-Tools-DistributionsAndModels_files")
system("rm -R ./22-Inference-Intro_files")
system("rm -R ./23-CIs-OneProportion_files")
system("rm -R ./24-CIs-OneMean_files")
system("rm -R ./25-CIs-More_files")
system("rm -R ./26-CIs-MeanDifference_files")
system("rm -R ./27-CIs-TwoMeans_files")
system("rm -R ./28-CIs-OddsRatios_files")
system("rm -R ./29-Sample-Size-Estimation_files")
system("rm -R ./30-Testing-OneProportion_files")
system("rm -R ./31-Testing-OneMean_files")
system("rm -R ./32-Testing-More_files")
system("rm -R ./33-Testing-MeanDifference_files")
system("rm -R ./34-Testing-TwoMeans_files")
system("rm -R ./35-Testing-OddsRatios_files")
system("rm -R ./37-Correlation_files")
system("rm -R ./38-Regression_files")
system("rm -R ./39-Write_files")
system("rm -R ./40-Read_files")
system("rm -R ./51-App-Tables_files")
system("rm -R ./53-App-Answers_files")
system("rm -R ./56-App-Glossary_files")
message("* Deleting image files: DONE")
