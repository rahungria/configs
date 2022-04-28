bat_number=0
acpi=$(acpi -b 2>/dev/null | grep "Battery $bat_number")
mode=$(echo "$acpi" | awk '{print $3}' | cut -d"," -f1)
percent=$(echo "$acpi" | awk '{print $4}' | grep -Eo [0-9]+)
remaining=$(echo "$acpi" | awk '{print $5}')
symbol=""

if [ $percent -lt 20 ]; then
	echo -n "%{F#ff1414}"
elif [ $percent -lt 50 ]; then
	echo -n "%{F#ff8a14}"
fi

if [ "$mode" = "Charging" ]; then
	symbol=' '
elif [ "$mode" = "Discharging" ]; then
	symbol=' '
else
	symbol=' '
fi

echo -n "$symbol"
echo -n "$percent"%
