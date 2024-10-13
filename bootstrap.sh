#!/bin/bash

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install essential applications
echo "Installing essential applications..."
brew install --cask pycharm-ce
brew install --cask raycast
brew install --cask notion
brew install --cask arc
brew install --cask karabiner-elements
brew install --cask warp




defaults write com.apple.finder FXPreferredViewStyle -string "icnv"
defaults write com.apple.finder DesktopViewSettings -dict-add IconViewSettings '{iconSize = 64; gridSpacing = 54; showIconPreview = 1;}'

# Set List view settings
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder StandardViewSettings -dict-add ListViewSettings '{iconSize = 16; useRelativeDates = 1;}'

# Set sidebar width
defaults write com.apple.finder SidebarWidth -int 159

# Set the default new window target (e.g., iCloud Drive)
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Library/Mobile Documents/com~apple~CloudDocs/"

# Arrange files by name in Finder
defaults write com.apple.finder FXArrangeGroupViewBy -string "Name"

# Restart Finder to apply changes
killall Finder
