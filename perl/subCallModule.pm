package SubCallModule;

use strict;

sub doSomething {
	my @param = @_;

	# 戻り値用の無名ハッシュ
	my $result = {};

	$result -> {success} = undef;
	$result -> {url} = "http://www.yahoo.co.jp";
	$result -> {param} = +{
					p => "hello",
				};

	return $result;

}

1;
