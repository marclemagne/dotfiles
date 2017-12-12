#!/usr/bin/env bash

BLUE=$(tput setaf 4)
CYAN=$(tput setaf 6)
GREEN=$(tput setaf 2)
NC=$(tput sgr0) # No color
YELLOW=$(tput setaf 3)

function warn() {
  echo "${YELLOW}$1${NC}"
}

function confirm() {
  read -r -p "$1 [y/N] " confirm

  [[ "$confirm" =~ [yY](es)* ]] && return

  false
}

echo "${GREEN}› Bootstrapping workstation${NC}"
echo "${CYAN}See the README following this installation to finish setting up this workstation${NC}"

# Adds DOTFILES export referencing the dotfiles directory to
# `bash_profile.symlink` so we can add it to the PATH allowing us to execute
# scripts
./set-dotfiles-dir.sh

# Installs command line tools
echo "${GREEN}› Installing Command Line Tools${NC}"
xcode-select --install 2> /dev/null || warn "Command Line Tools already installed"

# Sets up gitconfig
echo "${GREEN}› Setting up gitconfig${NC}"
echo "Please enter your name and email address"
echo "If you need to make any changes later, see ${BLUE}$HOME/.gitconfig.local${NC}"
./setup-gitconfig.sh

# Sets up AWS credentials and config
echo "${GREEN}› AWS credentials and config${NC}"
confirm "Do you want to setup the default AWS credentials and config now?" \
  && ./setup-aws.sh \
  || echo "You can do this later by running ${BLUE}$(pwd)/setup-aws.sh${NC}"

# Sets up dotfiles
echo "${GREEN}› Installing dotfiles${NC}"
./dotfiles-install.sh install

# Installs Homebrew and packages/software
echo "${GREEN}› Installing Homebrew and adding packages${NC}"
echo "You may be asked to log into the Mac App Store"
./homebrew-install.sh || warn "Homebrew already installed"

# Sets up macOS defaults
# NOTE: This should be last since it will ask to restart the system
echo "${GREEN}› Setting macOS defaults${NC}"
./macos-defaults.sh