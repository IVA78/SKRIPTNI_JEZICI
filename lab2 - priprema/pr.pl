%h = (3, 5, 7, 3, 5, 7); 
$i=3; 
$a = $h{$i+1};

foreach  $key (sort keys %h) {
	$value = $dict{$key};
	print "$key : $value\n";
}