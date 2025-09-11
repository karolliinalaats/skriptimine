#!/bin/bash
# Skript arvutab vajaliku busside arvu, tagades, et ka ülejäänud reisijad mahuvad bussi.
# Lisatud on sisestuse kontroll, mis tagab, et sisestatud väärtused on numbrid.

# Küsib reisijate arvu ja kontrollib sisestust
echo -n "Sisesta reisijate arv: "
read reisijad
if ! [[ "$reisijad" =~ ^[0-9]+$ ]]; then
  echo "Viga: Sisestatud väärtus ei ole täisarv."
  exit 1
fi

# Küsib kohtade arvu bussis ja kontrollib sisestust
echo -n "Sisesta kohtade arv bussis: "
read kohad
if ! [[ "$kohad" =~ ^[0-9]+$ ]]; then
  echo "Viga: Sisestatud väärtus ei ole täisarv."
  exit 1
fi

# Arvutab täisbusside arvu ja ülejäänud reisijad
busse_kokku=$((reisijad / kohad))
ulejaak=$((reisijad % kohad))

# Kui reisijaid jääb üle, lisab ühe bussi
if (( ulejaak > 0 )); then
  busse_kokku=$((busse_kokku + 1))
fi

# Väljastab lõpptulemuse
echo "    Kokku on vaja $busse_kokku bussi"
