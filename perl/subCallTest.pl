#!/usr/bin/perl
use lib 'pm';

# 呼ばれる用サブモジュールのサンプル

use strict;
use Data::Dumper;

use SubCallModule;

print "sub module call test!!!\n";

my $result =  SubCallModule::doSomething;
if ($result->{success}) {
	print "success!!\n";
} else {
	print "fail\n";
}

print Dumper $result;

