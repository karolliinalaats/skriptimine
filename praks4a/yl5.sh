#!/bin/bash
# See skript küsib kasutajalt kataloogi nime ja loob sellest varukoopia, millele on lisatud kuupäev.

echo "Sisesta kataloogi täielik tee, mida soovid varundada: "
read kataloog

# Kontrollib, kas sisestatud kataloog eksisteerib
if [ ! -d "$kataloog" ]; then
    echo "Viga: Kataloogi '$kataloog' ei leitud."
    exit 1
fi

# Eraldab kataloogi nimest ainult viimase osa
katalooginimi=$(basename "$kataloog")

# Loob kuupäeva- ja ajamärgenduse formaadis '18sept2025'
kuupaev=$(date +%d%b%Y | sed 's/Sep/sept/i')

echo "Alustan kataloogi '$kataloog' varundamist..."
echo "Varundusfail salvestatakse kataloogi 'backup' nimega $katalooginimi.backup.$kuupaev.tar.gz."

# Pakib kataloogi kokku ja salvestab backup-kausta
tar -czf ./backup/$katalooginimi.backup.$kuupaev.tar.gz "$kataloog"

echo "Varundamine on lõppenud."
