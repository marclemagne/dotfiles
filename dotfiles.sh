#!/bin/sh

GREEN='\033[0;32m'
NC='\033[0m' # No Color

usage() {
  echo "Use this script to install/uninstall custom dotfiles"
  echo ""
  echo "To install:"
  echo "$ ${GREEN}./dotfiles.sh install${NC}"
  echo ""
  echo "To uninstall:"
  echo "$ ${GREEN}./dotfiles.sh uninstall${NC}"
}

getLink() {
  filename=$(basename "$1")
  filenameWithoutExtension="${filename%.*}"
  echo "$HOME/.${filenameWithoutExtension}"
}

install() {
  for dotfile in $(pwd)/*.symlink
  do
    link=$(getLink "$dotfile")
    ln -sf "$dotfile" "$link"
    echo "Linked: $dotfile -> ${GREEN}$link${NC}"
  done
}

uninstall() {
  for dotfile in $(pwd)/*.symlink
  do
    link=$(getLink "$dotfile")
    unlink "$link"
    echo "Unlinked: ${GREEN}$link${NC}"
  done
}

main() {
  # Shows usage if there are no arguments
  if [ $# -ne 1 ]; then
    usage
    exit 1
  fi

  # Shows usage for any unexpected arguments
  if [ "$1" != 'install' ] && [ "$1" != 'uninstall' ]; then
    usage
    exit 1
  fi

  # Installs dotfiles
  if [ "$1" = 'install' ]; then
    install
  fi

  # Uninstalls dotfiles
  if [ "$1" = 'uninstall' ]; then
    uninstall
  fi
}

# Starts script
main "$1"
