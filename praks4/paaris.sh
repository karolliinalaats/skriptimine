#!/bin/bash
# Skript, mis kontrollib, kas kasutaja sisestatud täisarv on paaris või paaritu.

# Küsime kasutajalt täisarvu.
echo "Sisesta suvaline täisarv:"
read arv

# Kontrollime mooduloperaatoriga (%).
# Kui arv jagatuna kahega (2) annab jäägi 0, on see paaris.
# Vastasel juhul on see paaritu.
if (( arv % 2 == 0 )); then
  echo "Antud arv on paaris"
else
  echo "Antud arv on paaritu"
fi
