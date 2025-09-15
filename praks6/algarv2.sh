#!/bin/bash
# Skript väljastab esimese 20 täisarvu kohta, kas tegemist on algarvuga või mitte

for number in {1..20}; do
    if [ "$number" -lt 2 ]; then
        echo "$number - ei ole algarv"
        continue
    fi

    divisor=2
    is_prime=1

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
done
