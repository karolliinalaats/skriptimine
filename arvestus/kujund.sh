#!/bin/bash

# Minu nimi: Kärol-Liina Lääts
# Skripti nimi: kujund.sh
# Skripti ülesannde kirjeldus: Küsi kasutajalt positiivne täisarv ja joonista tärnidest koosnev kolmnurk, mis vastab ridade arvule.

# Lubada sisestada kujundi ridade arv
echo -n "Sisesta kujundi ridade arv: "
read READADE_ARV

# --- SISENDI KONTROLL ---
# Kontrollib, kas sisend on positiivne täisarv (number > 0)
if ! [[ "$READADE_ARV" =~ ^[0-9]+$ ]] || [ "$READADE_ARV" -le 0 ]; then
    echo "VIGA: Palun sisesta positiivne täisarv (number suurem kui 0). Sisestasid: $READADE_ARV"
    exit 1
fi

# Trükkida kujund
# Peamine tsükkel, mis loendab alates sisestatud arvust kuni 1-ni.
for (( i=$READADE_ARV; i>=1; i-- )); do

    # Loome tärnide stringi (näiteks 7 tärni).
    # See loob $i pikkuse stringi, kus iga sümbol on '*'.
    TARNIDE_RIDA=""
    for (( j=1; j<=i; j++ )); do
        TARNIDE_RIDA="${TARNIDE_RIDA}*"
    done

    # Väljastame rea ilma tühikute ja muu segaduseta.
    echo "$TARNIDE_RIDA"

done
