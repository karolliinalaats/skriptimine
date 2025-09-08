#!/bin/bash

# Küsi kasutajalt sisendit
read -p "Sisesta reisijate arv: " reisijad
read -p "Sisesta kohtade arv ühes bussis: " kohad

# Kontrolli, et mõlemad sisendid oleksid täisarvud
if ! [[ "$reisijad" =~ ^[0-9]+$ ]] || ! [[ "$kohad" =~ ^[0-9]+$ ]]; then
  echo "Viga: Palun sisesta ainult positiivsed täisarvud."
  exit 1
fi

# Arvuta täis busse ja järelejäänud reisijad
tais_busse=$(( reisijad / kohad ))
ulejaanud=$(( reisijad % kohad ))

# Väljasta tulemus
echo "Täielikult täidetud busse: $tais_busse"
echo "Maha jääb inimesi: $ulejaanud"

