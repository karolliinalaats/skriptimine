#!/bin/bash
# Skript, mis prindib kasvavate ridadega tärnide kolmnurga vastavalt kasutaja sisestatud ridade arvule.
# Skript kontrollib, et sisestatud väärtus oleks number.

# Funktsioon kontrollimaks, kas sisend on number
function is_number() {
    # Kontrollib, kas sisend vastab numbri formaadile.
    # Regulavaldis "^[0-9]+$" tähendab:
    # ^ - rea algus
    # [0-9] - mistahes number (0 kuni 9)
    # + - üks või enam korda
    # $ - rea lõpp
    [[ "$1" =~ ^[0-9]+$ ]]
}

# Küsib ridade arvu ja valideerib sisendi
while true; do
    read -p "Sisesta ridade arv: " rows
    if is_number "$rows"; then
        break
    else
        echo "Viga! Palun sisesta number."
    fi
done

# Välimine tsükkel ridade jaoks
for (( i=1; i<=rows; i++ ))
do
    # Prindib rea numbri ja vahe
    echo -n "$i.  "
    
    # Sisemine tsükkel sümbolite jaoks, mis sõltub rea numbrist
    for (( j=1; j<=i; j++ ))
    do
        echo -n "* "
    done
    
    # Prindib uue rea
    echo ""
done
