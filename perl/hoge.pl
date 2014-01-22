#!/usr/bin/perl

package Sandbox;
use Data::Dumper;
use strict;

my @in = (1..10);

print Dumper map { sqrt } @in;


package Sandbox::Sub;

sub subModule {
	my $func = shift @_;
	my ($param) = @_;
	print $param;
}
