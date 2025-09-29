#!/bin/bash

# Minu nimi: Kärol-Liina Lääts
# Skripti nimi: Menu
# Skripti ülesannde kirjeldus: Väljastab menüü (3 valikut), küsib kasutajalt numbri
#                     sisestamist ja annab vastavalt valikule sobiva tagasiside.
#                     Kontrollib sisendi kehtivust.

# Väljasta kasutajale järgmine menüü
echo "--- Päevapakkumiste Menüü ---"
echo "1) liha ja kartulid"
echo "2) kala ja krõpsud"
echo "3) supp ja salat"
echo "------------------------------"

# Paku kasutajale sisestada valiku numbrit
echo -n "Tee oma valik (1 või 2 või 3): "
read VALIK # Loeme kasutaja sisendi muutujasse VALIK

# Kontrollime sisendi kehtivust:
# 1. Kas sisend on tühi?
if [ -z "$VALIK" ]; then
    echo "VIGA: Valik ei saa olla tühi. Sisesta number 1, 2 või 3."
    exit 1
fi

# 2. Kas sisend on number 1, 2 või 3?
# Kasutame 'case' konstruktsiooni, et kontrollida ja tegutseda vastavalt sisendile.
case "$VALIK" in
    1)
        # valik 1)
        echo ""
        echo "Väga maitsev, aga jälgi oma tervist!"
        echo "Head isu!"
        ;;
    2)
        # valik 2)
        echo ""
        echo "Brititoit on maitsev!"
        echo "Head isu!"
        ;;
    3)
        # valik 3)
        echo ""
        echo "Nii tervislik ja igav..."
        echo "Head isu!"
        ;;
    *)
        # See plokk käivitub, kui sisend ei ole 1, 2 ega 3.
        # See püüab kinni nii kehtetud numbrid (nt 4) kui ka tähed/sõnad.
        echo "VIGA: Palun sisesta ainult number 1, 2 või 3. Sisestasid: $VALIK"
        ;;
esac
