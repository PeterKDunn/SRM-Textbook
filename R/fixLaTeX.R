# Fix some things in the LaTeX files:

# Read the current file name from the file where this is stored (see  R/setup.R)

# Read the latest file from 
recentFile <- readLines("current_file_name.txt")
cat("File read:", recentFile, "\n")
### THE FIXES
#
# There seems to be no cases left of these:
#
# - Replace "etc. " with "etc.\@ "
# - Replace "e.g. " with "e.g.\@ "
# - Replace "etc. " with "i.e.\@ "
# - Replace ... in some places (?) 


# GREP to find capital letters followed by period, so that (e.g.), we should have  "IV.\@ "  at the end of a sentence
# grep '[A-Z].' _main.tex
#
# Examples I found from the output of the above  grep  which were not things like "P. K. Dunn" (and I very easily may have missed some):
# 
# - RQ.
# - AIS.
# - USA.
# - C. (i.e., degrees-C)
# - F and M. (once)
# - NA. (once)
#
# There is also this:
# - Replace "et al." with "et\ al.\@ "

out <- gsub(pattern = 'RQ.',
            replacement = 'POOPRQ\\\\\\@. ',
            x = readLines(recentFile),
            fixed = TRUE,
            ignore.case = FALSE)
gsub(pattern = 'AIS.',
     replacement = 'AIS\\@. ',
     x = out,
     ignore.case = TRUE)
gsub(pattern = 'USA.',
     replacement = 'USA\\@. ',
     x = out,
     ignore.case = TRUE)
gsub(pattern = 'C.',
     replacement = 'C\\@. ',
     x = out,
     ignore.case = TRUE)
gsub(pattern = 'F and M.',
     replacement = 'F and M\\@.',
     x = out,
     ignore.case = TRUE)
gsub(pattern = 'NA.',
     replacement = 'NA\\@.',
     x = out,
     ignore.case = TRUE)




gsub(pattern = 'needs to be',
     replacement = 'FORESTFIRES',
     x = out,
     ignore.case = TRUE)




# sed -i '' 's/et al. /et\\ al.\\@ /g' _main.tex
gsub(pattern = 'et al. ',
     replacement = 'et\\ al.\\@',
     x = out,
     ignore.case = TRUE)

write(out,
       file = recentFile)

### THEN spell check:
#textidote --output html _main.tex > mainSpell.html


### THEH RE-RUN LATEX on the tex file. Somewhow. 
### Run from the R console:
#setwd("_book")
#tinytex::pdflatex(file="_book/_main.tex")
#
#bookdown::render_book("index.Rmd", "bookdown::pdf_book")
