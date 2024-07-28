#!/usr/bin/perl

#Napisati Perl skriptu koja ce u datoteci koja se zadaje kao argument naredbenog retka 
#izbrojati rijeci sa zajednickim prefiksom. 

#Duljina prefiksa zadaje se kao zadnji argument naredbenog retka, 
#a prethode mu imena datoteka (može ih biti i više). 
#Ako se ne navede niti jedno ime datoteke, skripta treba tekst citati sa standardnog ulaza.
#U datoteci je obican tekst, a rijeci su odvojene proizvoljnim brojem razmaka 
#(ukljucujuci i tabulatore i prelaske u novi red) te znakovima interpunkcije. 

#Prilikom usporedbe rijeci treba zanemariti razliku izmedu velikih i malih slova. 
#Lista prefiksa treba biti poredana po abecedi, a iza svakog prefiksa treba navesti broj pojavljivanja. 

use open ':locale';
use locale;
use utf8;

#provjeri duljinu prefiksa
$duljina_prefiksa =  @ARGV[-1];
#ukloni duljinu prefiksa kako bi se samo zadane datoteke citale
pop @ARGV;
#print "duljina prefiksa: ", $duljina_prefiksa, "\n";

#definiraj dictionary
%dict = ();

while (defined($redak = <>)) {
	chomp($redak); 
	
	#podijeli redak prema onom sto nije alnum
	@redak_splitted = split /\W+/, $redak;
	
	for $r (@redak_splitted) {
		#provjeri je li rijec prekratka
		if (length($r) < $duljina_prefiksa){
			next;
		}
		#izvuci prefiks i spremi u dictionary
		$r = substr($r, 0, $duljina_prefiksa);
		$r = lc($r);
		$dict{$r} = $dict{$r} + 1;
	}		
}

#ispis prefiksa
foreach  $key (sort keys %dict) {
	$value = $dict{$key};
	print "$key : $value\n";
}