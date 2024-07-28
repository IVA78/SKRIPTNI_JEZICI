#!/usr/bin/perl

#Napišite Perl skriptu koja ce ucitati niz brojeva u listu, te izracunati i ispisati
#aritmeticku sredinu ucitanih brojeva.

print "Upisite zeljeni niz brojeva > ";
$niz = <STDIN>;
chomp($niz);

@lista = split / /, $niz;
$duljina = @lista;

$sum = 0;
foreach $element (@lista) {
	$sum += $element;
}	

$arr_sredina = $sum / $duljina;
print "Aritmeticka sredina unesenog niza brojeva: $arr_sredina";