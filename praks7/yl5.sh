#!/bin/bash
# Skript prindib tühikute asemel ringe ja tärne, luues kolmnurkse mustri.
# Skript valideerib kasutaja sisestuse, veendumaks, et tegemist on numbriga.

# Funktsioon sisendi valideerimiseks
function is_number() {
    # Kontrollib, kas sisend vastab numbrilisele formaadile (üks või enam numbrit).
    [[ "$1" =~ ^[0-9]+$ ]]
}

# Küsib ridade arvu ja valideerib sisendi. Kordab küsimist, kuni sisestus on number.
while true; do
    read -p "Sisesta ridade arv: " rows
    if is_number "$rows"; then
        break
    else
        echo "Viga! Palun sisesta number."
    fi
done

# Välimine tsükkel, mis vastutab ridade loomise eest
for (( i=1; i<=rows; i++ ))
do
    # Prindib rea numbri ja vahe
    echo -n "$i. "

    # Sisemine tsükkel ringide jaoks. Prindib ringe, mis väheneb iga reaga.
    for (( j=1; j<=rows-i; j++ ))
    do
        echo -n "o "
    done

    # Sisemine tsükkel tärnide jaoks. Prindib tärne, mis suureneb iga reaga.
    for (( k=1; k<=i; k++ ))
    do
        echo -n "* "
    done

    # Prindib uue rea, et alustada järgmise reaga
    echo ""
done
