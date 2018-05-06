#!/usr/bin/env bash

set -e

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
# shellcheck disable=SC1090
source "${ROOT_DIR}/utils.sh"

DOTFILES_DIR="$(pwd)"

logger "Creating new file: dotfiles.dir.symlink"
logger info "This exports DOTFILES_DIR as an environmental variable referencing:"
logger hl "$DOTFILES_DIR"
logger info "This is added to the PATH envornmental variable allowing for scripts to be run from the bin directory"

echo "export DOTFILES=$DOTFILES_DIR" > ./dotfiles.local.symlink
