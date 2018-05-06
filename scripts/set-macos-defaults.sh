#!/usr/bin/env bash

set -e

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
# shellcheck disable=SC1090
source "${ROOT_DIR}/utils.sh"

# Defaults to list view in Finder
defaults write com.apple.finder FXPreferredViewStyle Nlsv

# Turns off option to "Automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

# Disables "Press and hold" to show auto-correction menu for selecting accented
# characters
defaults write -g ApplePressAndHoldEnabled -bool false

# Gives "Full Keyboard Access" to "All controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Sets a fast Key Repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Sets "Use F1, F2, etc. keys as standard function keys"
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

logger info "You need to restart your system in order for these changes to take effect."

read -r -p "Would you like to restart now? [y/N] " prompt

if [[ "$prompt" =~ [yY](es)* ]]
then
  osascript -e 'tell app "loginwindow" to «event aevtrrst»'
fi
