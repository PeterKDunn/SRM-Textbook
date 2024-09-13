# Makefile

# Target: Compile the book with Bookdown and then process the LaTeX file
all: book pdf

# Generate book and _main.tex file
book:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book")'
	cp _book/_main.tex ../_main.tex
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book")'

# Process the LaTeX file and compile to PDF
pdf:
	Rscript process_and_compile.R
