#!/usr/bin/perl

my %no_rpcs = ('exp1'=>9933,'exp2'=>9934,'exp3'=>9935,'exp4'=>9936,'exp5'=>9937,'exp6'=>9938,'exp7'=>9939,'exp8'=>9940);

my $sum = 0;
my $counter = 0;

foreach my $i (sort keys %no_rpcs) {
	my $str = '';
	$str = `curl --connect-timeout 1 --max-time 1 --silent -H "Content-Type: application/json" -d '{"id":1, "jsonrpc":"2.0", "method": "system_syncState"}' http://localhost:$no_rpcs{$i} | jq -r '.result' | jq -r '.currentBlock'`;
	if ($str =~ /\d+/) {
		$sum += $str;
		$counter++;
	}
	$str = "none\n" unless length($str);
	print $i.' '.$str;
}

my $mean = $counter ? $sum/$counter : "undef";

print "mean is $mean, counter is $counter!\n";

exit;
