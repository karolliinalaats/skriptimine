#!/bin/bash

# Küsi kasutajalt varundatava kataloogi täielik tee
read -p "Sisesta kataloogi täielik tee, mida soovid varundada: " TARGET_DIR

# Kontrolli, kas kataloogi tee sisestati
if [ -z "$TARGET_DIR" ]; then
    echo "Viga: Kataloogi teed ei sisestatud."
    exit 1
fi

# Kontrolli, kas kataloog eksisteerib
if [ ! -d "$TARGET_DIR" ]; then
    echo "Viga: Kataloogi '$TARGET_DIR' ei leitud."
    exit 1
fi

# Eralda kataloogi nimi
DIR_NAME=$(basename "$TARGET_DIR")

# Saa jooksev kuupäev formaadis DDmonYYYY (nt 22sept2025)
DATE_FORMAT=$(date +"%d%b%Y")

# Määra varunduse sihtkataloog
DEST_DIR="/home/karol/skriptimine/backups" # Muuda vajadusel

# Loo sihtkataloog, kui see ei eksisteeri
if [ ! -d "$DEST_DIR" ]; then
    echo "Kataloog '$DEST_DIR' ei eksisteeri. Loome selle."
    mkdir -p "$DEST_DIR"
fi

# Põhifailinimi ilma numbrilisandita
BASE_FILENAME="${DIR_NAME}.backup.${DATE_FORMAT}"

# Algne failinimi
BACKUP_FILENAME="${BASE_FILENAME}.tar.gz"

# Kontrolli, kas varundus juba eksisteerib ja leia järgmine vaba number
if [ -f "${DEST_DIR}/${BACKUP_FILENAME}" ]; then
    LATEST_NUMBER=0
    for file in "${DEST_DIR}/${BASE_FILENAME}"*.tar.gz; do
        if [[ "$file" =~ \(([0-9]+)\)\.tar\.gz$ ]]; then
            CURRENT_NUMBER=${BASH_REMATCH[1]}
            if (( CURRENT_NUMBER > LATEST_NUMBER )); then
                LATEST_NUMBER=$CURRENT_NUMBER
            fi
        fi
    done
    
    NEXT_NUMBER=$((LATEST_NUMBER + 1))
    
    BACKUP_FILENAME="${BASE_FILENAME}(${NEXT_NUMBER}).tar.gz"
fi

# Väljasta seletav kirjeldus
echo "Varundame kataloogi '$TARGET_DIR'."
echo "Varundus salvestatakse nimega '$BACKUP_FILENAME' asukohta '$DEST_DIR'."

# Loo tihendatud varundusfail
tar -czvf "${DEST_DIR}/${BACKUP_FILENAME}" -C "$(dirname "$TARGET_DIR")" "$DIR_NAME"

# Kontrolli, kas varundamine õnnestus
if [ $? -eq 0 ]; then
    echo "Varundus valmis!"
else
    echo "Varunduse loomine ebaõnnestus."
    exit 1
fi
