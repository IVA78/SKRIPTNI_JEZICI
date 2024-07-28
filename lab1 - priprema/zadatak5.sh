#!/bin/bash

#Napisati skriptu koja ce pocevši od kazala cije je ime zadano kao argument u naredbenom retku, 
#obici sva podkazala i izbrojati ukupan broj redaka u datotekama s imenima ciji je oblik (npr. '*.c')
#zadan kao drugi argument. 
#Na pocetku skripte ispisati argumente navedene u naredbenom retku pri pozivu skripte.

#Provjera je li zadano kazalo i ime datoteke
if [ "$#" -ne 2 ]; then
    echo "Nije zadano kazalo i ime datoteke kao parametar!"
    exit 1
fi

#Ispis
echo "Kazalo: $1"
echo "Ime datoteke: $2"

#Obilazak
ukupno=0
for file in $(find $1 -type f -name "$2"); do
    if [ -f $file ]; then
        line_count=$(wc -l < "$file")
        echo "Datoteka: $file | Broj linija: $line_count"
        ukupno=$((ukupno + line_count))
    fi
done

#Ispisi ukupnog broja redaka
echo "Ukupno linija u datotekama s nastavkom '$2': $ukupno"