#!/usr/bin/perl

use escapeSample;

# STDIN/STDOUT のバッファリングをオフにする。
select(STDIN); $| = 1;
select(STDOUT); $| = 1;
# キー入力がそのまま画面に表示されないようにする。
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

# カーソル位置
my ($x, $y) = (1, 1);
# マス目の座標
my @field = ( [ "2,2", "2,4", "2,6" ], ["4,2", "4,4", "4,6"], ["6,2", "6,4", "6,6"] );
# マス目の状態
my @state = ( [ "","","" ], ["","",""], ["", "", ""] );

for(;;) {

	debug (9,9,$i++);
	debug (10,10,$state[0][1]);
	
	# 状態チェック
	if (check(0,0) || check(0,1) || check(0,2)) {
		print "00:" . check(0,0) . " 01:" . check(0,1) . " 02:" . check(0,2) . "\n";
		die "clear";
	} else {
		debug (11,9,$state[0][0] . $state[0][1] . $state[0][2] );
	}

	my($R, $U, $V, $Z, $S, $T);

    # 標準入力 (1) から 0.01 秒内に入力があるかチェックする。
    $R = chr(1);
    ($S, $T) = select $R, $U, $V, 0.01;
    if ($S) {
        $Z = getc;  # 入力ありなら受け取る。
	} elsif ($e++ > 20) {
        #$Z = "";   # 入力がないときは、0.2 秒ごとにスペースが入力されたとみなす。
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

# 盤上のチェック
sub check {

	my $i = shift;
	my $j = shift;

	my $true = 1;
	my $false = undef;
	if ($state[$i][$j] eq "") {
		# 未入力ならfalse;
		return $false;
	}

	my $checklen = 3;
	my $data = $state[$i][$j];
	
	# 横チェック
	if ( $date eq $state[$i][$j+1] && $date eq $state[$i][$j+2] ) {
		print "134" . $date . "\n";
		return $true;
	}
	if ( $date eq $state[$i+1][$j] && $date eq $state[$i+2][$j] ) {
		return $true;
	}
	if ( $date eq $state[$i+1][$j+1] && $date eq $state[$i+2][$j+2] ) {
		return $true;
	}
	if ( $date eq $state[$i-1][$j-1] && $date eq $state[$i-2][$j-2] ) {
		return $true;
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

# ターミナルの挙動を戻す。
system "stty sane";
