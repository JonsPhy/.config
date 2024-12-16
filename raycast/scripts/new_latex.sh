#!/bin/zsh

# Festes Template-Repository
TEMPLATE_REPO_URL="https://github.com/JonsPhy/Template"

# Überprüfen, ob ein Projektname übergeben wurde
if [ "$#" -lt 1 ]; then
    echo "Usage: ./clone_project.sh <New-Project-Name>"
    exit 1
fi

# Projektname (Variable)
NEW_PROJECT_NAME=$1

# Aktuelles Verzeichnis abrufen
CURRENT_DIR=$(pwd)

# Projekt klonen ins aktuelle Verzeichnis
echo "Cloning template repository into $CURRENT_DIR/$NEW_PROJECT_NAME..."
git clone $TEMPLATE_REPO_URL "$CURRENT_DIR/$NEW_PROJECT_NAME"

# Wechsel in das neue Projektverzeichnis
cd "$CURRENT_DIR/$NEW_PROJECT_NAME" || exit

# Git-Historie entfernen
echo "Removing Git history from template..."
rm -rf .git

# Neues Git-Repository initialisieren
echo "Initializing new Git repository..."
git init

# Initial commit erstellen
echo "Creating initial commit..."
git add .
git commit -m "Initial commit based on template"

echo "Project $NEW_PROJECT_NAME has been created in $CURRENT_DIR!"

