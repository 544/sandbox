use strict;
use YAML;
use Data::Dumper;;

# $B%U%!%$%kFI$_9~$`(B
my $filename = "array.yaml";
open(IN, $filename) or die ("can't read file ".$filename);
read(IN, my $input, (-s $filename));
close(IN);

my $yaml = YAML::Load($input);
print "------ ARRAY --------\n";
print Dumper $yaml;
print "---------------------\n";

# $B%U%!%$%kFI$_9~$`(B
$filename = "hash.yaml";
open(IN, $filename) or die ("can't read file ".$filename);
read(IN, my $input, (-s $filename));
close(IN);

my $yaml = YAML::Load($input);
print "------ HASH --------\n";
print Dumper $yaml;
print "---------------------\n";

print Dumper $yaml->{Sunday}

