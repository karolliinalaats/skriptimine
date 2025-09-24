#!/bin/bash

# Define variables for the source and destination
SOURCE_DIR="./test"
BACKUP_DIR="./backup"
BACKUP_FILE="test.backup.tar.gz"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Viga: Kataloog '$SOURCE_DIR' ei eksisteeri."
    exit 1
fi

# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

# Use 'pwd' to get the absolute path for the output message
FULL_SOURCE_PATH=$(pwd)/$SOURCE_DIR
FULL_BACKUP_PATH=$(pwd)/$BACKUP_DIR

# Print the specific, verbose output
echo "Kataloogi $FULL_SOURCE_PATH backup_i nimi on $BACKUP_FILE ja ta asub $FULL_BACKUP_PATH kataloogis."

# Create the compressed tar archive
tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"
