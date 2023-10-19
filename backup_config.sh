#!/bin/bash

# Define source and destination paths for configuration files
SOURCE_ZSHRC=~/.zshrc
SOURCE_P10K=~/.p10k.sh
DESTINATION_DIR=./shell
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


echo "Backup completed successfully"

