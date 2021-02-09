#!/bin/bash

if [ $# == 1 ]; then	
	sudo apt search $1 > a.log
	nombre_ligne=$(cat a.log | wc -l);
	nombre_ligne=$((nombre_ligne-2));
	tail -$nombre_ligne a.log > b.log
	rm a.log


	a=$(sed -n -e '/installé/{p;n;}' b.log)
	echo $a > b.log

	a=$(sed -e 's/installé//g' b.log)
	echo $a > b.log

	a=$(sed -e 's/, automatique//g' b.log)
	echo $a > b.log



	for i in $a
	do 
		if [ $(grep $1 <<<$i) ]; then
			package=$(echo $i | cut -d'/' -f1)
			echo $package
			sudo apt remove $package -y 
			sudo apt purge $package -y 
		fi 
	done
	sudo apt autoremove -y > b.log
	rm b.log
else
	echo -e "\033[01m\033[47m\033[31mMauvaise utilisation\033[00m"
	echo "Uninstall With Occurrence (UWO) : Ce script permet de désinstaller tous les logiciels qui commencent par une certaine occurence"
	echo "Usage: ./uwo.sh <occurence>"
	echo "Par exemple, './uwo.sh firefox' pour supprimer tous les paquets de firefox"
fi
