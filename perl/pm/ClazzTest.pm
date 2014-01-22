
package Clazz;
sub new {
	# 第一引数はクラス名
	my $thing = shift;	
	# パラメータの初期化
	my $class = ref $class || $thing;
	my $self = bless { @_ }, $class;
	$self->init() if $self->can('init');
	$self;
};

our %default = (name => 'any');

sub init {
	my $self = shift;
	$self->{$_} = $defalut{$_} for keys %default;
	$self;
}

package Clazz::Sub;
our @ISA = qw/Clazz/;

our %default = ('名前' => 'なし');

sub init {
	my $self = shift;
	$self->{$_} = $defalut{$_} for keys %default;
	$self->SUPER::init();
}
# new は継承
sub name {
	my $self = shift;
	$self->{name} = shift if @_;
	return $self->{name};
};

package main;
use Data::Dumper;
my $SEPA = "\n-------------\n";

print $SEPA;

# クラスのインスタンス化
my $hoge = Clazz::Sub->new();
$hoge->name("tarou");
print Dumper $hoge;

print $SEPA;

# クラスのインスタンス化（初期化も）
my $piyo = Clazz::Sub->new( name => "jirou" );
print Dumper $piyo;

1;
