#!/usr/bin/env bash

set -e

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
# shellcheck disable=SC1090
source "${ROOT_DIR}/utils.sh"

export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1090
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

if test ! "$(command -v nvm)"; then
  logger "Installing Node Version Manager"

  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
else
  logger warn "Node Version Manager already installed"
fi
