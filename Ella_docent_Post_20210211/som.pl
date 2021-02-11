#!/perl


use strict;

my ($bl,$gr,$ro,$ge);
my @row = 0 .. 9;

foreach $bl (@row) {
	foreach $gr (@row) {
		foreach $ro (@row) {
			foreach $ge (@row) {
				if (test($bl,$gr,$ro,$ge)) {
					print "Goed: (blauw= $bl, groen= $gr, rood =$ro, geel=$ge)\n";
				}
			}
		}
	}
}

sub test {
	my ($bl,$gr,$ro,$ge) = @_;
	

	return 0 if ($bl == $gr);
	return 0 if ($bl == $ge);
	return 0 if ($bl == $ro);
	return 0 if ($gr == $ge);
	return 0 if ($gr == $ro);
	return 0 if ($ge == $ro);

	my ($rij1,$rij2,$rij3,$rij4);
	$rij1 = "$bl$gr$bl" + 0;
	$rij2 = "$bl$ro$gr" + 0;
	$rij3 = "$ro$bl$gr$ge" + 0;
	$rij4 = "$ge$gr$bl$ro" + 0;

	if ($rij1 + $rij2 + $rij3 != $rij4) {
		return 0;
	}


	printf("%5s\n",$rij1);
	printf("%5s\n",$rij2);
	printf("%5s\n",$rij3);
	printf("-----\n",$rij4);
	printf("%5s\n",$rij4);
	
	return 1;
}
	
