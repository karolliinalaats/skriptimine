#!/bin/bash
# Skript küsib kuu numbri ja väljastab vastava kuu nimetuse

read -p "Sisesta kuu number (1-12): " month

# Kontrollime, kas sisestus on täisarv
if ! [[ "$month" =~ ^[0-9]+$ ]]; then
    echo "Viga: palun sisesta täisarv vahemikus 1–12."
    exit 1
fi

case $month in
    1) echo "See on jaanuar";;
    2) echo "See on veebruar";;
    3) echo "See on märts";;
    4) echo "See on aprill";;
    5) echo "See on mai";;
    6) echo "See on juuni";;
    7) echo "See on juuli";;
    8) echo "See on august";;
    9) echo "See on september";;
    10) echo "See on oktoober";;
    11) echo "See on november";;
    12) echo "See on detsember";;
    *) echo "Viga: kuu number peab olema vahemikus 1–12.";;
esac
