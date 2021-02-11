#!/bin/bash

usage ()

{
	echo "Usage: $0 <extension> (max extension 9)"
}


if [ $# -lt 1 ]
then
	usage
	exit 1

else
	for i in `seq 1 $#`;
	do
		for fichier in `ls`
		do
			if [[ $fichier =~ ^.*\.${1}$ ]]
			then
				echo "git add $fichier"
				git add $fichier
			fi
		done
		shift
	done
fi

exit 0
