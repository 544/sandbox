#!/usr/bin/perl

print "start\n";

eval {
	die "sinu";
};
if ( $@ ) {
	use Data::Dumper;
	print Dumper $@;
}
