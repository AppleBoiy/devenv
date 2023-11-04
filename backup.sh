#!/bin/bash

handle_error() {
  echo "Error: $1"
  exit 1
}

backup_configs() {
  local dest_dir=""
  
  case "$1" in
    ubuntu)
      dest_dir="./home/ubuntu"
      ;;
    macos)
      dest_dir="./home/macos"
      ;;
    *)
      handle_error "Invalid operating system. Please specify either 'ubuntu' or 'macos'."
      ;;
  esac

  if [ ! -d "$dest_dir" ]; then
    mkdir -p "$dest_dir" || handle_error "Failed to create destination directory."
  fi

  files_to_backup=("$HOME/.zshrc" "$HOME/.p10k.zsh" "$HOME/.bashrc")

  for file in "${files_to_backup[@]}"; do
    if [ -f "$file" ]; then
      cp "$file" "$dest_dir" || handle_error "Failed to back up $file."
      echo "Backed up $file to $dest_dir"
    fi
  done

  time=$(date +"%Y-%m-%d %H:%M:%S")
  git add . && git commit -m "Backed up configuration files on $time" && git push || handle_error "Failed to commit changes to Git."
  
  echo "Backup completed successfully."
}

if [ "$#" -ne 1 ]; then
  handle_error "Usage: $0 <os> (os: 'ubuntu' or 'macos')"
else
  backup_configs "$1"
fi

