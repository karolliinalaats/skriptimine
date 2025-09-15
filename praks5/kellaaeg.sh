#!/bin/bash
# Skript, mis tervitab kasutajat vastavalt sisestatud kellaajale.

# Küsi kasutajalt kellaaega (tunde)
read -p "Sisesta aja väärtus (0-23): " aeg

# Kontrolli, kas sisestus on number ja vahemikus 0-23
if ! [[ "$aeg" =~ ^[0-9]+$ ]] || (( aeg < 0 || aeg > 23 )); then
  echo "Viga: Sisestus ei ole sobiv. Palun sisesta täisarv vahemikus 0 kuni 23."
  exit 1
fi

# Tervita vastavalt kellaajale
if (( aeg >= 6 && aeg <= 12 )); then
  echo "Tere hommikust!"
elif (( aeg > 12 && aeg <= 18 )); then
  echo "Tere päevast!"
elif (( aeg > 18 && aeg <= 22 )); then
  echo "Tere õhtust!"
else
  echo "Head ööd!"
fi
