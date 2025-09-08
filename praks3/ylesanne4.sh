#!/bin/bash

# Küsib reisijate arvu
read -p "Sisesta reisijate arv: " reisijad

# Küsib bussis olevate kohtade arvu
read -p "Sisesta kohtade arv ühes bussis: " kohad

# Arvutab täidetud busside arvu
taidetud_bussid=$((reisijad / kohad))

# Arvutab mahajäänud inimeste arvu
mahajaanud_inimesed=$((reisijad % kohad))

# Väljastab tulemused
echo "Täielikult täidetud busse: $taidetud_bussid"
echo "Mahajäänud inimesi: $mahajaanud_inimesed"
