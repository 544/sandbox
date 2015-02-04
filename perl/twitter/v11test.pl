#!/usr/bin/perl
use strict;
use warnings;

use Net::SSL;
use Net::Twitter::Lite::WithAPIv1_1;
use Data::Dumper;
use YAML;

$ENV{PERL_LWP_SSL_VERIFY_HOSTNAME} = 0;

my $conf = YAML::LoadFile(".auth");
my $consumer_key = $conf->{consumer_key};
my $consumer_secret = $conf->{consumer_secret};
my $access_token = $conf->{access_token};
my $access_token_secret = $conf->{access_token_secret};

my $nt = Net::Twitter::Lite::WithAPIv1_1->new(
    consumer_key    => $consumer_key,
    consumer_secret => $consumer_secret,
    ssl => 1,
);
$nt->access_token($access_token);
$nt->access_token_secret($access_token_secret);

=pod
# id で検索
eval {
    my $id = "489446951184654337";
    my $res = $nt->get_oembed({id => $id});
    print $res->{html} if exists $res->{html};
};
=cut
if ($@) {
    print Dumper $@;
}

print "\n";

__END__
