#!/usr/bin/env bash

BLUE=$(tput setaf 4)
CYAN=$(tput setaf 6)
GREEN=$(tput setaf 2)
NC=$(tput sgr0) # No color
YELLOW=$(tput setaf 3)

function logger() {
  if [ $# == 1 ]; then
    echo "${GREEN}$1${NC}"
  fi

  if [ $# == 2 ]; then
    case "$1" in
      warn)
        echo "${YELLOW}$2${NC}"
        ;;
      info)
        echo "${CYAN}$2${NC}"
        ;;
      hl)
        echo "${BLUE}$2${NC}"
        ;;
    esac
  fi
}

function confirm() {
  read -r -p "$1 [y/N] " confirm

  [[ "$confirm" =~ [yY](es)* ]] && return

  false
}
