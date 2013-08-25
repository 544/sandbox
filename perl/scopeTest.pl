#!/usr/bin/perl

# グローバル変数を定義
$var = "global val\n";

print "global:" . $var;
&func1;
print "global:" . $var;
print "\n";

print "global:" . $var;
&func2;
print "global:" . $var;
print "\n";

print "global:" . $var;
&func3;
print "global:" . $var;
print "\n";

# localで変数を再宣言して表示
sub func1 {
	# ダイナミック変数なので一時的にパッケージ変数の中身を買える。
	local $var = "dinamic val\n";
	print "func:" . $var;
	# ダイナミック変数なのでinnerfuncの中でも有効
	&innerfunc;
}

# myで変数を再宣言して表示
sub func2 {
	# レキシカル変数なのでグローバル変数との関連はない。
	my $var = "lexical val\n";
	print "func:" . $var;
	# レキシカル変数なのでinnerfuncの中では無効
	&innerfunc;
}

# ourで変数を再宣言して表示
sub func3 {
	our $var = "changed global val\n";
	print "func:" . $var;
	&innerfunc;
}

# 関数から呼び出される関数のダミー
sub innerfunc {
	print "innerfunc:" . $var;
}
