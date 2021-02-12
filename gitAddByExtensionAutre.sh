#!/bin/bash

usage ()

{
	echo "Usage: $0 [option] <extension>"
	echo "Options :"
	echo "-R --recursive (seek in subdirectories recursively)"
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
				echo "git add $fichier"
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















# option="None"

# if [ $# -lt 1 ]
# then
# 	usage
# 	exit 1
# fi

# if [ `echo $1 | cut -c1` == '-' ]
# then
# 	if [ $# -lt 2 ]
# 	then
# 		usage
# 		exit 1
# 	fi
# 	case $1 in
# 		'-R')
# 			option='-R'
# 			;;
# 		*)
# 			usage
# 			exit 2
# 			;;
# 	esac
# fi
	
# if [ $option == "None" ] 
# then
# 	for i in `seq 1 $#`;
# 	do
# 		for fichier in `ls | grep -E ^.*\.${1}$`
# 		do
# 			echo "git add $fichier"
# 			git add $fichier
# 		done
# 		shift
# 	done
# else
# 	for i in `seq 2 $#`;
# 	do
# 		for fichier in `find . -regex ^.*\.${2}$`
# 		do
# 			echo "git add $fichier"
# 			git add $fichier
# 		done
# 		shift
# 	done
# fi


# exit 0	

