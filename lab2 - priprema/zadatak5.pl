#!/usr/bin/perl

#Napišite skriptu u Perlu koja ce iz datoteke cije je ime navedeno kao argument 
#pri pozivu skripte ucitati podatke o rezultatima studenata. 

#U prvom retku datoteke zapisan je niz brojeva, odvojenih znakom ";", 
#koji predstavljaju faktore s kojima se svaka komponenta ocjene množi. 
#Slijede retci s podacima o svakom pojedinom studentu: maticni broj, prezime i ime kao jedno polje,
#te niz brojeva koji predstavljaju ostvarene rezultate pojedinih komponenti ocjene studenta. 
#Pojedina polja odvojena su znakom ";". Ako neka bodovna komponenta nedostaje, oznacena je znakom "-". 

#U datoteci su dozvoljeni i komentirani retci (prvi znak u retku je #), 
#kao i prazni retci– prazne i komentirane retke treba preskociti (zanemariti). 

#Primjer oblika datoteke:
# #udjeli komponenti 
# 0.15;0.20;0.30;0.10;0.10;0.10;0.05  
# #
# # rezultati studenta 
#0036438919;Bagaric;Magdalena;91.5;90.75;88.25;100;87.5;87.5;90 
#0036439578;Bajer;Goran;64.4;72;64.75;72.5;76.25;50;62

#Skripta treba na temelju ucitanih rezultata generirati rang-listu studenata, 
#u kojoj ce biti oznacen rang studenta, njegovo prezime i ime, te ukupni ostvareni broj bodova 
#(dobije se zbrajanjem svih komponenti rezultata pomnoženih s pripadnim faktorima).

#Funkciji sort može se zadati blok 3naredbi ili potprogram koji obavlja usporedbu 
#dva elementa liste koja se sortira

#polje za spremanje faktora
@faktori;
#dictionary za spremanje podataka o studentima preko jmbaga
%studenti;

$c = 0;

while (defined($redak = <>)) {
	chomp($redak); 
	
	#prekoci komentar
	if ($redak =~ /^\s*#/) {
		next;
	}
	
	if ($c == 0) {
		@faktori = split /;/, $redak;
		$c++;
		#print join(' ', @faktori);
		next;
	}
	
	($jmbag, $prezime, $ime, @rezultati) = split /;/, $redak;
	
	$suma = 0;
	$cnt=0;
	for $rezultat (@rezultati) {
		$suma = $suma + $rezultat * $faktori[$cnt];
		$cnt++;
	}
	
	$studenti{$jmbag} = [$prezime, $ime, $suma];
	
	#print "Procitao sam: $redak \n"; 
}

#poredaj kljuceve prema sumi bodova
my @keys =  reverse sort { $studenti{$a}[2] <=> $studenti{$b}[2] } keys(%studenti);

#ispis rijecnika
$cnt=1;
foreach  $key (@keys) {
	$value = $studenti{$key};
	($prezime, $ime, $suma) = @{$value};
	printf "%3d. %-*s (%s) : %6.2f\n", $cnt, 20, "$prezime, $ime", $jmbag, $suma;
	$cnt++;
}