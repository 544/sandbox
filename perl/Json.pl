use JSON qw/encode_json decode_json/;

my $json_in = '[{"name" : "Ken", "age" : 19}, {"name" : "Ken", "age" : 25}]';

my $data = decode_json($json_in);
