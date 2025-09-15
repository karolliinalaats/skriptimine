#!/bin/bash
# Skript tervitab kasutajat vastavalt süsteemi kellaajale ja lisab kasutajanime suure algustähega

hour=$(date +%H)
user=$USER

# Muudame esimese tähe suureks
user_cap="${user^}"

if [ "$hour" -ge 6 ] && [ "$hour" -lt 12 ]; then
    echo "Tere hommikust, $user_cap!"
elif [ "$hour" -ge 12 ] && [ "$hour" -lt 18 ]; then
    echo "Tere päevast, $user_cap!"
elif [ "$hour" -ge 18 ] && [ "$hour" -lt 22 ]; then
    echo "Tere õhtust, $user_cap!"
else
    echo "Head ööd, $user_cap!"
fi


