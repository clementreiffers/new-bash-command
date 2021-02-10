#!/bin/bash

compter_points() {
	# fonction pour prendre en compte le dernier point (pour ignorer les autres)
	str=$1
	b=$(awk -F'.' '{ print NF }' <<< $str)
	echo $((b-2))
}

create_dir() {
	# on cree le fichier s'il n'existe pas uniquement
	if ! [ -d $1 ]; then 
		mkdir $1
	fi
}

repeatChar() { 
	# on recupere le nombre de points dans le nom de fichier
	# on met le même nombre de #-1 pour n'avoir que son extention
    input="#" 
    count=$(compter_points $1) 
    myString="$(printf "%${count}s")" 
    echo "${myString// /$input}" 
} 

# on test tous les éléments d'un fichier et on tri seulement si c'est un fichier

for FILE in *
do
	if [ -f "$FILE" ]; then
		# on supprime les espaces du nom de fichier pour que ça soit plus pratique à l'avenir
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
