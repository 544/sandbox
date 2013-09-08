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
	debug (11,10,$x . $y);
	
	# 状態チェック
	if (check(@state)) {
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

	my @state = shift;

	my $true = 1;
	my $false = undef;

	# 横
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
	# 縦
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

# ターミナルの挙動を戻す。
system "stty sane";
