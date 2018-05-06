#!/usr/bin/env bash

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
# shellcheck disable=SC1090
source "${ROOT_DIR}/utils.sh"

logger "› Bootstrapping workstation"
logger info "See the README following this installation to finish setting up this workstation"

# Creates a new symlink at `dotfiles.local.symlink` which exports DOTFILES_DIR
# as an environmental variable referencing the dotfiles directory which is added
# to the PATH allowing us to run scripts in the bin directory
"${ROOT_DIR}/set-dotfiles-dir.sh"

# Sets up gitconfig
logger "› Setting up gitconfig"
logger info "Please enter your name and email address"
logger info "If you need to make any changes later, see:"
logger hl "$HOME/.gitconfig.local"
"${ROOT_DIR}/setup-gitconfig.sh"

# # Sets up AWS credentials and config
logger "› AWS credentials and config"
if confirm "Do you want to setup the default AWS credentials and config now?"; then
  "${ROOT_DIR}/setup-aws.sh"
else
  logger info "This can be done later by running:"
  logger hl "./scripts/setup-aws.sh"
fi

# Sets up dotfiles
logger "› Installing dotfiles"
"${ROOT_DIR}/dotfiles-install.sh" install

# Installs Homebrew and packages/software
logger "› Installing Homebrew and adding packages"
logger info "You may be asked to log into the Mac App Store"
"${ROOT_DIR}/homebrew-install.sh"

# Sets up macOS defaults
# NOTE: This should be last since it will ask to restart the system
logger "› Setting macOS defaults"
"${ROOT_DIR}/set-macos-defaults.sh"
