#!/bin/bash

# Skripti nimi: info
# Minu nimi: Kärol-Liina Lääts
# Skripti ülesannde kirjeldus: Skript tervitab sisselogitud kasutajat ning Väljastab kuupäeva ja aja kujul Täna on 11.11.2020 kell 8:45

# b. Skript tervitab sisselogitud kasutajat
# The 'whoami' command gets the current username.
LOGGED_IN_USER=$(whoami)

echo "Tere tulemast, $LOGGED_IN_USER!" # "Welcome, [username]!"

# c. Väljastab kuupäeva ja aja
# Kuupäeva command on järgmises formaadis:
# +Täna on %d.%m.%Y kell %H:%M

echo -n "Täna on " # Print "Täna on " without a newline
date "+%d.%m.%Y kell %H:%M" # Print the formatted date and time
