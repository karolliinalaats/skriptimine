#!/bin/bash
#
# Skript, mis kasutab käsurea parameetrit OS-i valikuks.
# $1 on esimene parameeter, mis skriptile antakse.

if [ $1 -eq 1 ]; then
    echo "You Pick up Unix (Sun Os)"
elif [ $1 -eq 2 ]; then
    echo "You Pick up Linux (Red Hat)"
else
    echo "What you don't like Unix/Linux OS."
fi
