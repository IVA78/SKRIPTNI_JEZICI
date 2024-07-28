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

#Napisati skriptu koja ce proci kroz sve datoteke generirane tijekom veljace, te ispisati podatke o akcijama koje su obavljane.
#Za svaku datoteku treba zapisati datum, 
#a zatim za svaku akciju koja se pojavljuje u logovima treba ispisati koliko se puta dogodila toga dana.
#Podatke o akcijama sortirati prema silaznom broju ponavljanja, broj ponavljanja ispisati prije same akcije. 
#Primjer ispisa dan je u nastavku (datum je u formatu dd-mm-gggg).

for log in "$1"/*-02-*
do
	#echo $log
	oldDateFormat=$(echo $log | sed 's/.*\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\).*/\1/')
	#echo $oldDateFormat
	newDateFormat=$(date -d "$oldDateFormat" +"%d-%m-%Y")
	echo "datum: $newDateFormat"
	echo "----------------------------------------------------------------------------------------"
	awk '{print $6 " " $7}' "$log" | sort | uniq -c | sort -nr | awk '{print $1 " : " $2 " " $3}'
done
