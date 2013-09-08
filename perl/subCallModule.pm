package SubCallModule;

use strict;

sub doSomething {
	my @param = @_;

	# 戻り値用に空ハッシュを作成する。
	my $result = {};

	$result -> {success} = undef;
	$result -> {url} = "http://www.yahoo.co.jp";
	$result -> {param} = +{
					p => "hello",
				};

	return $result;

}

1;
