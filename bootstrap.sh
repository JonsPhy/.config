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
brew install --cask mathpix-sniping-tool
npm install -g @mathpix/mpx-cli
brew install --cask karabiner-elements
brew install --cask warp