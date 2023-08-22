#!/bin/bash

# Script: backup_configs.sh
# Description: A script to backup zsh configuration files.
# Author: AppleBoiy
# Date: August 14, 2023

# Define source and destination paths for configuration files
SOURCE_ZSHRC=~/.zshrc
SOURCE_P10K=~/.p10k.sh
SOURCE_NVIM=~/.config/nvim/lua/custom
DESTINATION_DIR=./config_backups

# Create a directory to store the backup files if it doesn't exist
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

# Backup .nvim config
if [ -d "$SOURCE_NVIM" ]; then
  cp -r "$SOURCE_NVIM" "$DESTINATION_DIR/nvim/custom"
  echo "Backed up nvim/lua/custom to $DESTINATION_DIR/nvim/custom/"
fi

echo "Backup completed successfully"

