#!/bin/bash

# Loome backup kausta, kui seda veel ei ole.
BACKUP_DIR="./backup"
mkdir -p "$BACKUP_DIR"

# Küsime kasutajalt kataloogi, mida varundada.
read -p "Sisesta kataloogi täielik tee, mida soovid varundada: " SOURCE_DIR

# 1. Kontrollime, kas kataloog eksisteerib.
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Viga: Kataloog '$SOURCE_DIR' ei eksisteeri."
    exit 1
fi

# 2. Kontrollime, kas tegemist on root-kaustaga.
if [ "$(dirname "$SOURCE_DIR")" == "/" ] || [ "$SOURCE_DIR" == "/" ]; then
    echo "Viga: Ligipääs 'root' kaustadele keelatud! Varundamiseks peab olema root kasutaja."
    exit 1
fi

# Eraldame varundatava kataloogi nime, et luua backup faili nimi.
DIR_NAME=$(basename "$SOURCE_DIR")
BASE_FILE_NAME="$DIR_NAME.backup.tar.gz"
BACKUP_FILE="$BASE_FILE_NAME"
COUNTER=1

# 3. Kontrollime, kas fail juba eksisteerib ja lisame numbri.
while [ -f "$BACKUP_DIR/$BACKUP_FILE" ]; do
    BACKUP_FILE="$DIR_NAME.backup($COUNTER).tar.gz"
    COUNTER=$((COUNTER + 1))
done

# Kasutame käsku 'readlink -f', et saada absoluutne tee.
FULL_SOURCE_PATH=$(readlink -f "$SOURCE_DIR")
FULL_BACKUP_PATH=$(readlink -f "$BACKUP_DIR")

# Väljastame nõutud seletava kirjelduse.
echo "Kataloogi '$FULL_SOURCE_PATH' varundus tehakse."
echo "Varundusfail salvestatakse kataloogi '$FULL_BACKUP_PATH' nimega '$BACKUP_FILE'."

# Teostame varundamise (kokkupakkimine ja tihendamine).
# Kasutame '-C' valikut, et minna õigesse kausta enne pakkimist.
tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$DIR_NAME"

echo "Varundamine on edukalt lõpetatud."
