#!/bin/bash

# Function to validate if the input is a positive integer
validate_input() {
  if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Viga: Sisestatud väärtus '$1' ei ole positiivne täisarv." >&2
    exit 1
  fi
}

# Ask for the number of credit points
read -p "Sisesta ainepunktide arv: " ainepunktid
validate_input "$ainepunktid"

# Ask for the number of weeks
read -p "Sisesta nädalate arv: " nadalad
validate_input "$nadalad"

# Calculate the total hours and the weekly hours, rounded up
total_hours=$((ainepunktid * 26))
weekly_hours=$(echo "($total_hours / $nadalad + 0.9) / 1" | bc)

# Display the result
echo "Nädalane eeldatav ajakulu (ümardatud): $weekly_hours tundi"
