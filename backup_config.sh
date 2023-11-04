#!/bin/bash

bash homebrew/list_installed_packages.sh

ZSHRC=~/.zshrc
P10K=~/.p10k.zsh
BASHRC=~/.bashrc

DEST=("./home/ubuntu" "./home/macos")

echo "Select the operating system for which you want to back up configuration files:"
echo "1. Ubuntu"
echo "2. macOS"
read -p "Enter the number (1/2): " OS_INDEX

if [ "$OS_INDEX" -ge 1 ] && [ "$OS_INDEX" -le ${#DEST[@]} ]; then
  DESTINATION_DIR="${DEST[OS_INDEX - 1]}"
  mkdir -p "$DESTINATION_DIR"

  # Backup .zshrc
  if [ -f "$ZSHRC" ]; then
    cp "$ZSHRC" "$DESTINATION_DIR"
    echo "Backed up .zshrc to $DESTINATION_DIR"
  fi

  # Backup .p10k.zsh
  if [ -f "$P10K" ]; then
    cp "$P10K" "$DESTINATION_DIR"
    echo "Backed up .p10k.zsh to $DESTINATION_DIR"
  fi

  # Backup .bashrc
  if [ -f "$BASHRC" ]; then
    cp "$BASHRC" "$DESTINATION_DIR"
    echo "Backed up .bashrc to $DESTINATION_DIR"
  fi

  TIME=$(date +"%Y-%m-%d %H:%M:%S")
  git add .
  git commit -m "Backed up configuration files on $TIME"
  git push
  echo "Backup completed successfully."
else
  echo "Invalid choice. Please enter a valid number (1/2)."
fi

bash homebrew/install_homebrew_packages.sh
