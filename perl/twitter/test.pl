#!/usr/bin/perl

use strict;
use warnings;
use Net::Twitter;
use Data::Dumper;
use utf8;
use Encode;
use YAML;

# https://apps.twitter.com/ に定義したTwitter API 接続情報
my $conf = YAML::LoadFile(".auth");

my %CONSUMER_TOKENS = (
	consumer_key => $conf->{consumer_key},
	consumer_secret => $conf->{consumer_secret},
	access_token => $conf->{access_token},
	access_token_secret => $conf->{access_token_secret},
	apiurl => 'https://api.twitter.com/1.1',
	ssl => 1,
	legacy_lists_api=>0,
);

__END__
#API生成
#NOTE これがないと
# 500: Can't verify SSL peers without knowing which Certificate Authorities to trust
# でエラー
$ENV{'PERL_LWP_SSL_VERIFY_HOSTNAME'} = 0;
my $twi = Net::Twitter->new(%CONSUMER_TOKENS);

my $search_str = "ガンロワ";
my $res = $twi->search(
	{
		q => $search_str,
		lang => 'ja',
		#since_id => 446556759335768064,
	}
);

my $id_prefix = 'http://twitter.com/#!/ID/status/';

my %hs = %{$res};

foreach my $kk(keys %hs){
		print $kk."\t".$hs{$kk}."\n";
}

my @search_res = @{$hs{'statuses'}};
foreach my $rr (@search_res){
	print $rr->{created_at}."\n";
	print encode('utf-8',$rr->{text})."\n";
	print $id_prefix.$rr->{id}."\n";
	print "\n";
}

