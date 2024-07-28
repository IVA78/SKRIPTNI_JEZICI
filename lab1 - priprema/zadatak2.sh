#!/bin/bash

#Napisati naredbu grep koja ce u datoteci namirnice.txt pronaci i ispisati sve retke u kojima se 
#pojavljuju nazivi voca (banana, jabuka, jagoda, dinja, lubenica), 
#neovisno o tome jesu li napisani velikim ili malim slovima.
#grep -i -e 'banana' -e 'jabuka' -e 'jagoda' -e 'dinja' -e 'lubenica' namirnice.txt
grep -i -E 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt

echo "---------------------------------------------------------------------------------------------"
#Modificirati prethodnu naredbu tako da se ispisuju samo retci u kojima se ne pojavljuju zadane rijeci.
grep -i -E -v 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt

echo "---------------------------------------------------------------------------------------------"
#Napisati naredbu grepkoja ce u kazalu ~/projekti/ i svim njegovim podkazalima pronaci datoteke u kojima
#se pojavljuje šifra u obliku tri velika slova i šesteroznamenkasti broj, 
#te ispisati retke u kojima se ta šifra pojavljuje. 
#Šifra od ostalog teksta mora biti odvojena razmakom.
grep -r -E '\b[A-Z]{3}[0-9]{6}\b' ~/projekti/

#Testiranje regularnog izraza
#grep -E '\b[A-Z]{3}[0-9]{6}\b' sifre.txt 

echo "---------------------------------------------------------------------------------------------"
#Napisati naredbu koja ce ispisati imena i detaljne podatke svih datoteka u tekucem kazalu
#i njegovim podkazalima, koje su mijenjane prije 7 do 14 dana.
find . -type f -mtime +7 -mtime -14 -ls

#Testiranje naredbe
#find . -type f -mtime 0 -ls

echo "---------------------------------------------------------------------------------------------"
#Napisati u jednom retku for petlju koja ´ ce ispisati brojeve od 1 do 15.
#Pritom iskoristiti izraz za generiranje sekvence ili naredbu seq.
for i in $(seq 1 15)
do	
	echo $i
done

echo "---------------------------------------------------------------------------------------------"
#Modificirati prethodnu naredbu tako da se zadnji broj raspona zadaje u varijabli kraj.
#Provjeriti je li svejedno koristi li se izraz za generiranje sekvence ili naredba seq.
kraj=15
for i in $(seq 1 $kraj);
	do echo $i;
done

#for i in $(1..$kraj);
#        do echo $i;
#done
#./zadatak2.sh: line 48: 1..15: command not found