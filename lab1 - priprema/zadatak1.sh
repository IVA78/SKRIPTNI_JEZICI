#!/bin/bash


#Postaviti varijablu ljuske proba na vrijednost "Ovo je proba". 
#Ispisati vrijednost postavljene varijable. 
proba="Ovo je proba"
echo $proba

echo "---------------------------------------------------------------------------------------------"
#U varijablu lista_datoteka upisati listu svih datoteka tekuceg kazala. 
#Pritom iskoristiti širenje imena datoteke. Ispisati rezultat.
lista_datoteka=(*)
echo ${lista_datoteka[*]}

echo "---------------------------------------------------------------------------------------------"
#Uvarijablu ljuske proba3 upisati 3 puta nadovezanu vrijednost varijable proba,
#pri cemu na svaku recenicu treba dodati tocku i razmak.
proba3=""
for i in 1 2 3
do
	proba3+="$proba. "
done
echo $proba3

echo "---------------------------------------------------------------------------------------------"
#Varijablu a postaviti na vrijednost 4, varijablu b na 3, varijablu c na 7. 
#Zatim u varijablu d upisati vrijednost koja se dobije izrazom (a + 4) ∗ b%c.
# Upotrijebiti širenje aritmetickih izraza. Ispisati vrijednosti varijabli a, b, c i d.
a=4
b=3
c=7
d=$(((a + 4) * b % c))
echo "$a $b $c $d"

echo "---------------------------------------------------------------------------------------------"
#Uvarijablu broj_rijeci upisati ukupan broj rijeci u .txt datotekama tekuceg kazala.
#Upotrijebiti supstituciju naredbe i naredbu wc.
broj_rijeci=$(cat *.txt | wc -w)
echo $broj_rijeci

echo "---------------------------------------------------------------------------------------------"
#Ispisati sadržaj Vašeg maticnog kazala primjenom tilda-ekspanzije.
echo ~/


