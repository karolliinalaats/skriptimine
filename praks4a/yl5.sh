#!/bin/bash
#Skript kasutaja määratud kataloogi varundamiseks koos kuupäeva ja dublikaatide haldusega.

# Define the backup directory.
BACKUP_DIR="./backup"

# Ensure the backup directory exists.
mkdir -p "$BACKUP_DIR"

# Get the full path of the backup directory for output message.
FULL_BACKUP_PATH=$(readlink -f "$BACKUP_DIR")

# Ask the user for the directory to back up.
read -p "Sisesta kataloogi täielik tee, mida soovid varundada: " SOURCE_DIR

# 1. Check if the directory exists.
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Viga: Kataloog '$SOURCE_DIR' ei eksisteeri."
    exit 1
fi

# 2. Prevent backing up root-level directories.
if [ "$(dirname "$SOURCE_DIR")" == "/" ] || [ "$SOURCE_DIR" == "/" ]; then
    echo "Viga: Ligipääs 'root' kaustadele keelatud! Varundamiseks peab olema root kasutaja."
    exit 1
fi

# Get the name of the directory to use in the backup file name.
DIR_NAME=$(basename "$SOURCE_DIR")

# Get the current date in the specified format (e.g., "18sept2025").
CURRENT_DATE=$(date +"%d%b%Y" | tr '[:upper:]' '[:lower:]')

# Construct the base file name with the date.
BASE_FILE_NAME="$DIR_NAME.backup.$CURRENT_DATE.tar.gz"

# 3. Handle duplicate file names by adding a number.
BACKUP_FILE="$BASE_FILE_NAME"
COUNTER=1

while [ -f "$BACKUP_DIR/$BACKUP_FILE" ]; do
    BACKUP_FILE="$DIR_NAME.backup.$CURRENT_DATE($COUNTER).tar.gz"
    COUNTER=$((COUNTER + 1))
done

# Get the full path of the source directory for the output message.
FULL_SOURCE_PATH=$(readlink -f "$SOURCE_DIR")

# Print the required descriptive message.
echo "Kataloogi '$FULL_SOURCE_PATH' varundus tehakse."
echo "Varundusfail salvestatakse kataloogi '$FULL_BACKUP_PATH' nimega '$BACKUP_FILE'."

# Create the compressed tar archive.
tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$DIR_NAME"

echo "Varundamine on edukalt lõpetatud."
