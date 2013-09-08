#!/usr/bin/perl

use escapeSample;

# STDIN/STDOUT $B$N%P%C%U%!%j%s%0$r%*%U$K$9$k!#(B
select(STDIN); $| = 1;
select(STDOUT); $| = 1;
# $B%-!<F~NO$,$=$N$^$^2hLL$KI=<($5$l$J$$$h$&$K$9$k!#(B
system "stty -echo -icanon eol \001";

clearConsole;
moveCursor 0,0;

print <<EOD
-------
| | | |
-------
| | | |
-------
| | | |
-------
EOD
;

# $B%+!<%=%k0LCV(B
my ($x, $y) = (1, 1);
# $B%^%9L\$N:BI8(B
my @field = ( [ "2,2", "2,4", "2,6" ], ["4,2", "4,4", "4,6"], ["6,2", "6,4", "6,6"] );
# $B%^%9L\$N>uBV(B
my @state = ( [ "","","" ], ["","",""], ["", "", ""] );

for(;;) {

	debug (9,9,$i++);
	debug (11,10,$x . $y);
	
	# $B>uBV%A%'%C%/(B
	if (check(@state)) {
		die "clear";
	} else {
		debug (11,9,$state[0][0] . $state[0][1] . $state[0][2] );
	}

	my($R, $U, $V, $Z, $S, $T);

    # $BI8=`F~NO(B (1) $B$+$i(B 0.01 $BICFb$KF~NO$,$"$k$+%A%'%C%/$9$k!#(B
    $R = chr(1);
    ($S, $T) = select $R, $U, $V, 0.01;
    if ($S) {
        $Z = getc;  # $BF~NO$"$j$J$i<u$1<h$k!#(B
	} elsif ($e++ > 20) {
        #$Z = "";   # $BF~NO$,$J$$$H$-$O!"(B0.2 $BIC$4$H$K%9%Z!<%9$,F~NO$5$l$?$H$_$J$9!#(B
        $e = 0;
    } else {
		next;
	}

	if ($Z eq "j") {
		$x ++ if $x < 2;
		moveCursor eval($field[$x][$y]);
	} elsif ($Z eq "k") {
		$x -- if $x > 0;
		moveCursor eval($field[$x][$y]);
	} elsif ($Z eq "l") {
		$y ++ if $y < 2;
		moveCursor eval($field[$x][$y]);
	} elsif ($Z eq "h") {
		$y -- if $y > 0;
		moveCursor eval($field[$x][$y]);
	} elsif ($Z eq " ") {
		$state[$x][$y] = "O";
		moveCursor eval($field[$x][$y]);
		print "O";
	} elsif ($Z eq "q") {
		last "good by!";
	}

}

# $BHW>e$N%A%'%C%/(B
sub check {

	my @state = shift;

	my $true = 1;
	my $false = undef;

	# $B2#(B
	foreach my $x (0 .. 2) {
		if ($state[$x][0] eq "" ) {
			next;
		}
		debug (22,22,$x);

		if ($state[$x][0] eq $state[$x][1]
				and $state[$x][0] eq $state[$x][2] ) {
			return $true;
		}
	}
	# $B=D(B
	foreach my $y (0 .. 2) {
		if ($state[0][$y] eq "" ) {
			next;
		}
		if ($state[0][$y] eq $state[1][$y]
				and $state[0][$y] eq $state[2][$y] ) {
			return $true;
		}
	}

	return $false;

}

sub debug {
	my $i = shift;
	my $j = shift;
	my $text = shift;
	moveCursor $i,$j;
	printf $text;
	moveCursor eval($field[$x][$y]);
}

# $B%?!<%_%J%k$N5sF0$rLa$9!#(B
system "stty sane";
