#!/bin/bash
# Skript küsib kasutaja vanuse ja määrab, kas ta on laps, nooruk,
# täiskasvanu või senjoor. Kontrollib ka sisendi korrektsust.

# Küsi kasutajalt vanus
echo -n "Sisesta (oma) vanus: "
read vanus

# Kontrolli, kas sisestatud väärtus on positiivne täisarv
if ! [[ "$vanus" =~ ^[0-9]+$ ]]; then
    echo "Vigane sisend. Palun sisesta positiivne täisarv."
    exit 1
fi

# Eluetapi määramine tingimuslausetega
if [ "$vanus" -le 11 ]; then
    echo "Oled laps"
elif [ "$vanus" -le 18 ]; then
    echo "Oled nooruk"
elif [ "$vanus" -le 62 ]; then
    echo "Oled täiskasvanu"
else
    echo "Oled senjoor"
fi
