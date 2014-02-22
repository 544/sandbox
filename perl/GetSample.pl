use HTTP::Cookies::Safari;

my $cookie_jar = HTTP::Cookies::Safari->new;
$cookie_jar->load( '/Users/masato/Library/Cookies/Cookies.plist' );

print $cookie_jar->load;



