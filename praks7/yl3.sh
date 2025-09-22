#!/bin/bash
# Skript, mis prindib tärnidest koosneva ruudu, kus ainult esimene ja viimane rida ning veerg
# on tärnid. Ülejäänud on tühikud, mille sügavus on 2. Skript kontrollib, et sisestatud väärtused oleksid numbrid.

# Funktsioon kontrollimaks, kas sisend on number
function is_number() {
    # Kontrollib, kas sisend vastab numbri formaadile.
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

# Küsib tärnide arvu reas ja valideerib sisendi
while true; do
    read -p "Sisesta tärnide arv reas: " cols
    if is_number "$cols"; then
        break
    else
        echo "Viga! Palun sisesta number."
    fi
done

# Välimine tsükkel ridade jaoks
for (( i=1; i<=rows; i++ ))
do
    echo -n "$i.  "
    
    # Sisemine tsükkel veergude jaoks
    for (( j=1; j<=cols; j++ ))
    do
        # Tingimus, mis otsustab, kas printida tärn või tühik
        if [[ $i -eq 1 || $i -eq $rows || $j -eq 1 || $j -eq $cols ]]; then
            echo -n "* "
        else
            echo -n "  "
        fi
    done
    
    echo ""
done
