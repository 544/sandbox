# Http$B%G!<%b%s$N%5%s%W%k(B
use HTTP::Daemon;
use HTTP::Status;

# $B0z?t$G(Bport$B;XDj(B
my $d = HTTP::Daemon->new(
	LocalPort => 10080,
)|| die;
print "please contact me at <URL:", $d->url, ">\n";

# $B%]!<%j%s%0=hM}(B
while (my $c = $d->accept) {

	# $B%j%/%(%9%H$,$"$C$?>l9g(B
	while (my $r = $c->get_request) {
		# HTTP$B%a%=%C%I$H(Burl
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

