while (<>) {
	chomp;
	@t = split ("\r",$_);
	$counter = 0;

	foreach $elem (@t) {
		$counter++;
		$n = $elem =~ s/\t/\|/g;
		$elem =~ s/^/\|/;
		$elem =~ s/$/\|/;
		if ($counter == 2 ) {printf "|" . "---|"x($n+1) . "\n" };
		print $elem, "\n";
	}
	print "\n";
}