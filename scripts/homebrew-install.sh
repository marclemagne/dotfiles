#!/usr/bin/env bash

set -e

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
# shellcheck disable=SC1090
source "${ROOT_DIR}/utils.sh"

function updateAndInstallBundles() {
  logger "Updating Homebrew"
  brew update

  logger "Installing Homebrew packages"
  brew bundle
}

if test ! "$(which brew)"; then
  logger "Installing Homebrew"

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  updateAndInstallBundles
else
  logger warn "Homebrew already installed"

  confirm "Would you like to update and install Homebrew packages?" \
    && updateAndInstallBundles \
    || exit 0
fi
