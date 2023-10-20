#!/bin/bash

SOURCE_ZSHRC=~/.zshrc
SOURCE_P10K=~/.p10k.sh


DESTINATIONS=("./home/linux" "./home/macos" "./home/windows")


echo "Select the operating system for which you want to back up configuration files:"
echo "1. Linux"
echo "2. macOS"
read -p "Enter the number (1/2): " OS_INDEX


if [ "$OS_INDEX" -ge 1 ] && [ "$OS_INDEX" -le ${#DESTINATIONS[@]} ]; then
  DESTINATION_DIR="${DESTINATIONS[OS_INDEX - 1]}"
  mkdir -p "$DESTINATION_DIR"

  # Backup .zshrc
  if [ -f "$SOURCE_ZSHRC" ]; then
    cp "$SOURCE_ZSHRC" "$DESTINATION_DIR"
    echo "Backed up .zshrc to $DESTINATION_DIR"
  fi

  # Backup .p10k.sh
  if [ -f "$SOURCE_P10K" ]; then
    cp "$SOURCE_P10K" "$DESTINATION_DIR"
    echo "Backed up .p10k.sh to $DESTINATION_DIR"
  fi

  echo "Backup completed successfully."
else
  echo "Invalid choice. Please enter a valid number (1/2)."
fi
