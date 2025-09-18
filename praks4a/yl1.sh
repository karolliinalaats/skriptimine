#!/bin/bash
# See skript küsib kasutaja nime ja sünniaastat ning arvutab tema vanuse.

echo "Sisesta oma nimi: "
read nimi

echo "Tere tulemast, $nimi!"

# Loob lõpmatu tsükli, kuni kasutaja sisestab kehtiva sünniaasta
while true; do
  echo "Sisesta oma sünniaasta: "
  read synniaasta

  # Kontrollib, kas sisend sisaldab ainult numbreid ja on 4 numbrit pikk
  if [[ "$synniaasta" =~ ^[0-9]{4}$ ]]; then
    break  # Väljub tsüklist, kui sisend on kehtiv
  else
    echo "Viga: Palun sisesta kehtiv sünniaasta (nt 1999)."
  fi
done

aasta=$(date +%Y)
vanus=$((aasta - synniaasta))

echo "$nimi, sina oled $vanus aasta vana."
