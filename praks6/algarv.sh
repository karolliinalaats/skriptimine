#!/bin/bash
# Skript kontrollib, kas sisestatud arv on algarv või mitte

read -p "Sisesta suvaline arv: " number

# Kontrollime, kas sisend on täisarv
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Viga: palun sisesta täisarv!"
    exit 1
fi

# Erijuhtumid
if [ "$number" -lt 2 ]; then
    echo "$number - ei ole algarv"
    exit 0
fi

divisor=2
is_prime=1   # eeldame alguses, et on algarv

while [ $divisor -lt $number ]; do
    if (( number % divisor == 0 )); then
        is_prime=0
        break
    fi
    divisor=$((divisor + 1))
done

if [ $is_prime -eq 1 ]; then
    echo "$number - on algarv"
else
    echo "$number - ei ole algarv"
fi
