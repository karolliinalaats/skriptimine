#!/bin/bash
# Skript arvutab 10 esimese paarisarvu summa.

summa=0

# Tsükkel käib läbi arvud 1-st 10-ni
for (( arv=1; arv<=10; arv++ ))
do
  # Kontrolli, kas arv on paarisarv (jääk 2-ga jagamisel on 0)
  if (( arv % 2 == 0 )); then
    summa=$(( summa + arv ))
  fi
done

echo "Arvude vahemikus 1 kuni 10 (kaasaarvatud) paarisarvude summa on: $summa"
