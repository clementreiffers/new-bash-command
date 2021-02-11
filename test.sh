#!/bin/bash


for fichier in `ls`
do
#	echo $fichier 
	if [[ $fichier =~ ^.*\.${1}$ ]]
	then
		echo "Ajoute $fichier"
	fi
done
