#!/bin/bash
# Skript arvutab kasutaja sisestatud täisarvu numbrite summa

read -p "Sisesta suvaline täisarv: " number

# Kontrollime, kas sisend on täisarv (võib olla ka negatiivne)
if ! [[ "$number" =~ ^-?[0-9]+$ ]]; then
    echo "Viga: palun sisesta ainult täisarv!"
    exit 1
fi

# Leiame arvu märgi (negatiivne või positiivne)
sign=1
if [ "$number" -lt 0 ]; then
    sign=-1
fi

# Võtame absoluutväärtuse
abs_number=${number#-}

sum=0

# Arvutame numbrite summa while-tsükli abil
while [ "$abs_number" -gt 0 ]; do
    digit=$((abs_number % 10))
    sum=$((sum + digit))
    abs_number=$((abs_number / 10))
done

# Märgi arvestamine
sum=$((sum * sign))

echo "Arvu $number numbrite summa on $sum"
