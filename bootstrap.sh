#!/bin/bash

# Function to print status messages
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Check if Homebrew is installed, install if not
if ! command -v brew &> /dev/null; then
    log "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    log "Homebrew is already installed."
fi

# Install essential applications via Homebrew
ESSENTIAL_APPS=(
    pycharm-ce
    raycast
    notion
    brave
    karabiner-elements
    warp
)

log "Installing essential applications..."

for app in "${ESSENTIAL_APPS[@]}"; do
    if ! brew list --cask "$app" &>/dev/null; then
        log "Installing $app..."
        brew install --cask "$app" || log "Error installing $app"
    else
        log "$app is already installed."
    fi
done

# Install essential command-line tools via Homebrew
ESSENTIAL_TOOLS=(
    python
    git
    wget
    tree
    zsh
    fzf  # Fuzzy Finder for the terminal
    tmux  # Terminal multiplexer
    duti
)

log "Installing essential command-line tools..."

for tool in "${ESSENTIAL_TOOLS[@]}"; do
    if ! brew list "$tool" &>/dev/null; then
        log "Installing $tool..."
        brew install "$tool" || log "Error installing $tool"
    else
        log "$tool is already installed."
    fi
done

# Set Arc as the default browser for HTTP, HTTPS, and HTML files
duti -s com.brave.browser http
duti -s com.brave.browser https
duti -s com.brave.browser public.html

# Set Preview as the default app for PDFs
duti -s com.apple.Preview pdf

# Set PyCharm as the default app for Python files
duti -s com.jetbrains.pycharm.ce python

log "Default applications set."

# Set up Python
log "Configuring Python..."
pip3 install --upgrade pip  # Upgrade pip
pip3 install virtualenv     # Install virtualenv for Python project environments

# Create a default virtualenv directory
mkdir -p ~/.virtualenvs
echo "export WORKON_HOME=~/.virtualenvs" >> ~/.zshrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.zshrc
source ~/.zshrc

# Git configuration
log "Setting up Git..."
git config --global user.name "JonsPhy"
git config --global user.email "j.vonstein.jvs@gmail.com"
git config --global init.defaultBranch main
git config --global pull.rebase true

# Set Dock preferences
log "Setting Dock preferences..."
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.12
defaults write com.apple.dock tilesize -int 51
defaults write com.apple.dock largesize -int 16
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock orientation -string "right"
defaults write com.apple.dock wvous-br-corner -int 14

# Restart the Dock to apply changes
killall Dock

# Set Finder preferences
log "Setting Finder preferences..."
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder ShowToolbar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "icnv"
defaults write com.apple.finder DesktopViewSettings -dict-add IconViewSettings '{iconSize = 64; gridSpacing = 54; showIconPreview = 1;}'
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder StandardViewSettings -dict-add ListViewSettings '{iconSize = 16; useRelativeDates = 1;}'
defaults write com.apple.finder SidebarWidth -int 159
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Library/Mobile Documents/com~apple~CloudDocs/"
defaults write com.apple.finder FXArrangeGroupViewBy -string "Name"

# Restart Finder to apply changes
killall Finder

log "Bootstrap setup complete!"