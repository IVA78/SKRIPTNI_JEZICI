#!/usr/bin/perl

#U datoteci su zapisani podaci o terminima laboratorijskih vježbi pojedinih studenata, 
#te vrijeme njihove predaje (zakljuˇ cavanja) izlaznog testa, u obliku:
#JMBAG;Prezime;Ime;Termin;Zakljucano 
#0036438919;Bagaric;Magdalena;2011-03-14 08:00 11:00 A209;2011-03-14 08:45:02

#Napišite skriptu u Perlu, koja ´ ce za svakog studenta provjeriti je li zakljucao svoj 
#izlazni test unutar prvih sat vremena laboratorijskog termina 
#(može se pretpostaviti da termini pocinju na puni sat).

#Ispisati podatke o studentima za koje taj uvjet nije ispunjen, kao u primjeru. 
#Ime datoteke se navodi kao argument pri pozivu skripte. 
#Ako se ne navede ime datoteke, skripta podatke treba citati sa standardnog ulaza.


#provjeri cita li se iz csv datoteke
$csv = @ARGV ? 1 : 0;
while (defined($redak = <>)) {
	
	if ($csv) {
        $csv = 0;
        next;
    }
	
	chomp($redak); 
	#print $redak, "\n";
	($jmbag, $prezime, $ime, $termin, $zakljucano) = split /;/, $redak;
	
	
	#spremi samo potrebne podatke
	($datum, $pocetak) = split / /, $termin;
	($sat_pocetak) = split /:/, $pocetak;
    ($sat_zakljucano) = split /:/, substr($zakljucano, 11);

	#provjeri sat
    if ($sat_zakljucano - $sat_pocetak > 0) {
        push @list, "$jmbag $prezime $ime - PROBLEM: $datum $pocetak --> $zakljucano";
    } 
}

foreach  $list (@list) {
    print "$list\n";
}