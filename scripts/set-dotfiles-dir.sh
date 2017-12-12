#!/usr/bin/env bash

set -e

BLUE=$(tput setaf 4)
GREEN=$(tput setaf 2)
NC=$(tput sgr0) # No color

dotfiles="$(dirname "$(pwd)")"

echo "${GREEN}› Updating ${BLUE}bash_profile.symlink${GREEN} to add DOTFILES export referencing ${BLUE}$dotfiles${NC}"
echo "\$DOTFILES/bin will be added to your \$PATH allowing for scripts to be executed"

echo "export DOTFILES=$dotfiles" | cat - ../bash_profile.symlink > temp && mv temp ../bash_profile.symlink
