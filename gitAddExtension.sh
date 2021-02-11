#!/bin/bash

usage ()

{
	echo "Usage: $0 [option] <extension>"
	echo "Options :"
	echo "-R --recursive (seek subdirectories recursively)"
}

recherche ()

{
	for fichier in rechercheFichier
	do
		echo "test"
		#Faire un if avec regex
		#if [ $fichier == "*?\.$extension$"
	done
}

option=0
rechercheFichier=`ls`

if [ $# -lt 1 ]
then
	usage
	exit 1

else
	if [ `echo $1 | cut -c1` == '-' ]
	then
		case $1 in
			'-R')
				rechercheFichier=`ls -R`
				option=1
				;;
			*)
				usage
				exit 2
				;;
		esac
	fi
	
#	if [ $option == 0 ] 
#	then
		#Gestion dans le cas ou option=0
#	else
		#Gestion dans le cas ou option=1
#	fi
fi

return 0	
