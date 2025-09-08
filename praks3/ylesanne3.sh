#!/bin/bash

# Küsi kasutajalt ainepunktide arv
echo -n "Sisesta ainepunktide arv (täisarv): "
read ainepunktid

# Küsi kasutajalt nädalate arv
echo -n "Sisesta nädalate arv (täisarv): "
read nadalad

# Arvuta koguaeg (EAP * 26)
koguaeg=$(echo "$ainepunktid * 26" | bc)

# Arvuta nädala ajakulu (koguaeg jagatud nädalatega)
ajakulu=$(echo "scale=2; $koguaeg / $nadalad" | bc)

# Ümarda ülespoole, kasutades antud valemit
ajakulu_ymardatud=$(echo "($ajakulu + 0.9)/1" | bc)

# Väljasta tulemus
echo "Ühe nädala eeldatav ajakulu on $ajakulu_ymardatud tundi."

