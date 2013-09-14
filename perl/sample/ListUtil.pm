# List::Util のテスト
use List::Util qw/min max shuffle sum first/;
use Data::Dumper;

my @input = 3..9;

print "\n";
print @input;
print "\n";
# 最大
print max @input;
print "\n";
# 最小
print min @input;
print "\n";
# シャッフル
print shuffle @input;
print "\n";
# 総和
print sum @input;
print "\n";
# マッチしたもの
print first { $_ % 5 == 0} @input;
print "\n";
