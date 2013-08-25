#!/usr/bin/perl

print "please stop for CTRL-D\n";
while( $value = <STDIN> ) {		# 標準入力から文字を読み込む
	chomp($value); 			# 改行文字を除去
	print "hello $value \n";	# 出力する
}

