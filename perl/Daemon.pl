# Httpデーモンのサンプル
use HTTP::Daemon;
use HTTP::Status;

# 引数でport指定
my $d = HTTP::Daemon->new(
	LocalPort => 10080,
)|| die;
print "please contact me at <URL:", $d->url, ">\n";

# ポーリング処理
while (my $c = $d->accept) {

	# リクエストがあった場合
	while (my $r = $c->get_request) {
		# HTTPメソッドとurl
		if ($r->method eq 'GET' 
				and $r->url->path eq "/xyzzy" ) {
			$c->send_file_response("/etc/passwd");
		}
		else {
			$c->send_error(RC_FORBIDDEN)
		}
	}
	$c->close;
	undef($c);
}

