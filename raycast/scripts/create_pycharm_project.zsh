#!/bin/zsh
# Script to clone a GitHub template and open a new PyCharm project

# Set your GitHub repository template URL
template_url="https://github.com/JonsPhy/Template.git"

# Prompt for project name
read -r "Enter new project name: " project_name

# Clone the repository and open in PyCharm
git clone "$template_url" ~/Documents/Projects/"$project_name"
open -a "PyCharm" ~/Documents/Projects/"$project_name"
