#!/bin/bash

handle_error() {
  echo "Error: $1"
  exit 1
}

backup_configs() {
  local dest_dir=""

  case "$1" in
    ubuntu) dest_dir="$HOME/.devenv/home/ubuntu" ;;
    macos) dest_dir="$HOME/.devenv/home/macos" ;;
    *) handle_error "Invalid operating system. Please specify either 'ubuntu' or 'macos'."
  esac

  [ ! -d "$dest_dir" ] && mkdir -p "$dest_dir" || :

  files_to_backup=("$HOME/.zshrc" "$HOME/.p10k.zsh" "$HOME/.bashrc")

  for file in "${files_to_backup[@]}"; do
    [ -f "$file" ] && cp "$file" "$dest_dir" || :
  done

  time=$(date +"%Y-%m-%d %H:%M:%S")
  git add . && git commit -m "Backed up configuration files on $time" && git push || handle_error "Failed to commit changes to Git."

  echo "Backup completed successfully."
}

show_available_os() {
  echo "Usage: ./backup -o <os> (os: 'ubuntu' or 'macos')"
  echo "Available OS:"
  echo "  -o ubuntu : Choose Ubuntu"
  echo "  -o macos  : Choose macOS"
}

if [ "$#" -eq 0 ]; then
  backup_configs "macos"
else
  while getopts "o:h" opt; do
    case $opt in
      o) backup_configs "$OPTARG" ;;
      h) show_available_os; exit 0 ;;
      *) handle_error "Usage: $0 -o <os> (os: 'ubuntu' or 'macos')" ;;
    esac
  done
fi
