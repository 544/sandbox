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

my ($x, $y) = (1, 1);
my @field = ( [ "2,2", "2,4", "2,6" ], ["4,2", "4,4", "4,6"], ["6,2", "6,4", "6,6"] );

for(;;) {

	moveCursor 9,9;
	printf $i++;
	moveCursor eval($field[$x][$y]);
	
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
		print "O";
	} elsif ($Z eq "q") {
		last "good by!";
	}
}


