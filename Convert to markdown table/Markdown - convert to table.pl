my $counter = 1;
while (<>) {
	chomp;
	@t = split ("\r",$_);

	foreach $elem (@t) {
		$n = $elem =~ s/\t/\|/g;
		$elem =~ s/^/\|/;
		$elem =~ s/$/\|/;
		print $elem;
		if ($counter == 1 ) {printf "\n|" . "---|"x($n+1)};
		$counter ++;
	}

	print "\n";
}