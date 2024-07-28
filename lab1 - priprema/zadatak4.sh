#!/bin/bash

#Provjera je li zadan direktorij sa log datotekama
if [ "$#" -ne 1 ]; then
    echo "Nije zadan direktorij sa log datotekama kao parametar!"
    exit 1
fi

#Provjera postoji li direktorij sa log datotekama
if [ ! -d "$1" ]; then
	echo "Zadani direktorij ne postoji!"
	exit 1
fi

#Ime svake datoteke sadrži podatak o datumu i vremenu snimanja fotografije, 
#u obliku GGGGMMDD_HHMM.jpg. Treba napisati skriptu koja ce izlistati imena fotografija
#iz direktorija zadanog kao argument naredbenog retka na naˇ cin da se fotografije grupiraju 
#prema mjesecu u kojem su snimljene. Fotografije u svakoj grupi trebaju biti poredane po 
#vremenu snimanja i numerirane, a na kraju svake grupe treba ispisati broj fotografija u toj grupi.

#Grupiranje fotografija u foldere
for photo in "$1"/*.jpg
do
	
    yearMonth=$(echo "$photo" | grep -o -E '[0-9]{8}_[0-9]{4}' | sed -E 's/([0-9]{4})([0-9]{2})([0-9]{2})_([0-9]{4})/\1-\2/')
	#echo $yearMonth
	mkdir -p "$yearMonth"
	cp "$photo" "$yearMonth/"	
done

#Prolazak kroz foldere i ispis
for dir in $(ls -d */ | grep -E '^[0-9]{4}-[0-9]{2}/')
do 
	#echo "$dir"
	
	cd "$dir" || exit
	folder_name="$dir"
	formatted_date=$(echo "$folder_name" | awk -F'-' '{print $2"-"$1}')
	echo "$formatted_date :"
	echo "----------"
	
	#!/bin/bash


	i=1
	for file in $(ls *.jpg | sort)
	do
		echo "   $i. $file"
		((i++))
	
	done
	((i--))
	echo "--- Ukupno: $i slika ---"

	
	cd ".."


done