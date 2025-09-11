#!/bin/bash
# Skript kontrollib, kas käsurea parameetrina antud arv on paaris või paaritu.
# Skript valideerib sisendi, et tagada täpselt ühe täisarvu olemasolu.

# Kontrollib, kas parameetreid on täpselt üks ja kas see on number
if [ "$#" -ne 1 ] || ! [[ "$1" =~ ^[0-9]+$ ]]; then
  echo "Kaivita see skript koos arvuga mille paarsus soovid kontrollida. Näiteks: ./paarsus 3"
  exit 1
fi

# Loogika paarsuse kontrollimiseks
arv=$1
if (( arv % 2 == 0 )); then
  echo "Antud arv on paaris"
else
  echo "Antud arv on paaritu"
fi
