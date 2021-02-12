#!/bin/bash

usage ()

{
	echo "Usage: $0 [option] <extension>"
	echo "Without option you can add 9 extensions."
	echo "Options :"
	echo "-R --recursive (seek in subdirectories recursively 8 extensions max)."
}

if [ ! $1 == '-R' ] 
then #Dans le cas où on a pas d'option
	if [ $# -lt 1 ]
	then
		echo "Missing extension file"
		usage
		exit 1
	else
		for i in `seq 1 $#`;
		do
			for fichier in `ls | grep -E ^.*\.${1}$`
			do
				echo "git add ./$fichier"
				git add $fichier
			done
			shift
		done
	fi
else #Dans le cas où on a l'option -R
	if [ $# -lt 2 ]
	then
		echo "Missing extension file"
		usage
		exit 1
	else
		for i in `seq 2 $#`;
		do
			for fichier in `find . -regex ^.*\.${2}$`
			do
				echo "git add $fichier"
				git add $fichier
			done
			shift
		done
	fi
fi

