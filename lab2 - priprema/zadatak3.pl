#!/usr/bin/perl

#U repozitoriju na stranici predmeta nalaze se dvije log-datoteke jednog web poslužitelja.
#To su tekst datoteke koje se generiraju svakoga dana, a datum je sadržan u imenu datoteke.
#Svaki redak odgovara jednom pristupanju poslužitelju.

#Napisati skriptu u Perlu koja ce za svaki sat u danu ispisati broj pristupa poslužitelju.
#Kao argumenti naredbenog retka pri pozivu se navode imena log datoteka koje treba analizirati
#(datoteke ne moraju biti u tekucem direktoriju).
#Ako se ne navede niti jedna datoteka, skripta podatke treba citati sa standardnog ulaza
#(sjetite se operatora <>).

#NAREDBENI REDAK ZA POKRETANJE: $ perl zadatak3.pl TestPrimjeri/localhost_access_log*.txt

#print @ARGV;

#provjeri broj argumenata
$num_args = scalar @ARGV;
if ($num_args == 0) {
	
	print "\nNije zadana niti jedna datoteka, citam sa std. ulaza\n";
	
	#definiraj dict
	%dict = ();
	
	#obradi redak
	while (defined($line = <>)) {
		if ($line =~ m/\[(\d{2})\/\w+\/(\d{4}):(\d{2}):/ ) {
			$sat = $3;
			$dict{$sat} = $dict{$sat} + 1;
		}
	}
	
	#ispisi broj pristupa po satu
	#print "ispis";
	foreach  $key (sort keys %dict) {
		$value = $dict{$key};
		print "$key : $value\n";
	}
	
}

#procitaj prvi file
$file =  shift @ARGV;
while ($file) {
	
	#procitaj datum prvog file-a
	($datum) = $file =~ m/(\d{4}-\d{2}-\d{2})/;
	print "\nDatum: ", $datum, "\n";
	print "sat : broj pristupa\n";
	print "-------------------------------\n";
	
	#definiraj dictionary
	%dict = ();
	
	#otvori file za citanje i obradi retke
	open $f, '<', $file or die "Ne moze se otvoriti: '$file': $!";
    while ( $line = <$f>) {
		if ($line =~ m/\[(\d{2})\/\w+\/(\d{4}):(\d{2}):/ ) {
			$sat = $3;
			$dict{$sat} = $dict{$sat} + 1;
		}
    }
    close $f;
	
	#ispisi broj pristupa po satu
	foreach  $key (sort keys %dict) {
		$value = $dict{$key};
		print "$key : $value\n";
	}

	$file =  shift @ARGV;
}