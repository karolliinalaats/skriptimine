#!/bin/bash
# Skript küsib kuu numbrit ja väljastab vastava aastaaja.

# Küsi kuu numbrit
echo -n "Sisesta kuu number: "
read kuu

# Kontrolli sisendi kehtivust (kas on number ja vahemikus 1-12)
if ! [[ "$kuu" =~ ^[1-9]$|^1[0-2]$ ]]; then
  echo "Vigane sisend. Palun sisesta number 1 kuni 12."
  exit 1
fi

# Määra aastaaeg tingimuslausetega
if [ "$kuu" -eq 12 -o "$kuu" -eq 1 -o "$kuu" -eq 2 ]; then
  echo "Praegu on talv"
elif [ "$kuu" -eq 3 -o "$kuu" -eq 4 -o "$kuu" -eq 5 ]; then
  echo "Praegu on kevad"
elif [ "$kuu" -eq 6 -o "$kuu" -eq 7 -o "$kuu" -eq 8 ]; then
  echo "Praegu on suvi"
elif [ "$kuu" -eq 9 -o "$kuu" -eq 10 -o "$kuu" -eq 11 ]; then
  echo "Praegu on sügis"
else
  echo "Vigane sisend. Palun sisesta number vahemikus 1-12."
fi
