#!/bin/bash
# See skript küsib kasutajalt kataloogi nime ja loob sellest varukoopia.

echo "Sisesta kataloogi nimi: "
read kataloog

# Kontrollib, kas sisestatud kataloog eksisteerib
if [ ! -d "$kataloog" ]; then
    echo "Viga: Kataloogi '$kataloog' ei leitud."
    exit 1
fi

# Eraldab kataloogi nimest ainult viimase osa
katalooginimi=$(basename "$kataloog")

# Loob varundusfaili ja suunab kogu tar-käsu väljundi "tühjusesse"
tar -czf ./backup/"$katalooginimi".backup.tar.gz "$kataloog" > /dev/null 2>&1

# Väljastab soovitud lause
echo "Kataloogi $kataloog/ backup_i nimi on $katalooginimi.backup.tar.gz ja ta asub /home/karol/skriptimine/praks4a/backup/ kataloogis."
