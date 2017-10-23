#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my %last_name = qw !fred flintstone  Wilma Flintstone Barney Rubble
    betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE!;

for (sort by_lname_fname keys %last_name) {
    printf "%s %s\n", $_, $last_name{$_};
}

sub by_lname_fname {
    "\L$last_name{$a}" cmp "\L$last_name{$b}"
    or
    "\L$a" cmp "\L$b"
}
