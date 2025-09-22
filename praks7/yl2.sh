#!/bin/bash
# See skript küsib kasutajalt ridade ja sümbolite arvu ning väljastab vastava kujundi,
# kontrollides, et sisestatud väärtused oleksid numbrid.

# Funktsioon kontrollimaks, kas sisend on number
function is_number() {
    # Kontrollib, kas muutuja vastab numbri formaadile.
    # Regulavaldis "^[0-9]+$" tähendab:
    # ^ - rea algus
    # [0-9] - mistahes number (0 kuni 9)
    # + - üks või enam korda
    # $ - rea lõpp
    [[ "$1" =~ ^[0-9]+$ ]]
}

# Küsib ridade arvu ja kontrollib sisendit
while true; do
    read -p "Sisesta ridade arv: " rows
    if is_number "$rows"; then
        break
    else
        echo "Viga! Palun sisesta number."
    fi
done

# Küsib sümbolite arvu reas ja kontrollib sisendit
while true; do
    read -p "Sisesta tärnide arv reas: " cols
    if is_number "$cols"; then
        break
    else
        echo "Viga! Palun sisesta number."
    fi
done

# Välised tsükkel ridade jaoks
for (( i=1; i<=rows; i++ ))
do
    # Väljastab rea numbri
    echo -n "$i.  "
    
    # Sisemine tsükkel sümbolite jaoks
    for (( j=1; j<=cols; j++ ))
    do
        echo -n "* "
    done
    
    # Prindib uue rea
    echo ""
done
