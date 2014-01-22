use HTTP::Daemon;
use HTTP::Status;

my $d = HTTP::Daemon->new(
	LocalPort => 10080,
)|| die;
print "please contact me at <URL:", $d->url, ">\n";

while (my $c = $d->accept) {
	while (my $r = $c->get_request) {
		if ($r->method eq 'GET' and $r->url->path eq "/xyzzy" ) {
			$c->send_file_response("/etc/passwd");
		}
		else {
			$c->send_error(RC_FORBIDDEN)
		}
	}
	$c->close;
	undef($c);
}

