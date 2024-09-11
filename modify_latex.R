library(knitr)

# Read the LaTeX file
tex_file <- readLines("./_main.tex")

# Modify the LaTeX code (e.g., add a custom header)
latex_code <- gsub("RQ ", "XXXX ", tex_file)

# Write modified LaTeX code to a new file
writeLines(tex_file, "./_main_modified.tex")

# Check if the file was created
if (file.exists(file.path(current_dir, "_main_modified.tex"))) {
  print("Modified file created successfully.")
} else {
  print("Error creating modified file.")
}
