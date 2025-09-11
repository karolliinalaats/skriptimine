#!/bin/bash
# Skript kontrollib, kas sisestatud arv on paaris või paaritu.

# Küsi kasutajalt täisarv
echo -n "Sisesta suvaline täisarv: "
read number

# Kontrolli, kas sisestus on täisarv
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
  echo "Viga: Sisestatud väärtus ei ole täisarv."
  exit 1
fi

# Kontrolli, kas arv on paaris või paaritu
if (( number % 2 == 0 )); then
  echo "Antud arv on paaris"
else
  echo "Antud arv on paaritu"
fi
