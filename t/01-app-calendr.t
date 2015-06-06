#!perl -T

use 5.006;
use strict;
use warnings FATAL => 'all';
use App::calendr;
use Test::More;

eval "use Calendar::Bahai";
plan skip_all => "Calendar::Bahai required" if $@;

eval { App::calendr->new->run };
like($@, qr/Missing required arguments: name/);

eval { App::calendr->new({ name => 'xxx' })->run };
like($@, qr/Unsupported calendar/);

eval { App::calendr->new({ name => 'bahai', month => 'x', year => 172 })->run };
like($@, qr/did not pass type constraint/);

eval { App::calendr->new({ name => 'bahai', month => -1, year => 172 })->run };
like($@, qr/Invalid month/);

eval { App::calendr->new({ name => 'bahai', month => 0, year => 172 })->run };
like($@, qr/Invalid month/);

eval { App::calendr->new({ name => 'bahai', month => 1, year => 'x' })->run };
like($@, qr/did not pass type constraint/);

eval { App::calendr->new({ name => 'bahai', month => 1, year => -172 })->run };
like($@, qr/Invalid year/);

eval { App::calendr->new({ name => 'bahai', month => 1, year => 0 })->run };
like($@, qr/Invalid year/);

done_testing();
