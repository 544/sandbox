# メソッドオーバーライドするテスト

use strict;
use warnings;

package Foo;

sub do_something {
    print "original method!!\n";
}

package main;

# 呼び出してみる
Foo->do_something();

# オリジナルのメソッドを保存
my $org_method = Foo->can("do_something");

# override glob
no warnings "redefine";
*Foo::do_something = sub  {
	print "override!!!\n";
};

# exec!
Foo->do_something();

# 戻す
no warnings "redefine";
*Foo::do_something = sub  {
	$org_method->();
};

#exec !
Foo->do_something();
