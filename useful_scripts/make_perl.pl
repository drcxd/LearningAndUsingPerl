#!/usr/local/bin/perl

# This program just generate the usual header I will use when writing
# a new perl program with the given name.

use strict;
use warnings;
use 5.010;

die "Usage: ./make_perl.pl [file_name]" unless @ARGV == 1;

my $file_name = $ARGV[0];

open TO_MAKE, "> $file_name";

say TO_MAKE '#!/usr/local/bin/perl';
say TO_MAKE '';
say TO_MAKE 'use strict;';
say TO_MAKE 'use warnings;';
say TO_MAKE 'use 5.010;';

close TO_MAKE;
`chmod 755 $file_name`;
