#!/bin/bash
chmod 644 values.txt check.txt
rm check.txt				
rm values.txt
if [ ! -e check.txt ];			# removes the values.txt and check.txt file and creates new values.txt file with the default value and updates the brightness
then
	echo $'checked' > check.txt
	echo $'00 10.000000\n01 10.000000\n02 10.000000\n03 10.000000\n04 15.000000\n05 20.000000\n06 25.000000\n07 30.000000\n08 40.000000\n09 45.000000\n10 50.000000\n11 60.000000\n12 70.000000\n13 80.000000\n14 90.000000\n15 100.000000\n16 90.000000\n17 80.000000\n18 70.000000\n19 60.000000\n20 50.000000\n21 40.000000\n22 30.000000\n23 20.000000' > values.txt
        ft=$(date +%H)
        fv="$(awk -v ft="$ft" '$1==ft {print $2}' values.txt)"
        xbacklight -set $fv
	chmod 000 values.txt check.txt
fi
