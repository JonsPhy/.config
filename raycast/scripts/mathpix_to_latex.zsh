#!/bin/zsh
# Mathpix LaTeX conversion script

# Use Mathpix Snip to convert clipboard content to LaTeX
mathpix_snip --mode=latex

# Capture the LaTeX output from clipboard
latex_output=$(pbpaste)

# Save the LaTeX output to a file
echo "$latex_output" >> ~/Documents/latex_output.tex

# Optionally, open the file in PyCharm
open -a "PyCharm" ~/Documents/latex_output.tex

