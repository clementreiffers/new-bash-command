#!/bin/bash

compter_points() {
	str=$1
	b=$(awk -F'.' '{ print NF }' <<< $str)
	echo $((b-2))
}

create_dir() {
if ! [ -d $1 ]; then 
	mkdir $1
fi
}

repeatChar() { 
    input="#" 
    count=$(compter_points $1) 
    myString="$(printf "%${count}s")" 
    echo "${myString// /$input}" 
} 



for FILE in *
do
	if [ -f "$FILE" ]; then
		a=$(echo $FILE | tr "[:blank:]" "_")
		mv "$FILE" $a
		nbr_dieses=$(repeatChar $a)*.
		directory=$(echo $a | sed 's/^.*\.//')
		if [ $a != "ranger_fichiers.sh" ]; then
			create_dir $directory
			mv $a ./$directory
		fi
	fi
done
