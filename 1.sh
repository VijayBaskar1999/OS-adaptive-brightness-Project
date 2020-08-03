#!/bin/bash

if [ ! -e check.txt ]; 						#it checks for the first execution of this program in a computer and creates checked txt file and values txt file with the given values
then  
	echo $'checked' > check.txt
	echo $'00 10.000000\n01 10.000000\n02 10.000000\n03 10.000000\n04 15.000000\n05 20.000000\n06 25.000000\n07 30.000000\n08 40.000000\n09 45.000000\n10 50.000000\n11 60.000000\n12 70.000000\n13 80.000000\n14 90.000000\n15 100.000000\n16 90.000000\n17 80.000000\n18 70.000000\n19 60.000000\n20 50.000000\n21 40.000000\n22 30.000000\n23 20.000000' > values.txt
	ft=$(date +%H)
	fv="$(awk -v ft="$ft" '$1==ft {print $2}' values.txt)"
	xbacklight -set $fv
	chmod 000 check.txt values.txt					# changed the mode for protection
else									# else condition for further execution of the program				
	chmod 644 check.txt values.txt						
	c=$(cat check.txt)
	if [ $c = 'checked' ]; 
	then 
		t=$(date +%H)						# obtain the time
		v1="$(awk -v t="$t" '$1==t {print $2}' values.txt)"	# obtain the brightness value from the values.txt file
		v2=$(xbacklight -get)					# obtain the brightness from the system
		ori="$t $v1"
		sum=`echo "$v1 + $v2" | bc -l`
		avg=`echo "$sum / 2" | bc -l`
		avg=$(printf "%.6f" $avg)				# finds the average between these two values
		new="$t $avg"
		sed  -i "s/$ori/$new/" values.txt			# replace the average value in the values.txt file
		newval="$(awk -v t="$t" '$1==t {print $2}' values.txt)"	
		xbacklight -set $newval					# update the new brightness
	fi
	chmod 000 check.txt values.txt
fi
