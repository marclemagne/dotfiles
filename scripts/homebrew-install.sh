#!/usr/bin/env bash

set -e

if test ! "$(which brew)"; then
  echo "Installing Homebrew"

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "Updating Homebrew"
  brew update

  echo "Installing Homebrew packages"
  brew bundle
else
  exit 1
fi
