#!/usr/bin/perl

#Napišite Perl skriptu koja ce od korisnika zatražiti (i ucitati)
#niz znakova i broj ponavljanja(n).
#Ucitani znakovni niz treba ispisati n puta (svaki put u novom redu).

print "Upisite zeljeni niz znakova > ";
$niz = <STDIN>;
chomp($niz);

print "Upisite zeljeni broj ponavljanja > ";
$n = <STDIN>;
chomp($n);

foreach  (1..$n) {
	print "$niz\n";
}