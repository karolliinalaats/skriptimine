#!/bin/bash
# Skript, mis prindib tühikute asemel ringe ja tärne, luues kolmnurkse mustri.
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
    # Tingimus ridade numbri formaadi reguleerimiseks
    if [[ $i -lt 10 ]]; then
        # Prindib ühekohalised numbrid lisatühikuga
        echo -n "$i.  "
    else
        # Prindib kahekohalised numbrid ilma lisatühikuta
        echo -n "$i. "
    fi

    # Sisemine tsükkel ringide jaoks.
    for (( j=1; j<=rows-i; j++ ))
    do
        echo -n "o "
    done

    # Sisemine tsükkel tärnide jaoks.
    for (( k=1; k<=i; k++ ))
    do
        echo -n "* "
    done

    # Prindib uue rea
    echo ""
done
