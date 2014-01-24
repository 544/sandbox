# perlのバージョンによってはスレッドが使えない
use Config;
$Config{useithreads} || die('Recompile Perl with threads to run this program.');

use strict;
use warnings;

use threads;
use Thread::Queue;

# 素数を探すプログラム
sub check_num { 
	my ($upstream, $cur_prime) = @_;
	my $kid;
	my $downstream = Thread::Queue->new();

	while (my $num = $upstream->dequeue()) {
		next unless ($num % $cur_prime);
		if ($kid) {
			$downstream->enqueue($num);
		} else {
			print ("Found prime : $num \n");
			$kid = threads->create(\&check_num, $downstream, $num);
			if (! $kid) {
				warn("sorry. run out of threads\n");
				last;
			}
		}
	}
	if ($kid) {
		$downstream->enqueue(undef);
		$kid->join();
	}
}

my $stream = Thread::Queue->new(3..100, undef);
check_num($stream, 2);

