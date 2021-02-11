#!/bin/bash

usage ()

{
	echo "Usage: $0 [option] <extension>"
	echo "Options :"
	echo "-R --recursive (seek subdirectories recursively)"
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
	
	if [ $option == 0 ] 
	then
		for fichier in $rechercheFichier
		do
			if [[ $fichier =~ ^.*\.${1}$ ]]
			then
				echo "git add $fichier"
				git add $fichier
			fi
		done
	else
		for fichier in $rechercheFichier
		do
			if [[ $fichier =~ ^.*\.${2}$ ]]
			then
				echo "git add $fichier"
				git add $fichier
			fi
		done
	fi
fi

exit 0	
